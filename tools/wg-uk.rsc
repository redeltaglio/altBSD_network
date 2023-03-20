:local int [/interface/wireguard/peers/get value-name=interface [find endpoint-address=uk.telecomlobby.com]] 
:local source [/ip/address/get value-name=address [find interface=$int]] 
:local ip [:toip [:pick $source 0 [:find $source "/"]]] 
:local pip ($ip - 1)
:if ([/ping $pip count=5 size=64 interval=2s vrf=vrf1]=0) do={ /interface/wireguard/peers/disable  [find endpoint-address=uk.telecomlobby.com] ; /interface/wireguard/peers/enable  [find endpoint-address=uk.telecomlobby.com]}
