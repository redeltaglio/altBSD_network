#!/bin/ksh

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

        ;;
        "add")
            echo "adding new Rdomain"
            i=$(ifconfig lo | grep rdom | wc -l)
            ((i+=1))
            lo=$(mktemp)
            cat /etc/hostname.lo1 > "${lo}"
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
            pn=$(getnetwork $(($(ls hostname.pair*[0-9] | wc -l) / 2)))
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
                        [ 0 -eq $(grep -c pair"${pi}" /etc/ripd.conf.1) ] && (
                            echo "interface pair${pi}" >> /etc/ripd.conf.1
                            rcctl restart ripd
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
                            ln -s /etc/rc.d/unbound /etc/rc.d/unbound${i}
                            cp -Rp /var/unbound /var/unbound${i}
                            rcctl enable unbound${i}
                            rcctl set unbound${i} rtable ${i}
                            rcctl set unbound${i} flags "-c /var/unbound${i}/etc/unbound.conf"
                            rcctl start "unbound${i}"
                        )
                    ;;
                esac
            done

        ;;
        *)
        ;;
    esac
}
