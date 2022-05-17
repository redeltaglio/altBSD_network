#!/bin/ksh

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
while [ -z $rd ]
do
    echo 'Enable ospf? [yes|no]'
    read ospf
done

PUBKEY="${psk}"
PRIVKEY=$(openssl rand -base64 32)
[[ "yes" == "${ospf}" ]] && wgaip="${net} 224.0.0.5/32 224.0.0.6/32" || wgaip="${net}"
ifconfig wg > /dev/null 2>&1
[ $? -eq 1 ] && (
    let i=0
)
[ $? -eq 0 ] && (
    let i=0
    for x in $(ifconfig wg | grep wg*[0-9] | cut -d : -f1 | sed "s|wg||g"); do
        [[ $x -gt $i ]] && i=$x
    done
    ((i+=1))

)
cat <<EOF > /etc/hostname.wg$i
wgkey $PRIVKEY
wgpeer $PUBKEY wgaip ${wgaip}
rdomain "{rd}"
inet ${ip}
wgport 1300$i
up
EOF

# start interface so we can get the public key
# we should have an error here, this is normal
sh /etc/netstart wg$i

PUBKEY=$(ifconfig wg$i | grep 'wgpubkey' | cut -d ' ' -f 2)
echo "You need $PUBKEY to setup the local peer"
