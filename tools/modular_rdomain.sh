#!/bin/ksh

ri=$(cat /etc/ospfd.conf | grep router-id | awk '{print $2}')

function getnetwork {
    local num=0                    # Initialize num
    while (( num < 255 ))     # Test num with the let
    do
    	(( num == 0 )) || (
            [ 0 -eq $(( num % 4 )) ] && (
                [ "${1}" -eq $(( num / 4 )) ] && echo $num
            )
        )
    	(( num=num + 1 ))     # Increment num
    done
}

function nr {
    case "${1}" in
        1)
            routerid=$(ifconfig vether0 | tail -n 1 | awk '{print $2}')
            md5nsdconf="5b878e86600303332a49da91071eda8a"
            echo "#FQ-Codel and HFSC OpenBSD packet schedulers." > "/etc/pf.conf.macro.queue.out"
            echo "#if link broken reply on the same interface" > "/etc/pf.conf.gre.tag.in"
            for g in $(ifconfig gre | grep gre*[0-9] | cut -d : -f1); do
                hg=$(mktemp)
                sed -i "/keepalive/d" "/etc/hostname.${g}"
                sed -i "/rtlabel/d" "/etc/hostname.${g}"
                sed -i "/route/d" "/etc/hostname.${g}"
                sed -i "s|up||g" "/etc/hostname.${g}"
                sed -i "s|!ifconfig ${g} tunnel|tunnel|" "/etc/hostname.${g}"
                head -n 1 "/etc/hostname.${g}" >> "${hg}"
            cat << EOF >> "${hg}"
rdomain 1
tunneldomain 0
-keepalive
EOF
                sed -i "/gro/d" "${hg}"
                sed '1d' "/etc/hostname.${g}" >>  "${hg}"
                echo "up" >> "${hg}"
                install -o root -g wheel -m 0640 "${hg}" "/etc/hostname.${g}"
                rm -rf "${hg}"
                echo "queue outq on ${g} bandwidth 55M max 60M flows 6144 qlimit 6144 default" >> "/etc/pf.conf.macro.queue.out"
                echo "pass in quick on ${g} to vether1 tagged PERMITTED reply-to ${g}" >> "/etc/pf.conf.gre.tag.in"
            done
            hl=$(mktemp)
        cat << EOF >> "${hl}"
rdomain 1
inet 127.0.0.1 0xff000000
inet6 ::1/128
up
!route -T 1 add 224/4 127.0.0.1
!route -T 1 add 127/8 127.0.0.1
!route -T 1 add ::/96 ::1
!route -T 1 add ::ffff:0.0.0.0/96 ::1
EOF
            install -o root -g wheel -m 0640 "${hl}" "/etc/hostname.lo1"
            rm -rf "${hl}"

            for i in 0 1; do
                hv=$(mktemp)
                echo "rdomain ${i}" > "${hv}"
                echo "inet ${routerid}/32" >> "${hv}"
                install -o root -g wheel -m 0640 "${hv}"  "/etc/hostname.vether${i}"
            done
            rm -rf "${hv}"
            hp=$(mktemp)
            for i in 0 1; do
                case "${i}" in
                    0)
                        cat << EOF > "${hp}"
description "gw-pair-0"
rdomain 0
inet 10.200.21.1/30
!/sbin/route -n add 10.0.0.0/8 10.200.21.2
!/sbin/route -n add 172.16.0.0/12 10.200.21.2
!/sbin/route -n add 192.168.0.0/16 10.200.21.2
EOF
                    ;;
                    1)
                    cat << EOF > "${hp}"
