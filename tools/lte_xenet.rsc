:if ([/ping 8.8.8.8 count=10 size=64 interval=2s]=0) do={ /interface/lte/disable lte1 ; :delay delay-time=10s; /interface/lte/enable lte1}
