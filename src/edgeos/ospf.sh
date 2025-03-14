/opt/vyatta/sbin/vyatta-cfg-cmd-wrapper begin
/opt/vyatta/sbin/vyatta-cfg-cmd-wrapper set interfaces tunnel /TUN/ ip ospf authentication md5
/opt/vyatta/sbin/vyatta-cfg-cmd-wrapper set interfaces tunnel /TUN/ ip ospf authentication md5 key-id 1 md5-key /OSPFMD5/
/opt/vyatta/sbin/vyatta-cfg-cmd-wrapper set interfaces tunnel /TUN/ ip ospf dead-interval 40
/opt/vyatta/sbin/vyatta-cfg-cmd-wrapper set interfaces tunnel /TUN/ ip ospf hello-interval 10
/opt/vyatta/sbin/vyatta-cfg-cmd-wrapper set interfaces tunnel /TUN/ ip ospf priority 1
/opt/vyatta/sbin/vyatta-cfg-cmd-wrapper set interfaces tunnel /TUN/ ip ospf retransmit-interval 5
/opt/vyatta/sbin/vyatta-cfg-cmd-wrapper set interfaces tunnel /TUN/ ip ospf transmit-delay 1
/opt/vyatta/sbin/vyatta-cfg-cmd-wrapper set protocols ospf area 0.0.0.0 network /GRENETWORK/
/opt/vyatta/sbin/vyatta-cfg-cmd-wrapper set protocols ospf passive-interface-exclude /TUN/
/opt/vyatta/sbin/vyatta-cfg-cmd-wrapper commit
/opt/vyatta/sbin/vyatta-cfg-cmd-wrapper save