description "gw-pair-1"
rdomain 1
inet 10.200.21.2/30
patch pair0
!/sbin/route -T 1 -qn add default 10.200.21.1
EOF
                    echo "queue outq on pair${i} bandwidth 55M max 60M flows 6144 qlimit 6144 default" >> "/etc/pf.conf.macro.queue.out"
                    ;;
                esac
                install -o root -g wheel -m 0640 "${hp}"  "/etc/hostname.pair${i}"
            done
            rm -rf "${hp}"
            install -o root -g wheel -m 0640 "/home/taglio/Sources/Git/OpenBSD/src/etc/pf.conf.rdomain" "/etc/pf.conf"
            st=$(mktemp)
            head -n 1 "/etc/ssh/sshd_config" > "${st}"
            echo "ListenAddress ${routerid} rdomain 1" >> "${st}"
            cat "/etc/ssh/sshd_config" | sed "/ListenAddress/d" | sed '1d' >> "${st}"
            install -o root -g wheel -m 0640 "${st}" "/etc/ssh/sshd_config"
            rcctl set sshd rtable 1
            rm -rf "${st}"
            ot=$(mktemp)
            [[ -e "/etc/ospfd.conf.red" ]] || (

                grep redistribute "/etc/ospfd.conf" > "${ot}"
                install -o root -g wheel -m 0600 ${ot} "/etc/ospfd.conf.red"
            )
            head -n 1 "/etc/ospfd.conf" > "${ot}"
            echo "router-id ${routerid}" >> "${ot}"
            echo "rdomain 1" >> "${ot}"
            echo "include \"/etc/ospfd.conf.red\"" >> "${ot}"
            grep -A100000 "\# areas" "/etc/ospfd.conf">> "${ot}"
            sed -i "s|vether0|vether1|g" "${ot}"
            install -o root -g wheel -m 0600 ${ot} "/etc/ospfd.conf"
            rcctl set ospfd rtable 1

            [[ "${md5nsdconf}" == $(md5 "/var/nsd/etc/nsd.conf" | awk '{print $4}') ]] || (
                nt=$(mktemp)
                sed "s/ip-address: 10.*/ip-address: ${routerid}/" "/var/nsd/etc/nsd.conf" > "${nt}"
                install -o root -g _nsd -m 0640 ${nt} "/var/nsd/etc/nsd.conf"
                rm -rf ${nt}
            )

            ln -s /etc/rc.d/unbound /etc/rc.d/unbound1
            cp -Rp /var/unbound /var/unbound1
            sed -i "s|unbound|unbound1|g" /var/unbound1/etc/unbound.conf
            sed -i "s|unbound|unbound1|g" /var/unbound1/etc/remote-control.conf
            rcctl enable unbound1
            rcctl set unbound1 rtable 1
            rcctl set unbound1 flags "-c /var/unbound1/etc/unbound.conf"
            sed -i "/::1/d" /var/unbound1/etc/unbound.conf
            sed -i "s|do-ip6: yes|do-ip6: no|"  /var/unbound1/etc/unbound.conf
            [[ -e "/etc/rc.shutdown" ]] || (
                echo "echo \"nameserver 8.8.8.8\" >> /etc/resolv.conf" > /etc/rc.shutdown
                sed -i "/8.8.8.8/d" /etc/resolv.conf
                echo "sed -i \"/8.8.8.8/d\" /etc/resolv.conf" >> /etc/rc.local
            )
            ln -s /etc/rc.d/ntpd /etc/rc.d/ntpdaft
            rcctl enable ntpdaft
            rcctl disable ntpd
        ;;
        "add")
            echo "adding new Rdomain"
            for g in $(ifconfig gre | grep gre*[0-9] | cut -d : -f1); do
                rd=$(cat /etc/hostname.${g} | grep rdom  | awk '{print $2}')
                [ "${rd}" -ne 1 ] || break && (
                    sed -i "s|rdomain 1|rdomain 2|g" /etc/hostname.${g}
                    ifconfig "${g}" destroy
                    sh /etc/netstart "${g}"
                )
            done
            i=$(ifconfig lo | grep rdom | wc -l)
            ((i+=1))
            lo=$(mktemp)
            cat << EOF > "${lo}"
rdomain ${i}
inet 127.0.0.1 0xff000000
inet6 ::1/128
up
!route -T ${i} add 224/4 127.0.0.1
!route -T ${i} add 127/8 127.0.0.1
!route -T ${i} add ::/96 ::1
!route -T ${i} add ::ffff:0.0.0.0/96 ::1
EOF
            install -o root -g wheel -m 0640 "${lo}" /etc/hostname.lo"${i}"
            sh /etc/netstart lo"${i}"
            cp -p /etc/hostname.vether1 /etc/hostname.vether"${i}"
            sed -i "s|rdomain 1|rdomain ${i}|" /etc/hostname.vether"${i}"
            sh /etc/netstart vether"${i}"
            pn=$(getnetwork $(($(ls /etc/hostname.pair*[0-9] | wc -l) / 2)))
            pi=$(( $(ifconfig pair | grep mtu | cut -d : -f1 | sed "s|pair||g" | tail -n 1) + 1 ))
            for b in 1 2; do
                p=$(mktemp)
                r=$(mktemp)
                case "${b}" in
                    1)
                        ((pn+=1))
                        cat << EOF > "${p}"
