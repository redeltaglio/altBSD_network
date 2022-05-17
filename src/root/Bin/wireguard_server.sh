#!/bin/ksh

case "${1}" in
    "create")
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

        rd=
        while [ -z $rd ]
        do
            echo 'Type wg tunnel rdomain '
            read rd
        done

        ospf=
        while [ -z $ospf ]
        do
            echo 'Enable ospf? [yes|no]'
            read ospf
        done

        PUBKEY="${psk}"
        PRIVKEY=$(openssl rand -base64 32)
        [[ "yes" == "${ospf}" ]] && wgaip="${net} wgaip 224.0.0.5/32 wgaip 224.0.0.6/32" || wgaip="${net}"
        ifconfig wg > /dev/null 2>&1
        (( $? == 1 )) && i=0 || (
            i=0
            for x in $(ifconfig wg | grep wg*[0-9] | cut -d : -f1 | sed "s|wg||g"); do
                [[ $x -gt $i ]] && i=$x
            done
            ((i+=1))

        )
        cat <<EOF > /etc/hostname.wg$i
wgkey $PRIVKEY
wgpeer $PUBKEY wgaip ${wgaip}
rdomain ${rd}
inet ${ip}/30
wgport 1300$i
up
EOF
        chmod 0640 /etc/hostname.wg$i
        # start interface so we can get the public key
        # we should have an error here, this is normal
        sh /etc/netstart wg$i
    ;;
    "add")
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

        i=
        while [ -z $i ]
        do
            echo 'Type wg tunnel interface id'
            read i
        done
        ospf=
        while [ -z $ospf ]
        do
            echo 'Enable ospf? [yes|no]'
            read ospf
        done
        PUBKEY="${psk}"
        [[ "yes" == "${ospf}" ]] && wgaip="${net} wgaip 224.0.0.5/32 wgaip 224.0.0.6/32" || wgaip="${net}"
        line=$(cat /etc/hostname.wg$i | grep -n wgpeer | tail -n 1 | cut -d : -f1)
        ((line+=1))
        awk 'NR=='"${line}"'{print "wgpeer $PUBKEY wgaip ${wgaip}"}1' /etc/hostname.wg$i
        line=$(cat /etc/hostname.wg$i | grep -n inet | tail -n 1 | cut -d : -f1)
        ((line+=1))
        awk 'NR=='"${line}"'{print "inet alias ${ip}/30"}1' /etc/hostname.wg$i
        chmod 0640 /etc/hostname.wg$i
        # start interface so we can get the public key
        # we should have an error here, this is normal
        sh /etc/netstart wg$i
    ;;
    "lonely")
        PRIVKEY=$(openssl rand -base64 32)
        ifconfig wg > /dev/null 2>&1
        (( $? == 1 )) && i=0 || (
            i=0
            for x in $(ifconfig wg | grep wg*[0-9] | cut -d : -f1 | sed "s|wg||g"); do
                [[ $x -gt $i ]] && i=$x
            done
            ((i+=1))

        )
        cat <<EOF > /etc/hostname.wg$i
wgkey $PRIVKEY
up
EOF
        sh /etc/netstart wg$i
    ;;
esac



PUBKEY=$(ifconfig wg$i | grep 'wgpubkey' | cut -d ' ' -f 2)
echo "You need $PUBKEY to setup the local peer"