description "gw-pair-${pi}"
rdomain 1
inet 10.200.21.${pn}/30
up
EOF
                        [[ -e "/etc/hostname.pair${pi}" ]] || (
                            install -o root -g wheel -m 0640 "${p}" /etc/hostname.pair"${pi}"
                            sh /etc/netstart pair"${pi}"
                        )
                        [ "${i}" -gt 1 ] && (
                            [ 0 -eq $(grep -c pair"${pi}" /etc/ripd.conf.1) ] && (
                                echo "interface pair${pi}" >> /etc/ripd.conf.1
                                rcctl restart ripd
                            )
                        )
                    ;;
                    2)
                        let opn=$pn
                        let opi=$pi
                        ((pn+=1))
                        ((pi+=1))
                        cat << EOF > "${p}"
description "gw-pair-${pi}"
rdomain ${i}
inet 10.200.21.${pn}/30
patch pair${opi}
!/sbin/route -T${i}  -qn add default 10.200.21.${opn}
EOF
                        [[ -e "/etc/hostname.pair${pi}" ]] || (
                            install -o root -g wheel -m 0640 "${p}" /etc/hostname.pair"${pi}"
                            sh /etc/netstart pair"${pi}"
                        )
                        cat << EOF > "${r}"
#$OpenBSD: ripd.conf,v 1.1 2014/07/11 21:20:10 deraadt Exp $
fib-update yes
redistribute 192.168.13.0/24
split-horizon poisoned
triggered-updates yes
rdomain ${i}
interface pair${pi}
EOF
                        [[ -e "/etc/ripd.conf.${i}" ]] || (
                            install -o root -g wheel -m 0600 "${r}" "/etc/ripd.conf.${i}"
                            ln -s /etc/rc.d/ripd "/etc/rc.d/ripd${i}"
                            rcctl enable "ripd${i}"
                            rcctl set "ripd${i}" rtable "${i}"
                            rcctl set "ripd${i}" flags "-f /etc/ripd.conf.${i} -s /var/run/ripd.sock.${i}"
                            rcctl start "ripd${i}"
                        )

                        [[ -d "/var/unbound${i}" ]] || (
                            sed -i "/::1/d" /etc/resolv.conf

                            ln -s /etc/rc.d/unbound /etc/rc.d/unbound${i}
                            cp -Rp /var/unbound /var/unbound${i}
                            sed -i "s|interface: ::1|#interface: ::1|" /var/unbound${i}/etc/unbound.conf
                            sed -i "s|do-ip6: yes|do-ip6: no|g" /var/unbound${i}/etc/unbound.conf
                            sed -i "/::/d" /var/unbound${i}/etc/forward-zone.conf
                            sed -i "s|unbound|unbound${i}|" /var/unbound${i}/etc/remote-control.conf
                            rcctl enable unbound${i}
                            rcctl set unbound${i} rtable ${i}
                            rcctl set unbound${i} flags "-c /var/unbound${i}/etc/unbound.conf"
                            rcctl start "unbound${i}"
                        )
                        case "${id}" in
                            2)
                                cat > /etc/ripd.con.1 << EOF
#       $OpenBSD: ripd.conf,v 1.1 2014/07/11 21:20:10 deraadt Exp $
redistribute 192.168.13.0/24
redistribute 172.16.0.0/12
fib-update yes
split-horizon poisoned
triggered-updates yes
rdomain 1
interface pair2
EOF
                                chmod 0600 /etc/ripd.conf.1
                                ln -s /etc/rc.d/ripd "/etc/rc.d/ripd1"
                                rcctl enable "ripd1"
                                rcctl set "ripd1" rtable "1"
                                rcctl set "ripd1" flags "-f /etc/ripd.conf.1 -s /var/run/ripd.sock.1"
                                rcctl start "ripd1"
                        	;;
                            3)
                                echo "detected rdomain 3, Wireguard LTE access"
                                for e in $(grep inet /etc/hostname.enc* | cut -d : -f1); do
                                    sed -i "/inet/d" "${e}"
                                    id=$(echo "${e}" | sed "s|/etc/hostname.enc||g")
                                    ifconfig gre"${id}" destroy
                                    ifconfig enc"${id}" destroy
                                    host=$(cat /etc/hostname.gre"${id}" | grep desc | cut -d \" -f2)
                                    rm -rf /etc/hostname.{gre,enc}"${id}"
                                    rm -rf /etc/iked.conf."${host}"
                                    ikectl reload
                                    sed -i "/interface gre${id}/,/}/d" /etc/ospfd.conf
                                    sed -i "/gre${id}/d" /etc/pf.conf.macro.gre.tag.in
                                    pfctl -f /etc/pf.conf
                                    rcctl restart ospfd
                                done
                                [[ -d "/etc/wireguard" ]] && rm -rf /etc/wireguard || (
                                    mkdir -p /etc/wireguard/{private,pubkeys}
                                    chmod -R 0600 /etc/wireguard/private
                                    openssl rand -base64 32 > /etc/wireguard/private/local.key
                                    chmod 0400 /etc/wireguard/private/local.key
                                    ifconfig wg > /dev/null 2>&1
                                    (( $? == 1 )) && i=0 || (
                                        i=0
                                        for x in $(ifconfig wg | grep wg*[0-9] | cut -d : -f1 | sed "s|wg||g"); do
                                            [[ $x -gt $i ]] && i=$x
                                        done
                                        ((i+=1))

                                    )
                                    ifconfig wg${i} create
                                    ifconfig wg${i} wgkey $(cat wireguard/private/local.key)
                                    pk=$(ifconfig | grep wgpubkey | awk '{print $2}')
                                    echo "add wireguard publickey ${pk} to client"
                                    psk=
                                    while [ -z $psk ]
                                    do
                                        echo 'Type client pubkey '
                                        read psk
                                    done
                                    net=
                                    while [ -z $net ]
                                    do
                                        echo 'Type /30 subnet '
                                        read net
                                    done
                                    ip=
                                    while [ -z $ip ]
                                    do
                                        echo 'Type wg tunnel ip '
                                        read ip
                                    done
                                    phn=
                                    while [ -z $phn ]
                                    do
                                        echo 'Type client public hostname '
                                        read phn
                                    done
                                    rd=3
                                    ospf="yes"

                                    PUBKEY="${psk}"
                                    [[ "yes" == "${ospf}" ]] && wgaip="${net} wgaip 224.0.0.5/32 wgaip 224.0.0.6/32" || wgaip="${net}"
                                    ifconfig wg > /dev/null 2>&1
                                    (( $? == 1 )) && i=0 || (
                                        i=0
                                        for x in $(ifconfig wg | grep wg*[0-9] | cut -d : -f1 | sed "s|wg||g"); do
                                            [[ $x -gt $i ]] && i=$x
                                        done
                                        ((i+=1))

                                    )
                                    install -o root -g wheel -m 0640 "/home/taglio/Sorces/Git/OpenBSD/src/etc/hostname.wg-X-" "/etc/hostname.wg${i}"
                                    sed -i "s|/X/|${i}|g" "/etc/hostname.wg${i}"
                                    sed -i "s|/WGLOCALIP/|${ip}|g" "/etc/hostname.wg${i}"
                                    sed -i "s|/POPHOST/|${phn}|g" "/etc/hostname.wg${i}"
                                    sh /etc/netstart wg"${i}"
                                )
                                cat << EOF > "/etc/ospfd.conf.${i}"
# $OpenBSD: ospfd.conf,v 1.2 2018/08/07 07:06:20 claudio Exp $
router-id ${ri}
rdomain ${id}
include "/etc/ospfd.conf.red"
# areas
area 0.0.0.0 {
         interface vether${id} {
                metric 1
                passive
        }
}
EOF
                                rcctl set ospfd"${id}" rtable "${id}"
                                rcctl start ospfd"${id}"
                                cp /etc/pf.conf /root/Backups/pf.conf."${RANDOM}"
                                install -o root -g wheel -m 0640 "/home/taglio/Sorces/Git/OpenBSD/src/etc/pf.conf.mr" /etc/pf.conf
                                pfctl -f /etc/pf.conf
                            ;;
                        esac
                    ;;
                esac
            done

        ;;
        *)
        ;;
    esac
}
nr "${1}"
