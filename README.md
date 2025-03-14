

# altBSD "guerrilla" services network.

![](https://github.com/redeltaglio/OpenBSD/raw/master/img/puffy/puflogv1000X650.gif)

A full configured, secure by default, encrypted network, a pile of services binded using virtual routing, domains and tables, concept.

Especially focused above security in every ISO/OSI pile level. 

### Theory behind

#### The reason why.

*Vatican corrupted priest, orders and bishops, a big part of Aristocracy and a lot of leafs (ancients aristocrats that wanna be), some corrupted secret services, para military and mafia are totally guilty about the recent destroy of democracy. They are owners and workers of an exploitation camp transmitted by electromagnetic weapons, radio that modulates hided behind FM broadcast official transmissions, and elaborated by artificial intelligence from the Collserola tower in Barcelona above all the Mediterranean area. Collserola is one of the most important hub of the human trade network in that area. Electronic slavery, the modern slavery that United Nation is investigating is my goal. With the same technology but with other type of use some nobles administrate Mafia, terrorism, manipulation, mental domination, corruption, fiscal frauds and so on. They use political dangerous territories, like the Catalan, as development camp. Development of absolutism and persecution to innocents, they call them political opponents. That system is the supply furnace of the political parties linked to organized crime that govern our countries, the Mediterranean. And I'm victim of as human guinea pig, as target individual.*

#### Concepts and layouts.

![Political Map](https://upload.wikimedia.org/wikipedia/commons/5/55/Political_Map_of_the_World.png)

In my project I consider Earth divided into three big groups which size is ruled by [longitude](https://en.wikipedia.org/wiki/Longitude):

```bash
[ $long -ge -180 && $long -le -60 ] && group=12 
[ $long -ge -60 && $long -le 60 ] && group=34
[ $long -ge 60 && $long -le 180 ] && group=56
```

Those are named as decimals or substantives: 

- `12, west`
- `34, center`
- `56, east`

Network is IKEv2 based full mesh layout, every host is connected to all the others:

![Network layout](https://github.com/redeltaglio/OpenBSD/raw/master/img/network_layout.png)For example:

```bash
flow esp in proto gre from 65.20.98.172 to 78.141.201.0 peer 65.20.98.172 srcid ASN1_DN//C=UK/ST=England/L=London/CN=uk.telecomlobby.com dstid ASN1_DN//C=ES/ST=Madrid/L=Madrid/O=Telecom Lobby/OU=VPNC/CN=choopa.telecomlobby.com type require
flow esp in proto gre from 94.72.143.163 to 78.141.201.0 peer 94.72.143.163 srcid ASN1_DN//C=UK/ST=England/L=London/CN=uk.telecomlobby.com dstid ASN1_DN//C=BG/ST=Lovech/L=Troyan/O=Telecom Lobby/OU=VPNC/CN=bg.telecomlobby.com type require
flow esp in proto gre from 139.180.165.223 to 78.141.201.0 peer 139.180.165.223 srcid ASN1_DN//C=UK/ST=England/L=London/CN=uk.telecomlobby.com dstid ASN1_DN//C=AU/ST=New South Wales/L=Sidney/CN=au.telecomlobby.com type require
flow esp in proto gre from 139.180.206.19 to 78.141.201.0 peer 139.180.206.19 srcid ASN1_DN//C=UK/ST=England/L=London/CN=uk.telecomlobby.com dstid ASN1_DN//C=JP/ST=Tokyo/L=Heiwajima/CN=jp.telecomlobby.com type require
flow esp in proto gre from 155.138.247.27 to 78.141.201.0 peer 155.138.247.27 srcid ASN1_DN//C=UK/ST=England/L=London/CN=uk.telecomlobby.com dstid ASN1_DN//C=US/ST=Texas/L=Dallas/O=Telecom Lobby/OU=VPNC/CN=us.telecomlobby.com type require
flow esp in proto gre from 216.238.100.26 to 78.141.201.0 peer 216.238.100.26 srcid ASN1_DN//C=UK/ST=England/L=London/CN=uk.telecomlobby.com dstid ASN1_DN//C=BR/ST=Sao Paulo/L=Sao Paulo/O=Telecom Lobby/OU=VPNC/CN=br.telecomlobby.com type require
flow esp out proto gre from 78.141.201.0 to 65.20.98.172 peer 65.20.98.172 srcid ASN1_DN//C=UK/ST=England/L=London/CN=uk.telecomlobby.com dstid ASN1_DN//C=ES/ST=Madrid/L=Madrid/O=Telecom Lobby/OU=VPNC/CN=choopa.telecomlobby.com type require
flow esp out proto gre from 78.141.201.0 to 94.72.143.163 peer 94.72.143.163 srcid ASN1_DN//C=UK/ST=England/L=London/CN=uk.telecomlobby.com dstid ASN1_DN//C=BG/ST=Lovech/L=Troyan/O=Telecom Lobby/OU=VPNC/CN=bg.telecomlobby.com type require
flow esp out proto gre from 78.141.201.0 to 139.180.165.223 peer 139.180.165.223 srcid ASN1_DN//C=UK/ST=England/L=London/CN=uk.telecomlobby.com dstid ASN1_DN//C=AU/ST=New South Wales/L=Sidney/CN=au.telecomlobby.com type require
flow esp out proto gre from 78.141.201.0 to 139.180.206.19 peer 139.180.206.19 srcid ASN1_DN//C=UK/ST=England/L=London/CN=uk.telecomlobby.com dstid ASN1_DN//C=JP/ST=Tokyo/L=Heiwajima/CN=jp.telecomlobby.com type require
flow esp out proto gre from 78.141.201.0 to 155.138.247.27 peer 155.138.247.27 srcid ASN1_DN//C=UK/ST=England/L=London/CN=uk.telecomlobby.com dstid ASN1_DN//C=US/ST=Texas/L=Dallas/O=Telecom Lobby/OU=VPNC/CN=us.telecomlobby.com type require
flow esp out proto gre from 78.141.201.0 to 216.238.100.26 peer 216.238.100.26 srcid ASN1_DN//C=UK/ST=England/L=London/CN=uk.telecomlobby.com dstid ASN1_DN//C=BR/ST=Sao Paulo/L=Sao Paulo/O=Telecom Lobby/OU=VPNC/CN=br.telecomlobby.com type require
```

When we rent a VPS instance in a provider we've got to understand that it is a virtual machine guest, normally qemu driven, that runs as a process of a KVM server, normally Linux based,  perhaps also clustered with others that bind resources as CPU, GPU,  networking and storage resources administrated by the host system operative, Xen or similars, that resides into a physical rack in a data center; the data center itself normally is part of an Internet exchange point to guarantee awesome BGP peering.

![](https://github.com/redeltaglio/OpenBSD/raw/master/img/whatisavps.jpg)

By the way we add more abstraction to this very complicated environment. In our design concept VPS are considered as divided into different routing domains, [rdomain(4)](https://man.openbsd.org/rdomain.4) as they're known in OpenBSD. Is important to understand that there are some fixed rdomains in our design with some specifics functions:

- rdomain 0: IKEv2 service.
- rdomain 1: OSPFv2 stub area 1.1.1.1
- rdomain 2: GRE tunnels local networks and OSPFv2 backbone area 0.0.0.0
- rdomain 3: WG tunnels LTE appliance connections and OSPFv2 area 3.3.3.3.
- rdomain 4: WG tunnels to roadwarrior systems. For now a FreeBSD laptop called `1969` and OSPFv2 area 4.4.4.4.
- rdomain id mayor than 10: isolated Internet services.
- rdomain id mayor than 100: isolated services rented to public.

![](https://github.com/redeltaglio/OpenBSD/raw/master/img/rdomains_explained.jpg)

In that design we implement some networking technologies not very commons as:

- [pair(4)](https://man.openbsd.org/pair)
- [egre(4)](https://man.openbsd.org/egre)

#### VPS provider election

```bash
taglio@trimurti:~/Work/telecom.lobby/OpenBSD$ ssh ganesha.telecom.lobby
    ____                 __     ____       __                __
   / __ \___  ________  / /_   / __ \___  / /_  ____  ____  / /_
  / /_/ / _ \/ ___/ _ \/ __/  / /_/ / _ \/ __ \/ __ \/ __ \/ __/
 / _, _/  __(__  )  __/ /_   / _, _/  __/ /_/ / /_/ / /_/ / /_
/_/ |_|\___/____/\___/\__/  /_/ |_|\___/_.___/\____/\____/\__/

OpenBSD 7.1 (GENERIC) #3: Sun May 15 10:25:28 MDT 2022
    root@syspatch-71-amd64.openbsd.org:/usr/src/sys/arch/amd64/compile/GENERIC
real mem = 1056813056 (1007MB)
avail mem = 1007652864 (960MB)
 7:39PM  up 13 days,  1:22, 2 users, load averages: 0.12, 0.11, 0.20
ID              Pri State        DeadTime Address         Iface     Uptime
192.168.13.43   1   FULL/BCKUP   00:00:33 10.200.21.5     pair3     01w6d01h
192.168.13.46   1   FULL/DR      00:00:33 10.200.21.246   egre5     01w0d18h
192.168.13.45   1   FULL/BCKUP   00:00:32 10.200.21.250   egre3     4d22h39m
192.168.13.55   1   FULL/P2P     00:00:32 10.10.10.61     gre9      01w0d10h
192.168.13.61   1   FULL/P2P     00:00:32 10.10.10.161    gre6      1d21h32m
192.168.13.59   1   FULL/P2P     00:00:32 10.10.10.209    gre4      4d05h59m
192.168.13.81   1   FULL/P2P     00:00:32 10.10.10.217    gre3      01w0d10h
192.168.13.1    1   FULL/P2P     00:00:34 10.10.10.225    gre2      06:06:25
192.168.13.14   1   FULL/P2P     00:00:32 10.10.9.93      gre15     4d04h37m
192.168.13.34   1   FULL/P2P     00:00:37 10.10.10.230    gre1      1d07h14m
This is the LAST time I take travel suggestions from Ray Bradbury!
taglio@ganesha:/home/taglio$

```

First of all you've got to rent a VPS in one service provider, there are a lot on Internet a great resource to find the correct one is this website:

- [Low End Box - Cheap VPS, Dedicated Servers and Hosting Deals](https://lowendbox.com/)

Some that I use or I've used:

- [SSD VPS Servers, Cloud Servers and Cloud Hosting by Vultr - Vultr.com](https://www.vultr.com/)
- [AlphaVPS - Cheap and Reliable Hosting and Servers](https://alphavps.com/)
- [VPS Hosting in Europe and USA. Join VPS2DAY now!](https://www.vps2day.com/)
- [Liveinhost Web Services &#8211; The Best Web Hosting | Fast Professional Website Hosting Services](https://www.liveinhost.com/)
- [Scaleway Dedibox | The Reference for Dedicated Servers  | Scaleway](https://www.scaleway.com/en/dedibox/)
- [CreeperHost](https://www.creeperhost.net/)
- [GINERNET, your Hosting and Server provider in Spain](https://ginernet.com/en/)
- [Hostafrica](https://hostafrica.com)

Goal is security trough simplicity, open source design and the correct use and implementation of robust compliance protocols and daemons. The networking system operative is [OpenBSD](https://www.openbsd.org/) and the server one is [NetBSD](https://netbsd.org/). Speaking about the WISP appliance we implement some proprietary Linux based SO while remote ham radio stash are guided by [RaspiOS](https://www.raspbian.org/), a [Debian](https://www.debian.org/) based distro.

#### VPS without OpenBSD as system available

Many times we've got to resolve problems like the one where OpenBSD isn't listed as a default system operative in our remote KVM administration web console. This isn't our death.

First of all install a classic Linux, like Debian for example. Next ssh to the new machine with the credentials provided. Next download the latest stable `miniroot` image into the root and write it to the start of our virtual disk, in linux normally  it will be `vda`. Or if it is not find it with `fdisk -l`.

```sh
# wget https://cdn.openbsd.org/pub/OpenBSD/7.0/amd64/miniroot70.img
# dd if=miniroot70.img of=/dev/vda bs=4M
```

 After the successful write to the virtual disk we've got to reboot the machine but we will do it in a particular way using the `proc` filesystem:

```shell
# echo s > /proc/sysrq-trigger
# echo b > /proc/sysrq-trigger 
```

#### The console control script

A single script coded using `bash` hard coded scripting language to use from the system administrator workstation. Those are the options:

```bash
./console -I telecom.lobby -SO [openbsd|mikrotik|edgeos|raspi|ALL] -T -> tmux and SSH to hosts [o]
./console -I telecom.lobby -SO [openbsd|mikrotik|edgeos|raspi|ALL] -P -> syspatch [o]
./console -I telecom.lobby -SO [openbsd|mikrotik|edgeos|ALL] -N -> newhost OpenBSD host [o]
./console -I telecom.lobby -SO [openbsd|mikrotik|edgeos|ALL] -C -> cleanlast [o]
./console -I telecom.lobby -SO [openbsd|edgeos|ALL] -F -> single file update [o]
./console -I telecom.lobby -SO [ALL] -KD  -> print all IPsec certificates deadlines [o]
./console -I telecom.lobby -SO [openbsd] -G -> git pull [o]
./console -I telecom.lobby -SO [openbsd] -S -> scripts [o]
./console -I telecom.lobby -SO [openbsd] -D -> dyndnspop [o]
./console -I telecom.lobby -SO [openbsd] -7 -> changes to 7.0 release [o]
./console -I telecom.lobby -SO [openbsd] -PF -> changes to PF firewall [o]
./console -I telecom.lobby -SO [mikrotik] -LTE -> new RouterOS LTE Router instance [o]
./console -I telecom.lobby -SO [mikrotik] -CHR -> new RouterOS Cloud Hosted Router istance [o] 
./console -I telecom.lobby -SO [workstation] -GR6 -> add IPv6 ULA to gre tunnel interfaces [o]
./console -I telecom.lobby -SO [workstation] -RS  -> repository ssh update [o]
./console -I telecom.lobby -SO [workstation] -Z   -> global network domains setup [o]
./console -I telecom.lobby -SO [workstation] -GEO -> get IP address geo group [o]
./console -I telecom.lobby -SO [workstation] -CU  -> single certificate upgrade / change [o]
./console -I telecom.lobby -SO [workstation] -U   -> update the workstation's user EdDSA certificate [o]
./console -I telecom.lobby -SO [workstation] -CI  -> custom installation templates [o]
./console -I telecom.lobby -SO [workstation] -K   -> new IKED pk12 archive [o]
./console -I telecom.lobby -SO [workstation] -NDS -> encrypt TXT DNS record [o]

```

#### Generate custom `install.conf` and `disklabel` for new host

Sometimes it would be interesting that end user generate files in the `installation/` because of different `VPS` provider specifications.  `console` script got `-CI` as the correct option to do it in a simple way:

```bash
taglio@trimurti:~/Work/telecom.lobby/OpenBSD$ ./console -I telecom.lobby -CI
Build IPv4 static custom installation template? yes/no: yes
Type IPv4 address for vio0: 160.119.248.111
Type netmask for vio0: 255.255.255.0
Type default IPv4 route: 160.119.248.1  
Build custom size disklabel? yes/no: yes
Type size in GB: 20
Files added, please update the repository and remember to use https://bit.ly/3HD0Wne
taglio@trimurti:~/Work/telecom.lobby/OpenBSD$
```

Next update the repository as usual.

#### Semi automatic system installation

Open the `KVM` web console and the installation process of OpenBSD will start. Interrupt it choosing for the (S)hell option. In the case you want to run the installation process after having already done it you can do it typing at boot prompt `boot bsd.rd`. Next: 

```shell
# dhclient vio0
# cd /tmp && ftp -o install.conf https://bit.ly/3mEYdAo #static ip
# cd /tmp && ftp -o install.conf https://bit.ly/3vmeL4X #dynamic ip
# cd /tmp && ftp -o install.conf https://bit.ly/3xHXtBX # 7.1
# install -af /tmp/install.conf
# reboot
```

From [release 7.0](https://www.openbsd.org/70.html) command to obtain dynamic IPv4 configuration will be:

```bash
# ifconfig vio0 autoconf
```

If there is no dhcp or slaac server active in the network you can manual configure networking:

```bash
# ifconfig vio0 160.119.248.111/24
# route add 0.0.0.0/0 160.119.248.1
# echo nameserver 8.8.8.8 > /etc/resolv.conf
```

The default `root` password in our `install.conf` file is `123456789`. But it is encrypted as `$2b$10$4tPKeRmxVyffVkrQMve70.CiPmE28khH9UXiuSYpzAKbZrOfQq0Pm`.

The default `uid 1000` user is `taglio`, my nickname and unix user. You can update `installation/install-vps` file with your. I also specify my `ed25519` ssh key that I've got generated with `ssh-keygen -t ed25519 -C "taglio@telecom.lobby"`as you can appreciate in the configuration file:

`Public ssh key for user = ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKG4yMhKX37SXV8LGDuVe4r1PBSS5HOWb6jFpNiG3cvW taglio@telecom.lobby`

*Please update this file with your specifications forking my repository*.

After the reboot login in the new node and change the password and upgrade the system with `syspatch`.

#### [![OpenBSD MESH IPSec guerrila host](https://img.youtube.com/vi/6-M4IxeSctI/0.jpg)](https://www.youtube.com/watch?v=6-M4IxeSctI "OpenBSD MESH IPSec guerrila host")

##### Notes about syspatch and version 7.1

Notes from [deraadt@](https://www.theos.com/deraadt/) onto [errata71.html](https://www.openbsd.org/errata71.html):

```bash
# sed -i /release/d /usr/sbin/syspatch && syspatch -R && syspatch
```

Or run syspatch another time after `001_wifi` install.

#### First steps

First of all I want to underline that we use some values in the `DNS` master zone of the domain where we want to attach our new `VPS` host. 

``` shell
root@ganesha:/var/nsd/zones/master# cat telecomlobby.com.zone | grep ipsec && cat telecomlobby.com.zone | grep gre
ipsec20591		IN TXT "uk:ganesha;us:saraswati;jp:shiva;es:indra;fr:uma;bg:neo;"
gre7058			IN TXT "216"
gre18994		IN TXT "3"
root@ganesha:/var/nsd/zones/master#
```

> Remember that is important also take care about the subnet range in the case that the number interfaces multiplied by four give a number inferior that the last ip or we've got to add another subnet as we discuss below in "routine maintenance" section.

We use the [TXT record](https://en.wikipedia.org/wiki/TXT_record) to add some more information to the process of automatically add the new host to our MESH network. Hostname are:

```shell
root@ganesha:/var/nsd/zones/master# echo ipsec${RANDOM} && echo gre${RANDOM} && echo gre${RANDOM}
ipsec6150
gre9262
gre1331
root@ganesha:/var/nsd/zones/master# 
```

```$RANDOM``` is a special variable in `ksh` used to generate random numbers between 0 and 32767.

The string specified by `TXT` value of `ipsec` is `;` separated values and contain [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) [country codes](https://en.wikipedia.org/wiki/Country_code) followed by `:` and the name of the host machine.

The string specified by `TXT` values of the two `gre` are integer, the first between  0 and 255 indicating last /30 network allocated by a `gre` point to point and the second is a counter indicating the number of MESH guerrilla OpenBSD hosts.

Remember to update those `TXT` to archive the connection process.

It's important also to configure DNS resolution and also [RDNS](https://en.wikipedia.org/wiki/Reverse_DNS_lookup) of the assigned IPv4 address in our master zone. Depending on the provider adding the reverse dns resolution host it could be writing to the support office or simply use a web mask.

[![OpenBSD MESH IPSec guerrila host](https://asciinema.org/a/417997.png)](https://asciinema.org/a/417997)

Next we've got to update the master zone of the principle public domain, in my case `telecomlobby.com`.

The first value to update is the IPv4 of the new machine:

```shell
riccardo@trimurti:~/Work/telecom.lobby/OpenBSD$ dig de.telecomlobby.com A +short
45.63.116.141
riccardo@trimurti:~/Work/telecom.lobby/OpenBSD$ ssh ganesha.telecom.lobby
Host key fingerprint is SHA256:mZiIJWncSs+jJUjAho8NNQeO1wSHKVpFORP5wZdDaNo
+--[ED25519 256]--+
|+.=BB= o..       |
|=*+O= = +        |
|+OO +B o .       |
|+=oB..Eo o       |
|. + * o S        |
|   + .           |
|  .              |
|                 |
|                 |
+----[SHA256]-----+
OpenBSD 6.9 (GENERIC) #2: Sat May 22 12:49:54 MDT 2021
    root@syspatch-69-amd64.openbsd.org:/usr/src/sys/arch/amd64/compile/GENERIC
real mem = 1056813056 (1007MB)
avail mem = 1009553408 (962MB)
10:49AM  up 2 days, 23:46, 2 users, load averages: 0.01, 0.02, 0.00
ID              Pri State        DeadTime Address         Iface     Uptime
192.168.13.59   1   FULL/P2P     00:00:34 10.10.10.201    gre4      02:55:38
192.168.13.81   1   FULL/P2P     00:00:30 10.10.10.217    gre3      06:51:01
192.168.13.1    1   FULL/P2P     00:00:36 10.10.10.225    gre2      06:45:49
192.168.13.34   1   FULL/P2P     00:00:33 10.10.10.230    gre1      06:51:03
192.168.13.33   1   FULL/P2P     00:00:36 10.10.10.250    gre0      1d06h55m
Go 'way!  You're bothering me!
 
riccardo@trimurti:~/Work/telecom.lobby/OpenBSD$ doas su
doas (taglio@ganesha.telecom.lobby) password: 
root@ganesha:/home/taglio# cd /var/nsd/zones/master
root@ganesha:/var/nsd/zones/master# cat telecomlobby.com.zone | grep vpnc 
vpnc			IN A 45.32.144.15
vpnc			IN A 78.141.201.0
vpnc			IN A 155.138.247.27
vpnc			IN A 139.180.206.19
vpncN			IN A 94.72.143.163
vpnc			IN TXT "RT-01.cat.telecomlobby.com"
root@ganesha:/var/nsd/zones/master# 

```

As you can see theres some values about the `vpnc` and `vpncN` host:

- `vpnc IN A` in the list of public IPv4 that are connected through IPsec in our MESH network.
- `vpncN IN A` in the new host to add to.

Upgrade the configuration to reflect to new one and test it:

``` shell
riccardo@trimurti:~$ dig @8.8.8.8 vpnc.telecomlobby.com A +short
45.32.144.15
78.141.201.0
155.138.247.27
139.180.206.19
94.72.143.163
riccardo@trimurti:~$ dig @8.8.8.8 vpncN.telecomlobby.com A +short
45.63.116.141
riccardo@trimurti:~$ 
```

In my configuration I've got an an IPv4 [EdgeOS](https://dl.ubnt.com/guides/edgemax/EdgeOS_UG.pdf) endpoint. In EdgeOS I've got to  add the `ROUTERID` of the new OpenBSD mesh host to the relative address-group and to the policy access list 10 using the correct rule number.

```shell
root@indra# set firewall group address-group OPENBSD address 216.238.100.26
[edit]
root@indra# 
root@indra# set firewall group address-group ROUTERID address 192.168.13.55
[edit]
root@indra# set policy access-list 10 rule 15 action permit
[edit]
root@indra# set policy access-list 10 rule 15 source host 192.168.13.55
[edit]
root@indra# set protocols static interface-route 216.238.100.26/32 next-hop-interface pppoe0 description xolotl
[edit]
root@indra# commit
[edit]
root@indra# save
Saving configuration to '/config/config.boot'...
Done
[edit]
root@indra# exit
```

Also use the `console` script to populate the correct geoip address-list in the EdgeOS WISP endpoint:

```bash
taglio@trimurti:~/Work/telecom.lobby/OpenBSD$ ./console -I telecom.lobby -GEO
Type public IP: 79.116.90.131
{
  "ip": "79.116.90.131",
  "hostname": "79-116-90-131.digimobil.es",
  "city": "Girona",
  "region": "Catalonia",
  "country": "ES",
  "loc": "41.9831,2.8249",
  "org": "AS57269 DIGI SPAIN TELECOM S.L.U.",
  "postal": "17001",
  "timezone": "Europe/Madrid",
}
LAT --> 41
LONG --> 2
GROUP --> 34
Do you want to add it to correct firewall address-group into EdgeOS: yes/no yes
/opt/vyatta/sbin/vyatta-cfg-cmd-wrapper begin
/opt/vyatta/sbin/vyatta-cfg-cmd-wrapper set firewall group address-group 34 address 79.116.90.131
/opt/vyatta/sbin/vyatta-cfg-cmd-wrapper commit
/opt/vyatta/sbin/vyatta-cfg-cmd-wrapper save
OK? yes/no yes
Linux indra 4.9.79-UBNT #1 SMP Wed Oct 28 16:51:13 UTC 2020 mips64
Welcome to EdgeOS
Saving configuration to '/config/config.boot'...
Done
taglio@trimurti:~/Work/telecom.lobby/OpenBSD$ 
```

If we've got some RouterOS into the OSPF backbone area we 've got to update the address list relative to the host presents in my IPSec network:

```shell
[admin@uma.telecom.lobby] /ip firewall address-list> add list=ipsec comment=durga address=45.63.116.141/32
[admin@uma.telecom.lobby] /ip firewall address-list> 
```

If in our constellation we've got more than one RouterOS or EdgeOS instance please do the same in every one.

#### Update the IPSec CA server 

Now start to configure the `CA server` about the `IPsec` public and private key.

In my network layout I've got a [Mikrotik](https://mikrotik.com/) virtual machine that I use to administrate the `IPsec` certificate repository, it is called `uma`. Use [ipinfo](https://ipinfo.io/) to obtain data about the `SSL` variables to fill, we can query the database using IPv4 or IPv6 like I've done in this example:

```bash
taglio@trimurti:~/Work/telecom.lobby/OpenBSD$ curl http:/ipinfo.io/2001:19f0:b400:1655:5400:03ff:fea7:c37b      
{
  "ip": "2001:19f0:b400:1655:5400:03ff:fea7:c37b",
  "city": "El Colorado",
  "region": "Querétaro",
  "country": "MX",
  "loc": "20.5618,-100.2452",
  "org": "AS20473 The Constant Company, LLC",
  "postal": "76246",
  "timezone": "America/Mexico_City",
  "readme": "https://ipinfo.io/missingauth"
}
taglio@trimurti:~/Work/telecom.lobby/OpenBSD$ 
```

[![Mikrotik CA certificate](https://img.youtube.com/vi/A7O_Pe91a6Y/0.jpg)](https://youtu.be/A7O_Pe91a6Y "Mikrotik CA certificate")



You can use also the RouterOS console:

```shell
[admin@uma.telecom.lobby] > /certificate add name=au.telecomlobby.com country=AU s
tate="New South Wales" locality=Sidney common-name=au.telecomlobby.com subject-alt
-name=email:vishnu@ca.telecomlobby.com
[admin@uma.telecom.lobby] >
```

Then sign it with the CA certificate and trust it.

Download the [p12](https://en.wikipedia.org/wiki/PKCS_12) archive from the Mikrotik CA server:

``` shell
sftp> get cert_export_de.telecomlobby.com.p12 de.telecomlobby.com.p12
Fetching /cert_export_de.telecomlobby.com.p12 to de.telecomlobby.com.p12
/cert_export_de.telecomlobby.c 100% 3880    74.6KB/s   00:00    
sftp> ^D
riccardo@trimurti:~/Work/redama/durpa$ 
```

You can use the `tools/pk12extract` script to manipulate the `pk12` archive and obtain different formats.

Next use the script `console` to add the new public IPSec key to the `src/etc/iked/pubkeys/ufqdn` directory update the repository (this time I'll use `mx.telecomlobby.com` because thinks are changed at 11/2021). Script will also upload archive to the new OpenBSD VPS into the `/tmp` directory:

```shell
taglio@trimurti:~/Work/telecom.lobby/OpenBSD$ ./console -I telecom.lobby -K
Type the PATH to the new iked PK12 file 
/home/taglio/Work/redama/ipsec/xolotl/mx.telecomlobby.com.p12
# Host mx.telecomlobby.com found: line 170
/home/taglio/.ssh/known_hosts updated.
Original contents retained as /home/taglio/.ssh/known_hosts.old
The authenticity of host 'mx.telecomlobby.com (216.238.69.44)' can't be established.
ECDSA key fingerprint is SHA256:D9BLMj/rAp0UfZ/PgY/woXUh+v4wJBK0DFkeCXRLUMg.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added 'mx.telecomlobby.com' (ECDSA) to the list of known hosts.
Warning: the ECDSA host key for 'mx.telecomlobby.com' differs from the key for the IP address '216.238.69.44'
Offending key for IP in /home/taglio/.ssh/known_hosts:166
Are you sure you want to continue connecting (yes/no)? yes
mx.telecomlobby.com.p12                                                                                                                                                                                                                                 100% 3880    16.3KB/s   00:00    
xolotl@ca.telecomlobby.com created please update repository and all the others Openbsd hosts
taglio@trimurti:~/Work/telecom.lobby/OpenBSD$ ./console -I telecom.lobby -G
taglio@trimurti:~/Work/telecom.lobby/OpenBSD$ ./console -I telecom.lobby -N

```

#### Inet6

Ipv6 need special attention in case of dynamic address configuration. Look at our template:

```bash
taglio@trimurti:~/Work/telecom.lobby/OpenBSD$ cat src/etc/hostname.egress | grep inet6 | grep -v \-
inet6 autoconf temporary -soii
taglio@trimurti:~/Work/telecom.lobby/OpenBSD$ 
```

We've got three options to the [inet6](https://en.wikipedia.org/wiki/IPv6) family for the `egress` interface:

- `autoconf`,  [slaacd(8)](https://man.openbsd.org/slaacd) automatically configures IPv6 addresses for interfaces with AUTOCONF6  set.
- `temporary`,  enable temporary address extensions for stateless IPv6 address autoconfiguration [RFC 8981](https://datatracker.ietf.org/doc/html/rfc8981) on the interface. The purpose of these extensions is to prevent tracking of individual devices which connect to the IPv6  internet from different networks using stateless autoconfiguration. 
- `soii` , enable persistent Semantically Opaque Interface Identifier , as per [RFC 7217](https://datatracker.ietf.org/doc/html/rfc7217), for SLAAC addresses on the interface.

As you can understand the last twos are security extensions to guarantee more privacy upon the inet6 configuration, next we will apply even more security using [pf](https://www.openbsd.org/faq/pf/) . We can retry more information using [ifconfig(8)](https://man.openbsd.org/ifconfig.8) and [slaacctl(8)](https://man.openbsd.org/slaacctl.8).

```bash
taglio@ganesha:/home/taglio/Work/telecomlobby.com/bin$ ifconfig egress inet6
vio0: flags=248843<UP,BROADCAST,RUNNING,SIMPLEX,MULTICAST,AUTOCONF6TEMP,AUTOCONF6> mtu 1500
        lladdr 56:00:02:79:3b:4d
        index 1 priority 0 llprio 3
        groups: egress
        media: Ethernet autoselect
        status: active
        inet6 fe80::5400:2ff:fe79:3b4d%vio0 prefixlen 64 scopeid 0x1
        inet6 2001:19f0:7401:8c01:25f9:5be9:8daa:f2d5 prefixlen 64 autoconf pltime 604554 vltime 2591754
        inet6 2001:19f0:7401:8c01:8b1f:e3eb:c78d:77f4 prefixlen 64 deprecated autoconf temporary pltime 0 vltime 86385
        inet6 2001:19f0:7401:8c01:739b:2a15:122e:6f6b prefixlen 64 autoconf temporary pltime 48768 vltime 156889
taglio@ganesha:/home/taglio/Work/telecomlobby.com/bin$ slaacctl show interface  
vio0:
         index:   1 running: yes temporary: yes
        lladdr: 56:00:02:79:3b:4d
         inet6: fe80::5400:2ff:fe79:3b4d%vio0
        Router Advertisement from fe80::fc00:2ff:fe79:3b4d%vio0
                received: 2021-12-28 10:13:39; 88s ago
                Cur Hop Limit:  64, M: 0, O: 0, Router Lifetime:  1800s
                Default Router Preference: Medium
                Reachable Time:         0ms, Retrans Timer:         0ms
                MTU: 1500 bytes
                prefix: 2001:19f0:7401:8c01::/64
                        On-link: 1, Autonomous address-configuration: 1
                        vltime:    2592000, pltime:     604800
                rdns: 2001:19f0:300:1704::6, lifetime: 3600
        Address proposals
                id:    8, state:      CONFIGURED, temporary: y
                vltime:     156879, pltime:      48758, timeout:      48655s
                updated: 2021-12-28 10:13:39; 88s ago
                2001:19f0:7401:8c01:739b:2a15:122e:6f6b, 2001:19f0:7401:8c01::/64
                id:    6, state:      CONFIGURED, temporary: y
                vltime:      86375, pltime:          0, timeout:      86272s
                updated: 2021-12-28 10:13:39; 88s ago
                2001:19f0:7401:8c01:8b1f:e3eb:c78d:77f4, 2001:19f0:7401:8c01::/64
                id:    5, state:      CONFIGURED, temporary: n
                vltime:    2592000, pltime:     604800, timeout:     604697s
                updated: 2021-12-28 10:13:39; 88s ago
                2001:19f0:7401:8c01:25f9:5be9:8daa:f2d5, 2001:19f0:7401:8c01::/64
        Default router proposals
                id:    4, state:      CONFIGURED
                router: fe80::fc00:2ff:fe79:3b4d%vio0
                router lifetime:       1800
                Preference: Medium
                updated: 2021-12-28 10:13:39; 88s ago, timeout:       1697s
        rDNS proposals
                id:    7, state:            SENT
                router: fe80::fc00:2ff:fe79:3b4d%vio0
                rdns lifetime:       3600
                rdns:
                        2001:19f0:300:1704::6
                updated: 2021-12-28 10:13:39; 88s ago, timeout:       3497s
taglio@ganesha:/home/taglio/Work/telecomlobby.com/bin$ 
```

#### Tunnel brokers 

![](https://github.com/redeltaglio/OpenBSD/raw/master/img/he.png)

In the case of `static` configuration of the `inet6` stack upon our `egress` interface and if our `VPS` provider doesn't bind IPv6 services to the customers it's possible to configure a tunnel [6to4](https://datatracker.ietf.org/doc/html/rfc3056) from [Hurricane Electric](https://en.wikipedia.org/wiki/Hurricane_Electric) and route traffic over it. The tunnel will use the [gif(4)](https://man.openbsd.org/gif.4) pseudo device and our `setup_node` will configure it in a few commands:

```bash
Is IPv6 tunneled through Hurricane Electric? yes/no yes
Type the IPv4 of the Hurricane Electric endpoint 216.66.87.134
Type the IPv6 /128 of the  local gif interface 2001:470:1f22:486::2 
Type the IPv6 /128 of the Hurricane Electric endpoint 2001:470:1f22:486::1 
Type the IPv6 endpoint from the /64 routed from the Hurricane Electric tunnel 2001:470:1f23:486::1 
```

![](https://github.com/redeltaglio/OpenBSD/raw/master/img/tunnelbroker_ch.png)

#### Login and start the connection process

Install the git package:

```shell
neo# pkg_add git
neo$ mkdir -p Sources/Git && cd Sources/Git
neo$ git clone https://github.com/redeltaglio/OpenBSD.git
```

First think to notice is that I'm calling [ksh](https://man.openbsd.org/ksh.1) as command interpreter. It would not be necessary if we call setup node with `./` because the [shebang](https://en.wikipedia.org/wiki/Shebang_%28Unix%29) is calling the [Korn shell](http://www.kornshell.org/):

```
taglio@trimurti:~/Work/telecom.lobby/OpenBSD$ head -n 1 setup_node 
#!/bin/ksh
taglio@trimurti:~/Work/telecom.lobby/OpenBSD$ 
```

Be careful to not interpret with the [POSIX](https://es.wikipedia.org/wiki/POSIX) [shell](https://man.openbsd.org/sh.1) because it simply doesn't work because a check of the `$_` variable:

```bash
if [[ $_ -ne "/bin/ksh" ]]; then
	print $0 "you've got to run $0 with ksh command interpreter \n"
	exit 1
fi
```

Start to configure the system with our script `setup_node`, you've got to go ahead to every point pressing `1` or to type different variables:

- the type of IPv6 address:
  - `static`: 
    - [IPv6 address](https://en.wikipedia.org/wiki/IPv6) without prefixlen.
    - The [prefixlen](https://www.ciscopress.com/articles/article.asp?p=2803866&seqNum=2).
    - The [IPv6 default route](https://www.cisco.com/c/en/us/td/docs/ios-xml/ios/iproute_pi/configuration/xe-16-10/iri-xe-16-10-book/ip6-route-static-xe.pdf).
  - `static over gif tunnel`: see above.
  - `dynamic`, using [slaacd (8)](https://www.openbsd.org/papers/florian_slaacd_bsdcan2018.pdf)
- `hostname`, the name of the machine.
- `landomainname`, the interior domain name that in my case is `telecom.lobby`
- `routerid`, the OSPFD router id and the IP of the `vether0` interface.

```shell
root@neo:/home/taglio/Sources/Git/OpenBSD# ksh setup_node
```

After some points the program give us the root ssh `ed25519` key of the new host. That is [EdDSA](https://en.wikipedia.org/wiki/EdDSA) in [public key cryptography](https://en.wikipedia.org/wiki/Public-key_cryptography).  Update the repository using the `console` script:

```shell
riccardo@trimurti:~/Work/telecom.lobby/OpenBSD$ ./console -I telecom.lobby -RS
Type the LAN hostname 
durga.telecom.lobby
Type the public hostname 
de.telecomlobby.com
Type the ED25519 hash 
AAAAC3NzaC1lZDI1NTE5AAAAIH6Kju+51Vud+0cHKgpdFNSRIpXM/PcLQAO86xKgc+Op
remote_install/authorized_keys and ssh_known_hosts UPDATED
		
 please use git_openbsd.sh to update the public GIT
riccardo@trimurti:~/Work/telecom.lobby/OpenBSD$
```

Use the script `git_openbsd.sh` using values depending in your forked repository to update the git.

Next update every host using `git pull` using the `console` script and launch the `newhost` option using the same script:

``` shell
riccardo@trimurti:~/Work/telecom.lobby/OpenBSD$ ./console -I telecom.lobby -G
riccardo@trimurti:~/Work/telecom.lobby/OpenBSD$ ./console -I telecom.lobby -N
```

The `console` script depend on a `TXT` record in the master `nsd` for the LAN domain name:

```shell
riccardo@trimurti:~/Work/telecom.lobby/OpenBSD$ host -t txt openbsd.telecom.lobby
openbsd.telecom.lobby descriptive text "ganesha;saraswati;shiva;varuna;"
riccardo@trimurti:~/Work/telecom.lobby/OpenBSD$ 
```

Those are the host names of every OpenBSD guy connected to our network, remember to update it!

[![OpenBSD MESH IPSec guerrila host](https://asciinema.org/a/418749.png)](https://asciinema.org/a/418749)

You've got to update also the CA server inside your network. As the other use the new `ed25519` public key:

```shell
riccardo@trimurti:~/Work/telecom.lobby/OpenBSD-private-CA$ mkdir src/etc/ssh/ca/host/durga.telecom.lobby
riccardo@trimurti:~/Work/telecom.lobby/OpenBSD-private-CA$ echo "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHfCxPKwUqEG9JaEaK6uqFDfDMFYFTblLEWPekGh8CAn root@durga.telecom.lobby" > src/etc/ssh/ca/host/durpa.telecom.lobby/ssh_host_ed25519_key.pub
```

Update the repository using the script `git_openbsd-private-ca.sh` and next create the new `ssh_host_ed25519_key-cert.pub` with:

```shell
root@cyberanarkhia:/home/taglio/Sources/Git/OpenBSD-private-CA# ./setup_ca                                                                                                                                                                                                       
./setup_ca have to be used with the following options 			
 			
install  -> create SSH and SSL private CA 			
verify   -> printout and verify certificates 			
reset    -> reset filesystem hierarchy and delete certificates and keys 			
transfer -> tar files on /home/taglio 			
newhost -> add a new MESH host 			

root@cyberanarkhia:/home/taglio/Sources/Git/OpenBSD-private-CA# 

```

Use `newhost` and `transfer` options.

[![OpenBSD MESH IPSec guerrila host](https://asciinema.org/a/420482.png)](https://asciinema.org/a/420482)

#### Automatic install

```shell
taglio@varuna:/home/taglio$ cat /tmp/config.ini                                              static#1
ipv6ctrl#static
ipv6egress#2a01:8740:1:ff48::64a8
ipv6prefix#48
ipv6defrouter#2a01:8740:1:ff00::1
installurl#1
shell#1
users#1
hostname#varuna
landomainname#telecom.lobby
routerid#192.168.13.59
basic#1
unbound#1
ssh#1
ipsec#1
gre#1
pf#1
ospf#1
remote#1
taglio@varuna:/home/taglio$ 

```

This is the configuration file obtained by the semi automatic installation process. You can adapt to your configuration but be careful with the `static` or `dynamic` IPv6. To archive that you can use also the `configure` script in the root of the repository, simply answer to the questions. 

[![OpenBSD MESH IPSec guerrila host](https://asciinema.org/a/421061.png)](https://asciinema.org/a/421061)

##### You successfully installed and connected a new OpenBSD MESH guerrilla host

*Ok baby let's rock&roll. We've configured a new IPSec MESH host in a semi automatic way, a lot of work done in a few clicks with our preferred system operative, the secure fish! OpenBSD!*

The first step after is to add the new [SSHFP](https://en.wikipedia.org/wiki/SSHFP_record) record to our internal [nsd](https://en.wikipedia.org/wiki/NSD) server. Scan them:

```shell
riccardo@trimurti:~/Work/telecom.lobby/OpenBSD$ ssh-keyscan -D -t ed25519 varuna.telecom.lobby
; varuna.telecom.lobby:22 SSH-2.0-OpenSSH_8.6
varuna.telecom.lobby IN SSHFP 4 1 6e77aacf6c65bac6ff6dcb8e21ce9beb7cb9d832
varuna.telecom.lobby IN SSHFP 4 2 9baacb4c882270c8f37f2fbc847f1094b2b78a34da4650ec24a3b69ad6033dc3
riccardo@trimurti:~/Work/telecom.lobby/OpenBSD$ 
```

And update the zone in the server and the `openbsd` record:

```shell
root@cyberanarkhia:/var/nsd/zones/master# rcctl restart nsd                                                                               
nsd(ok)
nsd(ok)
root@cyberanarkhia:/var/nsd/zones/master# rcctl restart unbound
unbound(ok)
unbound(ok)
root@cyberanarkhia:/var/nsd/zones/master# cat telecom.lobby | grep varuna                                                                                                                                                                                                        
varuna		IN A 192.168.13.59
varuna.telecom.lobby IN SSHFP 4 1 6e77aacf6c65bac6ff6dcb8e21ce9beb7cb9d832
varuna.telecom.lobby IN SSHFP 4 2 9baacb4c882270c8f37f2fbc847f1094b2b78a34da4650ec24a3b69ad6033dc3
openbsd			IN TXT	 "ganesha;saraswati;shiva;varuna;"
root@cyberanarkhia:/var/nsd/zones/master# 
```

Enter in the new system and add a password, use a great password manager in your workstation like [KeePassXC](https://keepassxc.org/):

```shell
taglio@varuna:/etc$ su
Password:
root@varuna:/etc# passwd taglio
Changing password for taglio.
New password:
Retype new password:
root@varuna:/etc# 
```

Then create a new SSL internal [CSR](https://en.wikipedia.org/wiki/Certificate_signing_request) certificate request and download it to the CA server to create a new [x.509](https://en.wikipedia.org/wiki/X.509) [CRT](https://en.wikipedia.org/wiki/X.690#DER_encoding) for the internal services like `httpd(8)` and the surely next installed daemon [dovecot](https://www.dovecot.org/).

```shell
root@varuna:/home/taglio/Sources/Git/OpenBSD# ksh setup_node -A sslcareq 
Generating RSA private key, 2048 bit long modulus
...................................................................+++++
.......+++++
e is 65537 (0x10001)
writing RSA key
You are about to be asked to enter information that will be incorporated
into your certificate request.
What you are about to enter is what is called a Distinguished Name or a DN.
There are quite a few fields but you can leave some blank
For some fields there will be a default value,
If you enter '.', the field will be left blank.
-----
Country Name (2 letter code) []:BG
State or Province Name (full name) []:Lovech
Locality Name (eg, city) []:Troyan
Organization Name (eg, company) []:Telecom Lobby
Organizational Unit Name (eg, section) []:VPNC
Common Name (eg, fully qualified host name) []:varuna.telecom.lobby
Email Address []:varuna@ca.telecom.lobby

Please enter the following 'extra' attributes
to be sent with your certificate request
A challenge password []:
Download csr from http://varuna.telecom.lobby/varuna.telecom.lobby.csr to the CA server
root@varuna:/home/taglio/Sources/Git/OpenBSD#
```

*Recent versions of our tool will do it automatically.*

[![OpenBSD MESH IPSec guerrila host](https://asciinema.org/a/421920.png)](https://asciinema.org/a/421920)

In this video you can appreciate also a [tmux](https://en.wikipedia.org/wiki/Tmux) session with all the OpenBSD host connected via `ssh` automatically, one session to the internal CA server that in my case is `cyberanarkhia`, and the last onto the workstation that in my case is `trimurti`, an [Ubuntu](https://en.wikipedia.org/wiki/Ubuntu) host.

***I'm fighting hard.***

### Others system operatives 

![VyOS](https://www.programmersought.com/images/37/227a77d35c99e18bb4a03c3aeece6045.png)

In my MESH network I've got to others types of system operatives dedicated to my business of selling Internet and IP transport using terrestrial radio waves. A wireless Internet service provider.

The types of are:

- [EdgeOS](https://dl.ubnt.com/guides/edgemax/EdgeOS_UG.pdf) a commercial and customized version of [VyOS](https://en.wikipedia.org/wiki/VyOS) from [Ubiquiti](https://es.wikipedia.org/wiki/Ubiquiti_Networks). 
- [RouterOS](https://mikrotik.com/software) a commercial and customized version of Linux from [Mikrotik](https://en.wikipedia.org/wiki/MikroTik).

My software build scripts to automatic configure the new hosts also for those guys.

To add the new OpenBSD host to my Mikrotik steps are very simple. Do this in the new guy:

```shell
root@varuna:/home/taglio/Sources/Git/OpenBSD# ksh setup_node -A otheros
Download Mikrotik Routeros script from http://varuna.telecom.lobby/fr.telecomlobby.com/fr.telecomlobby.com.rsc
root@varuna:/home/taglio/Sources/Git/OpenBSD# 
```

From the workstation first of all upload the p12 certificate into the other Mikrotik CHR istances:

```bash
taglio@trimurti:~/Work/redama/ipsec/xolotl$ sftp calli.telecom.lobby
Connected to calli.telecom.lobby.
sftp> put br.telecomlobby.com.p12 
Uploading br.telecomlobby.com.p12 to /br.telecomlobby.com.p12
br.telecomlobby.com.p12                                                                                                                                                                                                                                 100% 3880   267.0KB/s   00:00    
sftp> 
taglio@trimurti:~/Work/redama/ipsec/xolotl$ ssh calli.telecom.lobby
[taglio@calli.telecom.lobby] > /certificate import file-name=br.telecomlobby.com.p12 name=br.telecomlobby.com passphrase=123456789
     certificates-imported: 1
     private-keys-imported: 1
            files-imported: 1
       decryption-failures: 0
  keys-with-no-certificate: 0

[taglio@calli.telecom.lobby] > 
```

Next for every CHR:

```shell
riccardo@trimurti:~/Work/telecom.lobby/OpenBSD$ ./console -I telecom.lobby -M
Type the Mikrotik internal hostname 
uma
Type the new OpenBSD internal hostname 
varuna
--2021-06-23 15:27:46--  http://varuna.telecom.lobby/fr.telecomlobby.com/fr.telecomlobby.com.rsc
Resolving varuna.telecom.lobby (varuna.telecom.lobby)... 192.168.13.59
Connecting to varuna.telecom.lobby (varuna.telecom.lobby)|192.168.13.59|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 1686 (1,6K) [application/octet-stream]
Saving to: ‘/tmp/fr.telecomlobby.com.rsc’

/tmp/fr.telecomlobby.com.rsc                                         100%[====================================================================================================================================================================>]   1,65K  --.-KB/s    in 0,07s   

2021-06-23 15:27:46 (22,5 KB/s) - ‘/tmp/fr.telecomlobby.com.rsc’ saved [1686/1686]

fr.telecomlobby.com.rsc                                                                                                                                                                                                                         100% 1686    63.5KB/s   00:00    

Script file loaded and executed successfully
Host varuna.telecom.lobby configured into Mikrotik uma.telecom.lobby
riccardo@trimurti:~/Work/telecom.lobby/OpenBSD$ 

```

And here you a video:

[![OpenBSD MESH IPSec guerrila host](https://asciinema.org/a/421957.png)](https://asciinema.org/a/421957)

At least one cheat: if you want to reinstall the OpenBSD VPS simply reboot from `ssh` and the using the web [noVNC](https://novnc.com/info.html) virtual terminal at the boot loader prompt type `boot bsd.rd`.

#### Add a new Mikrotik Cloud Hosted Router 

As you can add a new OpenBSD VPS to the network, it's possible also to add a new Mikrotik VPS. Normally I use RouterOS as my WISP client endpoint IPSEC. Connection is a little bit more stable and fluid than with OpenBSD, remember that I've got an EdgeOS in my physic installation. 

The OpenBSD network is more focused as Content Delivery Network, serving web pages and other services geographically  located in different parts of the world.

I report the routine to buy a new CHR virtual router license. 

Licenses in CHR that are router instances running over cloud VPS services are different from the physics ones. 

![](https://github.com/redeltaglio/OpenBSD/raw/master/img/routeros_licences.jpg)

1. Install RouterOS using the procedure described apropos OpenBSD over a Linux installation.  
2. Do this downloading the [RAW disc image](https://en.wikipedia.org/wiki/IMG_(file_format)) of the RouterOS prepared for [Cloud Hosted Router](https://help.mikrotik.com/docs/pages/viewpage.action?pageId=18350234).
3. Open an account into the [Mikrotik client page](https://mikrotik.com/client).
4. As you can see in the image above System ID is different from physic or X86 installations. Press "Renew License" to get a one month limited free trial. When it will expire you will see a check upon "Limited Upgrades". 
5. But the license in your account page.

Next we've got to prepare the domain name zone with the propers values to indicate to others peers the new entry as we've done with OpenBSD, in this example the CHR istance to add is `ixp.telecomlobby.com` as public host name and `calli.telecom.lobby` as internal host name. As usual we edit those values:

- an A entry for `ixp`, in the cloud service we will add the PTR for the ip. 
- `vpnc` and `vpncN` A values, passing the last host added from `vpncN` to the `vpnc` pool (something used normally to obtain DNS [load balancing](https://en.wikipedia.org/wiki/Load_balancing_(computing)) as with [round robin](https://en.wikipedia.org/wiki/Round-robin_DNS)) .
- `ipsec20591` append to the TXT string `ixp:calli;`.
- `gre7058` add the last /30 configured as usual, in this case `104`.
- `gre18994` the number of the hosts in the `vpnc` pool, in this case `8`.

Next create the `p12` compressed and encrypted certificate as we've done with OpenBSD. Download it locally onto the workstation and use another time the `console` script with `-K` option. Remember to have an IPv4 running stack configured and to change the default `admin` user into your user, in my case `taglio`. Do it adding the new one allowing only your public address, rejoin winbox or ssh and then delete `admin`.

```bash
 [admin@MikroTik] > /user add name=taglio group=full address=94.72.143.163/32 password=
```

Add a password, I generate it with a password administration tool.

```bash
taglio@trimurti:~/Work/telecom.lobby/OpenBSD$ mv /home/taglio/Work/redama/calli/cert_export_ixp.telecomlobby.com.p12 /home/taglio/Work/redama/calli/ixp.telecomlobby.com.p12
taglio@trimurti:~/Work/telecom.lobby/OpenBSD$ ./console -I telecom.lobby -K
Type the PATH to the new iked PK12 file 
/home/taglio/Work/redama/calli/ixp.telecomlobby.com.p12
Host ixp.telecomlobby.com not found in /home/taglio/.ssh/known_hosts
The authenticity of host 'ixp.telecomlobby.com (5.134.119.135)' can't be established.
RSA key fingerprint is SHA256:HtT0d7oUb8r/r43utGn4+9nfSL34tzYHn7xavgVPmW8.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added 'ixp.telecomlobby.com,5.134.119.135' (RSA) to the list of known hosts.
taglio@ixp.telecomlobby.com's password: 
ixp.telecomlobby.com.p12                                                                                                                                                                                                                                100% 3874    33.0KB/s   00:00    
calli@ca.telecomlobby.com created please update repository and all the others Openbsd hosts
taglio@trimurti:~/Work/telecom.lobby/OpenBSD$ 
```

Next update the Github public repository, and pull all the OpenBSD hosts. Sequence of commands are:

```bash
sh git_openbsd.sh
./console -I telecom.lobby -G
./console -I telecom.lobby -N
```

It's important to have a directory out of the repository with all the p12 compressed and encrypted IPSec certificates of the MESH network:

```bash
taglio@trimurti:~/Work/redama/ipsec$ find . -name "*.p12"
./indra/RT-01.cat.telecomlobby.com.p12
./uma/fr.telecomlobby.com.p12
./shiva/jp.telecomlobby.com.p12
./varuna/bg.telecomlobby.com.p12
./ganesha/uk.telecomlobby.com.p12
./saraswati/us.telecomlobby.com.p12
./vishnu/au.telecomlobby.com.p12
./durga/de.telecomlobby.com.p12
./calli/ixp.telecomlobby.com.p12
taglio@trimurti:~/Work/redama/ipsec$ 
```

Now simply start the `console` script with the `-CHR` option:

```bash
taglio@trimurti:~/Work/telecom.lobby/OpenBSD$ ./console 
./console have to be used with the following options 			
-I  -> local domain name [x]			
-N  -> newhost [o]			
-G  -> git pull [o]			
-S  -> scripts [o] 			
-D  -> dyndnspop [o] 			
-F  -> single file update [o] 			
-C  -> cleanlast [o] 			
-RS -> repository ssh update [o] 			
-K  -> new IKED pk12 archive [o] 			
-T  -> tmux and SSH to all openbsd MESH hosts [o] 			
-M  -> Mikrotik RouterOS add new OpenBSD [o] 			
-E  -> Ubiquiti EdgeOS add new OpenBSD [o] 			
-P  -> Mass syspatch OpenBSD hosts [o] 			
-Z  -> Global network domains setup [o] 			
-OM -> Mikrotik RouterOS ospf-in/out filter [o] 			
-OE -> EdgeOS ospf-in/out filter [o] 			
-OO -> OpenBSD ospf filter [o] 			
-U  -> update the workstation's user EdDSA certificate [o] 			
-NO -> newospf configuration [o] 			
-PF -> new firewall configuration [o] 			
-CHR -> new RouterOS Cloud Hosted Router istance [o] 			

taglio@trimurti:~/Work/telecom.lobby/OpenBSD$  
```

[![asciicast](https://asciinema.org/a/450247.svg)](https://asciinema.org/a/450247)

This is the video of the complete routine about the OpenBSD peers. Next we've got to add the new Cloud Hosted Router to the other Mikrotik instances and EdgeOS.

### Routine maintenance

![](https://thumbs.dreamstime.com/b/routine-maintenance-mechanism-golden-metallic-cogwheels-glow-effect-d-rendering-concept-gears-illustration-114332777.jpg)

#### New monthly EdDSA workstation key

One of the important routine maintenance operation that we shall do in our network is the renew of the `EdDSA` key for the workstation's user authorized by the [CA server](https://github.com/redeltaglio/OpenBSD-private-CA).

Use the `console` script as usual following those operations:

```shell
riccardo@trimurti:~/Work/telecom.lobby/OpenBSD$ ./console -I telecom.lobby -U
mv: cannot stat '/home/riccardo/.ssh/id_ed25519-cert.pub': No such file or directory
Generating public/private ed25519 key pair.
Enter file in which to save the key (/home/riccardo/.ssh/id_ed25519): 
Enter passphrase (empty for no passphrase): 
Enter same passphrase again: 
Your identification has been saved in /home/riccardo/.ssh/id_ed25519
Your public key has been saved in /home/riccardo/.ssh/id_ed25519.pub
The key fingerprint is:
SHA256:IE3Ad3KZdNWitnj0lIjaqLq2SVCNPR52G1UDZHttIKA taglio@
The key's randomart image is:
+--[ED25519 256]--+
|   ...o+B==...   |
|   +.+oo=+ +. .  |
|  o E.=+...ooo   |
| . o = +..=.o    |
|.   . .+S+ +     |
| .    o o o .    |
|  .  .   .       |
| ....            |
| .=+             |
+----[SHA256]-----+
Password:
Type the mounted FAT32 pen drive directory:/media/riccardo/0903-C8DC
Ready? type 1
```

This action will change also the public key specified in the `installation/install-vps.conf` used in the system operative installation process, so remember to upgrade the repository.

Next take the pen drive to the CA server physic station and run the setup_ca script with the correct option `setup_ca upuser`. Return it to the workstation and type `1`. 

#### New yearly IPsec certificate to hosts and management

![](https://github.com/redeltaglio/OpenBSD/raw/master/img/1_UytIyLrrKVK9q9hVkuRNyA.gif)

First of all remember that certificate of the IPsec network got a deadline. They are created from the CA server with a life span of 365 days. One option of our `console` script simply printout the creation and deadline date with a comparison with the current date time in [GMT](https://en.wikipedia.org/wiki/Greenwich_Mean_Time) and in [Unix epoch](https://en.wikipedia.org/wiki/Unix_time).

```bash
taglio@trimurti:~/Work/telecom.lobby/OpenBSD$ ./console -I telecom.lobby -KD
Current GMT time is: Feb 13 21:54:15 2022 GMT
Current epoch time is: 1644789255
Looking at OpenBSD hosts...
IPsec SSL certificate deadline of ganesha is: Feb 11 23:52:24 2023 GMT
IPsec SSL certificate epoch deadline of ganesha is: 1676159544
IPsec SSL certificate deadline of saraswati is: Feb 12 09:19:45 2022 GMT
IPsec SSL certificate epoch deadline of saraswati is: 1644657585
saraswati IPsec SSL certificate has to be upgraded
IPsec SSL certificate deadline of shiva is: Feb 10 18:14:23 2022 GMT
IPsec SSL certificate epoch deadline of shiva is: 1644516863
shiva IPsec SSL certificate has to be upgraded
IPsec SSL certificate deadline of varuna is: Apr 12 15:46:57 2022 GMT
IPsec SSL certificate epoch deadline of varuna is: 1649778417
IPsec SSL certificate deadline of vishnu is: Jun 20 13:03:23 2022 GMT
IPsec SSL certificate epoch deadline of vishnu is: 1655730203
IPsec SSL certificate deadline of bhagavati is: Aug 25 14:58:55 2022 GMT
IPsec SSL certificate epoch deadline of bhagavati is: 1661439535
IPsec SSL certificate deadline of xolotl is: Jan  2 13:50:38 2023 GMT
IPsec SSL certificate epoch deadline of xolotl is: 1672667438
IPsec SSL certificate deadline of umnyama is: Jan  3 08:05:22 2023 GMT
IPsec SSL certificate epoch deadline of umnyama is: 1672733122
Looking at Mikrotik RouterOS hosts...
IPsec SSL certificate deadline of calli is: nov 15 17:47:04 2022
IPsec SSL certificate epoch deadline of calli is: 1668530824
Looking at Ubiquiti EdgeOS hosts...
IPsec SSL certificate deadline of indra is: Feb 11 22:22:52 2023 GMT
IPsec SSL certificate epoch deadline of indra is: 1676154172
 

```

Once you find some certificates expired fired up the CA server instance change the name to the old one, revoke it and create a new one has you have done to create it. Remember that this control operation has been done upon OpenBSD, RouterOS and EdgeOS hosts connected in our network.

Next with the tool paste the filesystem position of the new PK12 file that was exported as usual with the password `123456789`, it will upgrade the correspondent host files:

- `/etc/iked/local.pub` the SSL public key used with [iked(8)](https://man.openbsd.org/iked).
- `/etc/iked/private/local.key` the SSL private key.
- `/etc/iked/certs/$publichost.crt` the SSL [X509](https://en.wikipedia.org/wiki/X.509) certificate.

Onto Mikrotik it will delete the old certificate, import the new one and update the correspondent ipsec identity.

```bash
/certificate remove [/certificate find where name=${publichost}]
/certificate import passphrase=123456789 file-name=$pk12 name=${publichost}
/ip ipsec identity set [/ip ipsec identity find where certificate=${publichost}] certificate=${publichost}
```

Onto EdgeOS it will copy the new X509 certificate and perform those [commands](https://wiki.strongswan.org/projects/strongswan/wiki/ipseccommand) into [strongSwan](https://www.strongswan.org/):

- ipsec rereadall
- ipsec reload



#### Add new host to PF

Another simple maintenance process is add another host to one table of `pf`. For example:

[![OpenBSD MESH IPSec network: PF manteinance](https://asciinema.org/a/426193.png)](https://asciinema.org/a/426193)

#### New GRE subnet

Another maintenance that we've got to do is add another [gre(4)](https://man.openbsd.org/gre.4) subnet in case ip addressing is going to finish. For example let's add `10.10.9.0/24` to the existing `10.10.10.0/24`:

Reset `gre7058` into the `telecomlobby.com.zone` onto the master domain name server and reload it:

```bash
root@ganesha:/var/nsd/zones/master# sed -i "s|gre7058.*|gre7058 IN TXT \"255\"|" telecomlobby.com.zone
```

Add the new prefix into the [pf(4)](https://man.openbsd.org/pf.4) table `src/etc/pf.conf.table.locals` from the workstation and upload to the repository, the use the `console` script to update all the systems and reload firewall globally.

```bash
taglio@trimurti:~/Work/telecom.lobby/OpenBSD$ echo 10.10.9.0/24 >> src/etc/pf.conf.table.locals
taglio@trimurti:~/Work/telecom.lobby/OpenBSD$ 

```

As `4 of January 2022` both setup_node and console scripts question to the user what is the subnet to use:

```bash
umnyama# ksh setup_node -I                                                                Type 1 to use /tmp/config.ini 
0
Type the current gre subnet 
10.10.9
```

#### Remote upgrade

![](https://redama.es/Imagenes/varuna_shell.png)

If the VPS provider got the option to install OpenBSD, a custom ISO or hasn't the solution is always the same:

```bash
root@xolotl:/home/taglio# sysupgrade -kn
Fetching from https://cdn.openbsd.org/pub/OpenBSD/7.1/amd64/
SHA256.sig   100% |***********************************************************************************************************************************************************************************************************************************************|  2144       00:00    
Signature Verified
INSTALL.amd64 100% |**********************************************************************************************************************************************************************************************************************************************| 43495       00:00    
base71.tgz   100% |***********************************************************************************************************************************************************************************************************************************************|   330 MB    00:46    
bsd          100% |***********************************************************************************************************************************************************************************************************************************************| 22339 KB    00:11    
bsd.mp       100% |***********************************************************************************************************************************************************************************************************************************************| 22438 KB    00:12    
bsd.rd       100% |***********************************************************************************************************************************************************************************************************************************************|  4498 KB    00:05    
comp71.tgz   100% |***********************************************************************************************************************************************************************************************************************************************| 73366 KB    00:21    
game71.tgz   100% |***********************************************************************************************************************************************************************************************************************************************|  2744 KB    00:04    
man71.tgz    100% |***********************************************************************************************************************************************************************************************************************************************|  7601 KB    00:06    
xbase71.tgz  100% |***********************************************************************************************************************************************************************************************************************************************| 55182 KB    00:18    
xfont71.tgz  100% |***********************************************************************************************************************************************************************************************************************************************| 22965 KB    00:12    
xserv71.tgz  100% |***********************************************************************************************************************************************************************************************************************************************| 20117 KB    00:11    
xshare71.tgz 100% |***********************************************************************************************************************************************************************************************************************************************|  4544 KB    00:05    
Verifying sets.
Fetching updated firmware.
intel-firmware-20210608v0->20220207v0: ok
Read shared items: ok
Will upgrade on next reboot
root@xolotl:/home/taglio# ls /home/_sysupgrade/ ; ls -al /auto_upgrade.conf                                                                                                                                                                                                              
INSTALL.amd64  SHA256         base71.tgz     bsd            bsd.mp         bsd.rd         comp71.tgz     game71.tgz     man71.tgz      xbase71.tgz    xfont71.tgz    xserv71.tgz    xshare71.tgz
-rw-r--r--  1 root  wheel  160 Apr 22 04:13 /auto_upgrade.conf
root@xolotl:/home/taglio# 
```

Use [autoinstall(8)](https://man.openbsd.org/autoinstall.8) to maintain the same data sets used in installation process. Those data sets have to be write onto `/auto_upgrade.conf` you may use `src/installation`:

```
Location of sets = disk
Pathname to the sets = /home/_sysupgrade/
Set name(s) = -comp* -x*
Directory does not contain SHA256.sig. Continue without verification = yes
```

But use 

The upgrade our git repository and launch the `upgrade.sh` script. Remember to wait a couple of days after the [release announce](https://www.openbsd.org/69.html) is published by [Theo de Raddt](https://www.theos.com/deraadt/).

Under `tools/` directory you can find different scripts useful to adapt configuration between releases. Always keep in mind to carefully read what the OpenBSD crew have to explain to us, power users, about changes. For example here you are the one about the `7 RELENG`:

- [OpenBSD 7.0](https://www.openbsd.org/70.html)

Next you can call them in a massive way as usual using the `console` script from the workstation:

```bash
taglio@trimurti:~/Work/telecom.lobby/OpenBSD$ ./console 
./console have to be used with the following options 			
 			
-I   -> local domain name [x]			
-N   -> newhost [o]			
-G   -> git pull [o]			
-S   -> scripts [o] 			
-D   -> dyndnspop [o] 			
-F   -> single file update [o] 			
-C   -> cleanlast [o] 			
-RS  -> repository ssh update [o] 			
-K   -> new IKED pk12 archive [o] 			
-T   -> tmux and SSH to all openbsd MESH hosts [o] 			
-M   -> Mikrotik RouterOS add new OpenBSD [o] 			
-E   -> Ubiquiti EdgeOS add new OpenBSD [o] 			
-P   -> Mass syspatch OpenBSD hosts [o] 			
-Z   -> Global network domains setup [o] 			
-OM  -> Mikrotik RouterOS ospf-in/out filter [o] 			
-OE  -> EdgeOS ospf-in/out filter [o] 			
-OO  -> OpenBSD ospf filter [o] 			
-U   -> update the workstation's user EdDSA certificate [o] 			
-NO  -> newospf configuration [o] 			
-PF  -> new firewall configuration [o] 			
-CHR -> new RouterOS Cloud Hosted Router istance [o] 			
-7   -> changes to 7.0 release [o] 			

taglio@trimurti:~/Work/telecom.lobby/OpenBSD$ ./console -I telecom.lobby -7
Connecting to ganesha
Connection to ganesha.telecom.lobby closed.
Connecting to saraswati
Connection to saraswati.telecom.lobby closed.
Connecting to shiva
Connection to shiva.telecom.lobby closed.
Connecting to varuna
Connection to varuna.telecom.lobby closed.
Connecting to durga
Connection to durga.telecom.lobby closed.
Connecting to vishnu
Connection to vishnu.telecom.lobby closed.
Connecting to bhagavati
Connection to bhagavati.telecom.lobby closed.
taglio@trimurti:~/Work/telecom.lobby/OpenBSD$

```

#### Delete a VPS instance that you own

1. Delete the VPS instance from the provider console.
2. Use `tools/clean_last` in every OpenBSD VPS, better from the web VNC console, adding the correct `gre` interface as first and only argument.
2. Use `./console -I telecom.lobby -CMK` adding the internal hostname without the domain as argument. The tool will delete it from every Mikrotik RouterOS host.
2. Use `./console -I telecom.lobby -CEO` adding the internal hostname without the domain as argument. The tool will delete it from every Ubiquiti EdgeOS host.
3. Eliminate the entries about in the public and local DNS daemon.

Look at the cleaning of a host in the EdgeOS WISP edge:

[![asciicast](https://asciinema.org/a/ti03G2xk7lkK5XjQ4QPifrxex.svg)](https://asciinema.org/a/ti03G2xk7lkK5XjQ4QPifrxex)

## Possible appliances

Let's start discussing how we can boost our presence in Internet using that guerrilla MESH system that guaranty our privacy and security on the web. My first project is regarding a website replicated over different countries in all the languages over the world. Something very important to obtain maximum results about clients, about web goods sell, about be recognized over it and about whatever we want to obtain searching for visibility.

I've got to cases, one is about the correct information about the modern slavery network transmitted by electromagnetic weapons to the marginal and worker class of many countries, also Europeans. The other is to have got a great site about my professional work, Redama, a wireless ISP but also an Internet website that sold security focused end devices and gateways.   

Next some daemons that we've got to configure to start a new world of applications, remember that my goals are:

- a distributed spider to search for clients for my business and to catalog emails, fax numbers and contacts of United Nations personal that work fighting the modern slavery. I'm a private investigator and I've got to massively denunciate the remote neural control and interference to the brain facility.
- a multi language web site, one for my work the other for my page of public compliant. 
- a massive system of alert by www, smtpd and SIP.

### Content delivery network

#### PowerDNS

![](https://jpmens.net/media/2015b/powerdns-geoip.png)

[PowerDNS](https://en.wikipedia.org/wiki/PowerDNS) is a [DNS server](https://en.wikipedia.org/wiki/Name_server) that we are going to use because of it [GeoIP](https://en.wikipedia.org/wiki/Internet_geolocation) [features](https://doc.powerdns.com/authoritative/backends/geoip.html). Using that we will reply to dns request in different ways depending on the geographical position of the source IP. Onto the position in the world map of our client. Why? To load balance  requests and to archive a lot of features more.

The [PowerDNS module](https://doc.powerdns.com/authoritative/backends/geoip.html) about geoip it's not included in the OpenBSD package, so we've got to compile that daemon and run it under a [chroot](https://en.wikipedia.org/wiki/Chroot) environment to be sure to not add a security problem in our network. What we're going to run in our VPS secure guerrilla network is [GeoDNS](https://jpmens.net/2015/11/12/geodns-with-powerdns-geoip-back-end/) being part of a content delivery network prepared to serve data despite the geographic position of the client.

Our geographic aware CDN will work upon the [continent](https://en.wikipedia.org/wiki/Continent) definition that included:

- **AF**, [Africa](https://en.wikipedia.org/wiki/Africa)
- **AN**, [Antarctica](https://en.wikipedia.org/wiki/Antarctica) 
- **AS**, [Asia](https://en.wikipedia.org/wiki/Asia)
- **EU**, [Europe](https://en.wikipedia.org/wiki/Europe)
- **NA**, [North America](https://en.wikipedia.org/wiki/North_America)
- **OC**, [Oceania](https://en.wikipedia.org/wiki/Oceania) 
- **SA**, [South America](https://en.wikipedia.org/wiki/South_America)

We are going to use some ASCII texts with connection between [ISO-3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country code and continent nomenclature. 

Next feature for example can be serving a web page in a different language depending on the language used in the web browser of our client but this is another think.



```shell
taglio@trimurti:~/Work/telecom.lobby/OpenBSD$ ./console -I telecom.lobby -Z
Type the two .com domains (the principle and the secondary) divided by a comma: 
telecomlobby.com,9-rg.com

telecomlobby.com: 
   Name Server: JP.TELECOMLOBBY.COM
   Name Server: UK.TELECOMLOBBY.COM
   Name Server: US.TELECOMLOBBY.COM

DNSSEC not enable onto telecomlobby.com!
<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>

9-rg.com: 
   Name Server: JP.TELECOMLOBBY.COM
   Name Server: UK.TELECOMLOBBY.COM
   Name Server: US.TELECOMLOBBY.COM

DNSSEC enabled onto 9-rg.com!
<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>
You've got servers in:


GB	+513030-0000731	Europe/London

{
  "ip": "78.141.201.0",
  "hostname": "uk.telecomlobby.com",
  "city": "London",
  "region": "England",
  "country": "GB",
  "loc": "51.5085,-0.1257",
  "org": "AS20473 The Constant Company, LLC",
  "postal": "EC1A",
  "timezone": "Europe/London",
}
LAT --> 51
LONG --> -0

GROUP --> 34
BACKBONE OSPFAREA 0.0.0.0
GEO OSPFAREA --> 0.0.3.4
CONTINENT --> EU


US	+415100-0873900	America/Chicago	Central (most areas)

{
  "ip": "155.138.247.27",
  "hostname": "us.telecomlobby.com",
  "city": "Dallas",
  "region": "Texas",
  "country": "US",
  "loc": "32.7831,-96.8067",
  "org": "AS20473 The Constant Company, LLC",
  "postal": "75201",
  "timezone": "America/Chicago",
}
LAT --> 32
LONG --> -96

GROUP --> 12
BACKBONE OSPFAREA 0.0.0.0
GEO OSPFAREA --> 0.0.1.2
CONTINENT --> NA


JP	+353916+1394441	Asia/Tokyo

{
  "ip": "139.180.206.19",
  "hostname": "jp.telecomlobby.com",
  "city": "Tokyo",
  "region": "Tokyo",
  "country": "JP",
  "loc": "35.6895,139.6917",
  "org": "AS20473 The Constant Company, LLC",
  "postal": "101-8656",
  "timezone": "Asia/Tokyo",
}
LAT --> 35
LONG --> 139

GROUP --> 56
BACKBONE OSPFAREA 0.0.0.0
GEO OSPFAREA --> 0.0.5.6
CONTINENT --> AS


BG	+4241+02319	Europe/Sofia

{
  "ip": "94.72.143.163",
  "hostname": "bg.telecomlobby.com",
  "city": "Sofia",
  "region": "Sofia-Capital",
  "country": "BG",
  "loc": "42.6975,23.3241",
  "org": "AS203380 DA International Group Ltd.",
  "postal": "1000",
  "timezone": "Europe/Sofia",
}
LAT --> 42
LONG --> 23

GROUP --> 34
BACKBONE OSPFAREA 0.0.0.0
GEO OSPFAREA --> 0.0.3.4
CONTINENT --> EU


DE	+5230+01322	Europe/Berlin	Germany (most areas)

{
  "ip": "45.63.116.141",
  "hostname": "de.telecomlobby.com",
  "city": "Frankfurt am Main",
  "region": "Hesse",
  "country": "DE",
  "loc": "50.1155,8.6842",
  "org": "AS20473 The Constant Company, LLC",
  "postal": "60306",
  "timezone": "Europe/Berlin",
}
LAT --> 50
LONG --> 8

GROUP --> 34
BACKBONE OSPFAREA 0.0.0.0
GEO OSPFAREA --> 0.0.3.4
CONTINENT --> EU


AU	-3352+15113	Australia/Sydney	New South Wales (most areas)

{
  "ip": "139.180.165.223",
  "hostname": "au.telecomlobby.com",
  "city": "Sydney",
  "region": "New South Wales",
  "country": "AU",
  "loc": "-33.8678,151.2073",
  "org": "AS20473 The Constant Company, LLC",
  "postal": "1001",
  "timezone": "Australia/Sydney",
}
LAT --> -33
LONG --> 151

GROUP --> 56
BACKBONE OSPFAREA 0.0.0.0
GEO OSPFAREA --> 0.0.5.6
CONTINENT --> OC


ES	+4024-00341	Europe/Madrid	Spain (mainland)

{
  "ip": "188.213.5.62",
  "hostname": "mad.telecomlobby.com",
  "city": "Madrid",
  "region": "Madrid",
  "country": "ES",
  "loc": "40.4165,-3.7026",
  "org": "AS59432 GINERNET S.L.",
  "postal": "28037",
  "timezone": "Europe/Madrid",
}
LAT --> 40
LONG --> -3

GROUP --> 34
BACKBONE OSPFAREA 0.0.0.0
GEO OSPFAREA --> 0.0.3.4
CONTINENT --> EU

```

Using the `console` script from the workstation give us a global vision of our IPSec network. It's important because of management of the DNS servers and the geo-ip feature.

I use two domain names because administrating the NS pulls which others.

I've divided world into three groups depending onto GPS system. `console` give you at what group is pertaining every host connected to our guerrilla network. Next we will create three containers in which we will put those hosts to create three pulls of name servers. After depending onto the geographical position of the client doing the query the system will reply in a manner or another using the `powerdns` geo-ip feature.

In the GeoDNS server dynamic choose our `console` script will save data into a [SQLite](https://www.sqlite.org/index.html) database, which is initialized by a template found in `src/openbsd` directory. Schema is very simple:

```sqlite
PRAGMA foreign_keys = 1;

CREATE TABLE domains (
  id                    INTEGER PRIMARY KEY,
  name                  VARCHAR(255) NOT NULL COLLATE NOCASE,
  ns34                  VARCHAR(40) DEFAULT NULL,
  ns12                  VARCHAR(40) DEFAULT NULL,
  ns56                  VARCHAR(40) DEFAULT NULL,
  dnssec                TINYINT DEFAULT 0,
  dnssec_keyid          VARCHAR(5) DEFAULT NULL,
  last_update           INTEGER DEFAULT NULL,
  last_check            INTEGER DEFAULT NULL,
);
```

Another important feature is that our tool give us information withing the [whois database](https://en.wikipedia.org/wiki/WHOIS) if the suite of extensions [DNSSEC](https://en.wikipedia.org/wiki/Domain_Name_System_Security_Extensions) is enable from the registrant. 	

#### DNSSEC

![](https://www.researchgate.net/profile/Nicola-Zannone/publication/326276803/figure/fig1/AS:648934477283337@1531729444191/An-overview-of-DNSSEC.png)

Look at `dnssec_sign.sh` script into the `Bin` directory of the `root` user:

```shell
#!/bin/ksh

DOMAIN=$1
ZONEDIR="/var/nsd/zones/master"
DNSSECDIR="/var/nsd/etc/dnssec"


[[ $# -eq 0 ]] && \
	print "No Arguments" && \
	exit


[[ $2 == "clean" ]] && \
	rm $DNSSECDIR/*$DOMAIN* && \
	rm $ZONEDIR/$DOMAIN.zone.signed && \
	exit
	
[[ $1 == "cleanall" ]] && \
	rm -rf $DNSSECDIR/* && \
	exit

[[ $2 == "reload" ]] && \
	ZSK=$(basename $(grep -r "`grep '(zsk)' *.signed |cut -f3-10`" $DNSSECDIR/K$DOMAIN.*.key | cut -d ':' -f1) .key) && \
	KSK=$(basename $(grep -r "`grep '(ksk)' *.signed |cut -f3-10`" $DNSSECDIR/K$DOMAIN.*.key | cut -d ':' -f1) .key) && \

	ldns-signzone -n -p -s $(head -n 1000 /dev/random | sha1 | cut -b 1-16) -f $ZONEDIR/$DOMAIN.zone.signed $DOMAIN.zone $DNSSECDIR/$ZSK $DNSSECDIR/$KSK && \
	nsd-control reload $DOMAIN && \
	nsd-control notify $DOMAIN && \
	exit

cd $ZONEDIR

export ZSK=`ldns-keygen -a RSASHA1-NSEC3-SHA1 -b 1024 $DOMAIN`
export KSK=`ldns-keygen -k -a RSASHA1-NSEC3-SHA1 -b 2048 $DOMAIN`

[[ -e $ZSK.ds ]] && rm $ZSK.ds 
[[ -e $KSK.ds ]] && rm $KSK.ds
mv $ZSK.* $DNSSECDIR && mv $KSK.* $DNSSECDIR
chown root:_nsd $DNSSECDIR/* && chmod ug+r,o-rwx $DNSSECDIR/* 

# now it's time to create the .signed zone file
ldns-signzone -n -p -s $(head -n 1000 /dev/random | sha1 | cut -b 1-16) -f $ZONEDIR/$DOMAIN.zone.signed $DOMAIN.zone $DNSSECDIR/$ZSK $DNSSECDIR/$KSK

# and here are our DS records to give to our registrar
ldns-key2ds -n -1 $DOMAIN.zone.signed && ldns-key2ds -n -2 $DOMAIN.zone.signed
```

I've got the two domains registered with [dreamhost](https://en.wikipedia.org/wiki/DreamHost) , they have got a section in them forum with the rules to use DNSSEC:

- [DNSSEC overview](https://help.dreamhost.com/hc/en-us/articles/219539467-DNSSEC-overview)

Let's see the output of our `dnssec_sign.sh` script:

```shell
root@ganesha:/var/nsd/zones/master# dnssec_sign.sh 9-rg.com 
9-rg.com.       86400   IN      DS      61419 7 1 2b2a9ff48c50d380fb8a1dfd98441ae346d69c02
9-rg.com.       86400   IN      DS      61419 7 2 ae0e5e3d0ab5b6d4d36450356f1d77dbaa8b156e29aac8b8f64d448d3d054f4b
root@ganesha:/var/nsd/zones/master# 
```

This output contain the informations that we shall to publish in a dedicated support ticket.

When provide add the informations about DNSSEC into the whois database you can find them using this command:

```shell
riccardo@trimurti:~/Work/telecom.lobby/OpenBSD$ whois 9-rg.com | grep DNSSEC
   DNSSEC: signedDelegation
   DNSSEC DS Data: 22020 7 2 548BDCFE84669FFA8783E753BD1A8279C5374DF32707D5CB6B74445BCC733F5E
   DNSSEC DS Data: 22020 7 1 728023CADD4CDF96909000A9E79BEF424B3677A0
DNSSEC: signedDelegation
riccardo@trimurti:~/Work/telecom.lobby/OpenBSD$ 
	
```

Change the `nsd.conf` file and specify the new signed zone:

```shell
zone:
name: "9-rg.com"
zonefile: "master/9rgcom.zone.signed"
include-pattern: "telecomlobby"
```

And reload the server:

```shell
root@ganesha:/var/nsd/etc# rcctl restart nsd                                                                                                                      
nsd(ok)
nsd(ok)
root@ganesha:/var/nsd/etc# 
```



![](https://github.com/redeltaglio/OpenBSD/raw/master/img/dnskey_dnssec.png)

### Wireless Internet Service Provider

#### Mikrotik LTE routers and customers

![](https://github.com/redeltaglio/OpenBSD/raw/master/img/3fe10498-bb07-4ca3-972f-bd62b53026b0.jpeg)

Two types, one are end users the other routers to our network that create WISP point of presence, one appliance of my network the other one LTE rural customer. In the WISP POP configuration LTE antennas are used only to bridge and [APN](https://en.wikipedia.org/wiki/Access_Point_Name) protocol got the passthrough flag active. 

In the two cases CPE is a [Mikrotik LHG LTE kit](https://mikrotik.com/product/lhg_lte_kit).

#### Local configuration

![](https://github.com/redeltaglio/OpenBSD/raw/master/img/LHGR-LTE.jpg)

Perform a `/system reset-configuration no-defaults=yes` to the board and then add default IPv4 address `/ip address add address=192.168.88.1/24 interface=ether1`. For security disable and enable ssh service: 

- `/ip service set ssh disabled=yes`
- `/ip service set ssh disabled=no`

Then use the console script, that on march 2022 has been develop in its new version:

```bash
taglio@trimurti:~/Work/telecom.lobby/OpenBSD$ ./console -I telecom.lobby -SO mikrotik -LTE
Local or remote configuration?: [local|remote|next] local
Host 192.168.88.1 not found in /home/taglio/.ssh/known_hosts
Type the LTE router hostname: 803328-LHG
Type the LTE router LTE provider: [digi|xenet] digi
Type the LTE SIM PIN: 1234
Type the L2TP POP public hostname: ixp.telecomlobby.com
🔐 Type the L2TP user password:  ****************************************************************
🔐 Type the L2TP IPSEC key:  ****************************************************************
🔐 Type the router user password:  ****************************************************************
/interface l2tp-client
add add-default-route=yes allow-fast-path=yes connect-to=ixp.telecomlobby.com \
    disabled=no ipsec-secret="XXXX" comment=ixp.telecomlobby.com \
    use-ipsec=yes use-peer-dns=no user="803328-LHG" password="XXXX"
/interface lte apn
add apn=internet.digimobil.es name=digi comment="MCCMNC=21407 MVNO=DIGI" use-peer-dns=no
/interface lte
set [ find ] allow-roaming=yes apn-profiles=digi name=lte1 network-mode=lte \
    pin=1234 comment="MCCMNC=21407 MVNO=DIGI"
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/ip pool
add name=dhcpd ranges=10.1.10.10-10.1.10.254
/ip dhcp-server
add address-pool=dhcpd disabled=no interface=ether1 name=dhcpd src-address=\
    10.1.10.1
/ip neighbor discovery-settings
set discover-interface-list=!dynamic
/ip address
remove [find interface=ether1]
add address=10.1.10.1/24 interface=ether1 network=10.1.10.0
/ip cloud
set ddns-enabled=yes
/ip dhcp-server network
add address=10.1.10.0/24 dns-server=10.1.10.1 gateway=10.1.10.1
/ip dns
set allow-remote-requests=yes set servers="8.8.8.8,8.8.4.4"
/ip firewall address-list
add address=cloud.mikrotik.com list=ddns
add address=cloud2.mikrotik.com list=ddns
/ip firewall mangle
add action=mark-routing chain=output dst-address-list=ddns new-routing-mark=\
    ddns passthrough=yes
/ip firewall nat
add action=masquerade chain=srcnat src-address=10.1.10.0/24
/ip route
add distance=1 gateway=lte1 routing-mark=ddns
/ip route rule
add action=lookup-only-in-table routing-mark=ddns table=ddns
/system clock
set time-zone-autodetect=no time-zone-name=Europe/Madrid
/system identity
set name="803328-LHG"
/system ntp client
set enabled=yes primary-ntp=185.232.69.65 secondary-ntp=192.36.143.130
/user
add group=full name=taglio
remove [find name=admin]
/user
set [find name=taglio] password="XXXX"
Go Ahead? [yes/no]: yes
Connecting to 803328-LHG for first configuration...
Warning: Permanently added '192.168.88.1' (RSA) to the list of known hosts.
console-2803-30873                                                                                                                                                                                                                                      100% 2071   868.9KB/s   00:00    
taglio@trimurti:~/Work/telecom.lobby/OpenBSD$ 
```

Is about interest speaking about [Mobile Virtual Network Operator](https://en.wikipedia.org/wiki/Mobile_virtual_network_operator) because are hard coded inside and for now only DIGI and PTVTELECOM under the name of XENET are present in the system. They are connection parameters for LTE connection.

#### Getting and working onto variables.

```bash
taglio@trimurti:~/Work/telecom.lobby/OpenBSD$ ./console -I telecom.lobby -SO mikrotik -LTE
Local or remote configuration?: [local|remote|next] next
Getting variables...
DDNS --> d6ad0ef88577.sn.mynetname.net
IMEI --> 355654094754095
IMSI --> 214035069297112
ICCID --> 8934129027000121120
Type the MSISDN: 744658838
adding DDNS to ixp.telecomlobby.com
adding comment to MOTD onto 803328-LHG
Producing values...
The public hostname is mor.telecomlobby.com and must resolve 188.213.5.220
The routerid is 192.168.13.115
Is 803328-LHG a LTE router or a LTE CPE?: [router|cpe] router
The LTE router ADM vlan is 172.16.167.0/24
The LTE router DATA vlan is 172.16.255.0/24
    The LTE router HAM vlan is 172.16.231.0/24
taglio@trimurti:~/Work/telecom.lobby/OpenBSD$
```

Some acronyms very important in the LTE network:

- [IMEI](https://en.wikipedia.org/wiki/International_Mobile_Equipment_Identity) that means International Mobile Equipment Identity, world wide unique identification of the radio device. In our case a [R11e-LTE](https://mikrotik.com/product/r11e_lte) device.
- [IMSI](https://en.wikipedia.org/wiki/International_mobile_subscriber_identity) that means International Mobile Subscriber identity, world wide unique [SIM card](https://en.wikipedia.org/wiki/SIM_card) identification.
- [ICCID](https://en.wikipedia.org/wiki/SIM_card#ICCID), that means Integrated Circuit Card Identifier, world wide unique Sim card serial number.
- [MSISDN](https://en.wikipedia.org/wiki/MSISDN), that means Mobile Station International Subscriber Directory Number, world wide unique [telephone number](https://en.wikipedia.org/wiki/E.164) mapped to the SIM card.

As you can see our tool give us also a aleatory public host that have to be configured into public DNS tree daemons. Also remember to add the tuple "local hostname <--> public hostname" to the internal DNS daemon. Also we've got a new `routerid` for OSPF configure, and networks for different vlans to add in the remote section in the case it will be configured as a router.

#### Remote configuration

First of all I want to underline that lines of routers connected to our network to form a little POP in the WISP appliance are connected to the Internet using a provider that give access to it using NAT. Taking this in consideration will perform in different steps:

- IPSec connection will use [NAT traversal](https://en.wikipedia.org/wiki/NAT_traversal) feature because its bare nature, router is behind NAT! Others have to accept incoming connection to the `4500 UDP` port from the dynamic host that we've just configured.
- Being behind NAT means that we should not use GRE over IPsec transport but we will use IPsec tunnel with a workaround about lack of [VTI](https://www.cisco.com/c/en/us/td/docs/security/asa/asa97/configuration/vpn/asa-97-vpn-config/vpn-vti.pdf) in Mikrotik. That means that we've got to use a reserved IPv4 network as IPsec policy. We decided to use `203.0.113.0/24`. Every machine got the last octet equal to the one of gre interface that work in the tunnel. Ips are /30 and are assigned to a fake bridge called `lo1`.  
- Use `src/etc/pf.conf.table.lte` to add the new LTE WISP point of presence.
- Because its nature behind NAT use [l2tp](https://en.wikipedia.org/wiki/Layer_2_Tunneling_Protocol) to add a public IPv4 address to it. But you can ever do it in IPv6 to not consume an IPv4 from your pool. Remember that this IPSec and L2TP tunnel will be created using one of our Mikrotik endpoints. Be careful to use as the Internet gateway for the workstation LAN the same endpoint. This machine will be not configured in the automatic IPSec configuration and will delete its public IPv4 address for a service special access. 

Next start to configure the new LTE last mile Internet access router, in my case public host is `mir.telecomlobby.com`, internal host is `thangka.telecom.lobby` and router id is `192.168.13.10`:

```
root@ganesha:/var/nsd/zones/master# cat telecomlobby.com.zone | grep ipsec20     
ipsec20591              IN TXT "uk:ganesha;us:saraswati;jp:shiva;es:indra;bg:neo;au:vishnu;mad:bhagavati;ixp:calli;br:xolotl;za:umnyama;mir:thangka;"
root@ganesha:/var/nsd/zones/master# 
taglio@trimurti:~/Work/telecom.lobby/OpenBSD$ dig A mir.telecomlobby.com @8.8.8.8 +short
188.213.5.222
taglio@trimurti:~/Work/telecom.lobby/OpenBSD$ dig -x 188.213.5.222 +short
mir.telecomlobby.com.
taglio@trimurti:~/Work/telecom.lobby/OpenBSD$ 
```

Next launch the tool using `remote` as option this time we will connect using public IPv4 address, as the system is like it is installed in the customer and the configuration is post installation:

```
taglio@trimurti:~/Work/telecom.lobby/OpenBSD$ ./console -I telecom.lobby -SO mikrotik -LTE                                                                                                                                                                                               
Local or remote configuration?: [local|remote|next] remote
Type LTE router public hostname: fij.telecomlobby.com
Layer three test passed...   
# Host fij.telecomlobby.com found: line 224
/home/taglio/.ssh/known_hosts updated.
Original contents retained as /home/taglio/.ssh/known_hosts.old       
SSH key present and valid                                                                                                                                                                                                                                                 Warning: Permanently added 'fij.telecomlobby.com' (RSA) to the list of known hosts.                                                   LTE-reset.rsc 100% 1212    13.4KB/s   00:00                                                             
Script file loaded and executed successfully
configuring hostname, timezone, date, time                                                                                           
adding taglio RSA ssh key                   
id_rsa.pub 100%  574     8.9KB/s   00:00     
adding fij.telecomlobby.com common IPSEC settings
tmp.m96XmZhE1f 100%  921    14.0KB/s   00:00                                                 
Script file loaded and executed successfully                          
tmp.MLucd73xss 100%  915    11.6KB/s   00:00                                                                           
Script file loaded and executed successfull                                                                                           
installing local private and public key and peers public keys
Type local directory with p12 exported IPsec certificates: /home/taglio/Work/redama/ipsec                                      failure: already have such vlan                                                                                                       
failure: already have such address          
Type the LTE routerid: 192.168.13.115
configuring OSPF daemon                                               
taglio@trimurti:~/Work/telecom.lobby/OpenBSD$
```

#### LTE: unstable cells. 

Sometimes and in some environment depending on relative problems to cells or temporary problems with virtual mobile operators or MMC. We add some cycles and one special route to test LTE connectivity using [netwatch](https://wiki.mikrotik.com/wiki/Manual:Tools/Netwatch). For example mobile operator Orange in the Spanish territory cut data connection every hour by sending a special [GSM command](http://howltestuffworks.blogspot.com/2012/02/deactivate-eps-bearer-context-request.html) `+CGEV: EPS PDN DEACT 5`:

```bash
/system logging action
add disk-file-count=6 disk-file-name=flash/ltemem name=ltemem target=disk
/system logging
add action=ltemem disabled=yes topics=lte
/system script
add dont-require-permissions=no name=ltereboot owner=admin policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    "/system reboot;"
/tool netwatch
add disabled=no down-script="/system/logging/set [find topics=\"lte\"] disabled=no\r\
    \n:delay delay-time=5 ; \r\
    \n:if ([/ping 8.8.8.8 count=5 size=64 interval=2s]=0) do={\r\
    \n\t/interface lte set [find] disabled=yes\r\
    \n                :delay delay-time=3\r\
    \n                 /interface lte set [find] disabled=no\r\
    \n\t:local continue true\r\
    \n\t:local counter 0\r\
    \n                :delay delay-time=180 ; \r\
    \n\t:while (\$continue) do={\r\
    \n\t\t:if ([/ping 8.8.4.4 count=5 size=64 interval=2s]=0) do={ \r\
    \n\t\t\t:set \$counter (\$counter + 1)\r\
    \n\t\t\t:if (\$counter>5) do={\t \r\
    \n\t\t\t\t:local now [/system/clock/get value-name=time]\r\
    \n                                                                :local psk [:pick ([/certificate scep-server otp generate minutes-valid=1 \
    as-value]->\"password\") 0 8];\r\
    \n                                                                :local lhn [/system/identity/get name]\r\
    \n                                                               /system/scheduler/add name=ltereboot on-event={/system reboot;} start-time=\
    (\$now+15m)\r\
    \n                                                                /tool/sms/set receive-enabled=yes secret=\$psk allowed-number=6609222890 p\
    ort=lte1\r\
    \n                                                                /tool/sms/send lte1 phone-number=660922890 message=\"\$lhn with \$psk LTE \
    lock, reboot\?\"\r\
    \n                                                                :delay delay-time=15m\r\
    \n\r\
    \n\t\t\t} else={\r\
    \n\t\t\t\t/interface lte set [find] disabled=yes\r\
    \n                                                               :delay delay-time=3\r\
    \n                                                               /interface lte set [find] disabled=no \r\
    \n\t\t\t} else={\r\
    \n\t\t\t\t:set \$continue false \r\
    \n\t\t\t\t:set \$counter 0\r\
    \n\t\t\t}\r\
    \n\t\t}\r\
    \n\t}\r\
    \n}\r\
    \n" host=9.9.9.9 http-codes="" interval=20s packet-count=3 packet-interval=2s packet-size=54 start-delay=4m test-script="" \
    thr-loss-percent=100% timeout=1s type=icmp up-script=":local uuic ([/interface/lte/monitor lte1 once as-value]->\"uicc\")\r\
    \n:log info \"LTE \$uuic up and running...\"\r\
    \n/tool/sms/set receive-enabled=no secret=\"\" allowed-number=\"\"\r\
    \n/system/scheduler/remove [find]\r\
    \n/system/logging/set [find topics=\"lte\"] disabled=yes\r\
    \n\r\
    \n"


```

```bash
/tool e-mail
set address=192.168.13.44 from=calli@telecom.lobby password=XXX port=587 start-tls=yes user=robot_redamaes
/ppp profile
add change-tcp-mss=no dns-server=8.8.8.8,8.8.4.4 local-address=172.16.30.1 name=L2TP-PUBLIC on-down=\
    ":local interfaceName\r\
    \n:set interfaceName [/interface get \$interface name]\r\
    \n\r\
    \n/ip dns cache flush \r\
    \n /tool e-mail send start-tls=yes to=riccardo@redama.es body=\"\$interfaceName down\"" on-up=":local interfaceName\r\
    \n:set interfaceName [/interface get \$interface name]\r\
    \n\r\
    \n /tool e-mail send start-tls=yes to=riccardo@redama.es body=\"\$interfaceName up\"" use-encryption=yes use-ipv6=no use-mpls=no use-upnp=no

```

Another tool to take care of IPv4 change into LTE interfaces is managed by OpenBSD under `src/root/Bin/lteddns.sh`, configured in [crontab(1)](https://man.openbsd.org/crontab.1) to be executed every 60 seconds by [cron(8).](https://man.openbsd.org/cron) It's very simple, flush the unbound cache for the domain name used in Mikrotik, flush the PF table and reload it:

```bash
# crontan -l
SHELL=/bin/sh
PATH=/bin:/sbin:/usr/bin:/usr/sbin
HOME=/var/log
#minute hour    mday    month   wday    [flags] command
*     *   *   *   *   /bin/ksh /root/Bin/lteddns.sh
#
```



```bash
#!/bin/ksh

let counter=1
while ((counter<5)); do
  ((counter=counter+1))
  /bin/sleep $((10-$(/bin/date +%s)%10))
  /usr/sbin/unbound-control flush_zone mynetname.net
  for ddns in $(cat /etc/pf.conf.table.lte | grep mynetname.net); do
      oldip=$(dig A "${ddns}" +short)
      (( $(/sbin/pfctl -t lte -T show | grep -c "${oldip}") == 0 )) && (
        /usr/sbin/ikectl reload
        /sbin/pfctl -t lte -T kill
        /sbin/pfctl -t lte -T add -f /etc/pf.conf.table.lte
      )
  done
done

```

Also we add some scripts and one scheduler that run 20 minutes after every reboot to check wireguard connections:

```bash
/system script
add dont-require-permissions=no name=wireguard_jp.telecomlobby.com owner=taglio policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=":local int [/interface/wireguard/peers/get \
    value-name=interface [find endpoint-address=jp.telecomlobby.com]]\r\
    \n:local source [/ip/address/get value-name=address [find interface=\$int]]\r\
    \n:local ip [:toip [:pick \$source 0 [:find \$source \"/\"]]]\r\
    \n:local pip (\$ip - 1) \r\
    \n:if ([/ping \$pip count=5 size=64 interval=2s vrf=vrf1]=0) do={ /interface/wireguard/peers/disable  [find endpoint\
    -address=jp.telecomlobby.com] ; /interface/wireguard/peers/enable  [find endpoint-address=jp.telecomlobby.com]}"
add dont-require-permissions=no name=wireguard_bg.telecomlobby.com owner=taglio policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=":local int [/interface/wireguard/peers/get \
    value-name=interface [find endpoint-address=bg.telecomlobby.com]]\r\
    \n:local source [/ip/address/get value-name=address [find interface=\$int]]\r\
    \n:local ip [:toip [:pick \$source 0 [:find \$source \"/\"]]]\r\
    \n:local pip (\$ip - 1) \r\
    \n:if ([/ping \$pip count=5 size=64 interval=2s vrf=vrf1]=0) do={ /interface/wireguard/peers/disable  [find endpoint\
    -address=bg.telecomlobby.com] ; /interface/wireguard/peers/enable  [find endpoint-address=bg.telecomlobby.com]}"
add dont-require-permissions=no name=wireguard_au.telecomlobby.com owner=taglio policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=":local int [/interface/wireguard/peers/get \
    value-name=interface [find endpoint-address=au.telecomlobby.com]]\r\
    \n:local source [/ip/address/get value-name=address [find interface=\$int]]\r\
    \n:local ip [:toip [:pick \$source 0 [:find \$source \"/\"]]]\r\
    \n:local pip (\$ip - 1) \r\
    \n:if ([/ping \$pip count=5 size=64 interval=2s vrf=vrf1]=0) do={ /interface/wireguard/peers/disable  [find endpoint\
    -address=au.telecomlobby.com] ; /interface/wireguard/peers/enable  [find endpoint-address=au.telecomlobby.com]}"
add dont-require-permissions=no name=wireguard_br.telecomlobby.com owner=taglio policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=":local int [/interface/wireguard/peers/get \
    value-name=interface [find endpoint-address=br.telecomlobby.com]]\r\
    \n:local source [/ip/address/get value-name=address [find interface=\$int]]\r\
    \n:local ip [:toip [:pick \$source 0 [:find \$source \"/\"]]]\r\
    \n:local pip (\$ip - 1) \r\
    \n:if ([/ping \$pip count=5 size=64 interval=2s vrf=vrf1]=0) do={ /interface/wireguard/peers/disable  [find endpoint\
    -address=br.telecomlobby.com] ; /interface/wireguard/peers/enable  [find endpoint-address=br.telecomlobby.com]}"
add dont-require-permissions=no name=wireguard_us.telecomlobby.com owner=taglio policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=":local int [/interface/wireguard/peers/get \
    value-name=interface [find endpoint-address=us.telecomlobby.com]]\r\
    \n:local source [/ip/address/get value-name=address [find interface=\$int]]\r\
    \n:local ip [:toip [:pick \$source 0 [:find \$source \"/\"]]]\r\
    \n:local pip (\$ip - 1) \r\
    \n:if ([/ping \$pip count=5 size=64 interval=2s vrf=vrf1]=0) do={ /interface/wireguard/peers/disable  [find endpoint\
    -address=us.telecomlobby.com] ; /interface/wireguard/peers/enable  [find endpoint-address=us.telecomlobby.com]}"
add dont-require-permissions=no name=wireguard_choopa.telecomlobby.com owner=taglio policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=":local int [/interface/wireguard/peers/get \
    value-name=interface [find endpoint-address=choopa.telecomlobby.com]]\r\
    \n:local source [/ip/address/get value-name=address [find interface=\$int]]\r\
    \n:local ip [:toip [:pick \$source 0 [:find \$source \"/\"]]]\r\
    \n:local pip (\$ip - 1) \r\
    \n:if ([/ping \$pip count=5 size=64 interval=2s vrf=vrf1]=0) do={ /interface/wireguard/peers/disable  [find endpoint\
    -address=choopa.telecomlobby.com] ; /interface/wireguard/peers/enable  [find endpoint-address=choopa.telecomlobby.co\
    m]}"
add dont-require-permissions=no name=wireguard_uk.telecomlobby.com owner=taglio policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=":local int [/interface/wireguard/peers/get \
    value-name=interface [find endpoint-address=uk.telecomlobby.com]]\r\
    \n:local source [/ip/address/get value-name=address [find interface=\$int]]\r\
    \n:local ip [:toip [:pick \$source 0 [:find \$source \"/\"]]]\r\
    \n:local pip (\$ip - 1) \r\
    \n:if ([/ping \$pip count=5 size=64 interval=2s vrf=vrf1]=0) do={ /interface/wireguard/peers/disable  [find endpoint\
    -address=uk.telecomlobby.com] ; /interface/wireguard/peers/enable  [find endpoint-address=uk.telecomlobby.com]}"
/system scheduler
add interval=20m name=wireguard_after on-event=" /system/script/run wireguard_au.telecomlobby.com\r\
    \n /system/script/run wireguard_uk.telecomlobby.com\r\
    \n /system/script/run wireguard_br.telecomlobby.com\r\
    \n /system/script/run wireguard_bg.telecomlobby.com\r\
    \n /system/script/run wireguard_us.telecomlobby.com\r\
    \n /system/script/run wireguard_jp.telecomlobby.com\r\
    \n /system/script/run wireguard_choopa.telecomlobby.com" policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon start-time=startup
```





#### LTE: more tunes and some hacks.

![](https://github.com/redeltaglio/altBSD_network/raw/master/img/lte_calc.jpg)

As mobile technology has grown up in the decades with dizzying improvements, providers have to cover themselves above all with endless consumption rates. Remember that LTE with carrier aggregation, what Mikrotik for example call [LTE6](https://mikrotik.com/product/r11e_lte6), and strong signal strength could deliver to the client, or why not to a little point of presence a tower, more than 300mbps of theoretical throughput (layer one) to the installation. A lot of if good administrated with shaping, queues and bufferbloat! *And we're not speak about 5G...*

So if we're not a single device connecting to the Internet, we're a customer, an office or in some cases a little point of presence we've to take care to some details. 

The first of is [TTL](https://en.wikipedia.org/wiki/Time_to_live), just fake it with `mangle` features of iptables, in this manner we're acting like an Android device:

```bash
/ip firewall mangle
add action=change-ttl chain=prerouting in-interface=lte1 new-ttl=increment:5 passthrough=yes ttl=equal:1
add action=change-ttl chain=postrouting new-ttl=set:64 out-interface=lte1 passthrough=yes
```

Next sometimes provider could ban ourselves from network, so we've got to loose SIM card contract. But sometimes they ban probably also serial number of the modem that we use to connect to the mobile network. What is called IMEI. How to change it?

Modem mounted by Mikrotik devices are from [Luat 合宙 |通信](https://www.openluat.com/welcome), a Chinese manufacturer very interesting by the way. Openluat modems speak [AT commands](https://en.wikipedia.org/wiki/Hayes_command_set), which specifications are:

- [Openluat AT commands](https://github.com/redeltaglio/altBSD_network/raw/master/pdf/AT%20COMMAND%20Set%20for%20Luat%204G%20Modules_V3.89.pdf)

To change IMEI in [R11e-LTE](https://mikrotik.com/product/r11e_lte) just do (change 000000000000000 with your new IMEI):

```bash
/interface lte at-chat lte1 input="AT*MRD_IMEI=R"
/interface lte at-chat lte1 input="AT*MRD_IMEI=D"
/interface lte at-chat lte1 input="AT*MRD_IMEI=W,0101,11JAN1970,000000000000000"
/interface lte at-chat lte1 input="AT+RESET"
```

To change IMEI in [R11e-LTE6](https://mikrotik.com/product/r11e_lte6):

```bash
/interface lte at-chat lte1 input="AT*PROD=2"
/interface lte at-chat lte1 input="AT*MRD_IMEI=R"
/interface lte at-chat lte1 input="AT*MRD_IMEI=D"
/interface lte at-chat lte1 input="AT*MRD_IMEI=W,0,01JAN1970,000000000000000"
/interface lte at-chat lte1 input="AT*PROD=0"
/interface lte at-chat lte1 input="AT+RESET"
```



### Hamradio passive and active point of presence

#### Linux Rasberry and HackRF

## Annexed

#### OpenBSD, Mikrotik and EdgeOS firewall

![](https://github.com/redeltaglio/OpenBSD/raw/master/img/mkdf.png)

Let's explain how firewall does it works in our network. We shall start with address lists, that takes different names depending what system operative does implement them:

- OpenBSD, [pf(4)](https://man.openbsd.org/pf), [tables](https://www.openbsd.org/faq/pf/tables.html)
- Mikrotik RouterOS, [ip firewall](https://help.mikrotik.com/docs/display/ROS/Firewall), [address-list](https://wiki.mikrotik.com/wiki/Manual:IP/Firewall/Address_list). Remember that Mikrotik use [netfilter iptables](https://www.netfilter.org/).
- Ubiquiti EdgeOS, [firewall group](https://help.ui.com/hc/en-us/articles/218889067-EdgeRouter-How-to-Create-a-Guest-LAN-Firewall-Rule). EdgeOS is a modified version of [VyOS](https://vyos.io/), better saying is also based upon [iptables(8)](https://manpages.debian.org/jessie/iptables/iptables.8.en.html).

Those are the address lists that we use:

**clientes** where we add the public IPv4 assigned to our customers of the WISP service, customers could served with [pppoe](https://en.wikipedia.org/wiki/Point-to-Point_Protocol_over_Ethernet) daemon or [l2tp](https://en.wikipedia.org/wiki/Layer_2_Tunneling_Protocol):

```bash
188.213.5.220/32
188.213.5.221/32
188.213.5.222/32
188.213.5.223/32
188.213.5.240/32
188.213.5.241/32
188.213.5.242/32
188.213.5.243/32
188.213.5.244/32
188.213.5.245/32
188.213.5.246/32
188.213.5.247/32
188.213.5.236/32
188.213.5.237/32
188.213.5.238/32
188.213.5.239/32
5.134.119.165/32
```

**users** where we add local private subnet that could be translated with nat to go outside in the Internet:

```bash
172.16.16.0/24
172.16.17.106
172.16.18.0/24
172.16.19.0/24
172.16.23.0/24
```

**ipsec** that are the public IPv4 of others machines connected to our network with IPsec, it grow automatically with our program:

```bash
2.139.174.201
5.134.119.135
45.63.116.141
78.141.201.0
94.72.143.163
139.180.165.223
139.180.206.19
155.138.247.27
160.119.248.111
188.213.5.62
216.238.100.26
```

A special list is **roadwarrior** that contains domain names and it used only in CHR instances. In customers we use [ip cloud](https://help.mikrotik.com/docs/display/ROS/Cloud) to update the dynamic dns entrance. 

```bash
[admin@cornus-LHG] /ip cloud> export
/ip cloud set ddns-enabled=yes ddns-update-interval=1m
[admin@cornus-LHG] /ip cloud> pr
          ddns-enabled: yes
  ddns-update-interval: 1m
           update-time: yes
        public-address: 79.116.87.98
              dns-name: d6af0ec1ec8d.sn.mynetname.net
                status: updated
               warning: Router is behind a NAT. Remote connection might not work.
[admin@cornus-LHG] /ip cloud> 

```

Another kind of list used by OpenBSD and Mikrotik RouterOS is the list of interfaces, them purposes are simplify the rules sets of firewalls.

**gre** interface list in RouterOS, that grown dynamically with out scripts:

```bash
[taglio@calli.telecom.lobby] /interface list> export
/interface list
add name=gre
/interface list member
add interface=gre-tunnel1 list=gre
add interface=gre-tunnel2 list=gre
add interface=gre-tunnel3 list=gre
add interface=gre-tunnel4 list=gre
add interface=gre-tunnel5 list=gre
add interface=gre-tunnel6 list=gre
add interface=gre-tunnel7 list=gre
add interface=gre-tunnel8 list=gre
add interface=gre-tunnel9 list=gre
add interface=gre-tunnel10 list=gre
[taglio@calli.telecom.lobby] /interface list> 
```

In OpenBSD interfaces lists are created using the `groups` flavor, that could configured in the [hostname.if(5)](https://man.openbsd.org/hostname.if.5) file: 

```bash
root@ganesha:/var/www/htdocs/es.telecomlobby.com/radio_aficionado# ifconfig gre9
gre9: flags=8051<UP,POINTOPOINT,RUNNING,MULTICAST> mtu 1392
        description: br.telecomlobby.com
        index 24 priority 0 llprio 6
        keepalive: timeout 5 count 2
        encap: vnetid none txprio payload rxprio packet
        groups: gre
        status: active
        tunnel: inet 78.141.201.0 --> 216.238.100.26 ttl 64 nodf ecn
        inet 10.10.10.62 --> 10.10.10.61 netmask 0xfffffffc
root@ganesha:/var/www/htdocs/es.telecomlobby.com/radio_aficionado# 
```

#### EdgeOS wireless internet service provider route table management.

![](https://upload.wikimedia.org/wikipedia/commons/thumb/a/a7/Pluto-01_Stern_03_Pluto_Color_TXT.jpg/640px-Pluto-01_Stern_03_Pluto_Color_TXT.jpg)

Always based upon geoip concept, we administrate routing tables for the WISP service using four ids:

```bash
#!/bin/bash

#VyOS route ctrl

declare -a groups=("12" "34" "43" "56")
```

Tool is present in  `src/edgeos/config/routectrl/route_ctrl.sh` and got various options:

```bash
root@indra:/config/routectrl# ./route_ctrl.sh 
./route_ctrl.sh have to be used with the following options 
 
-B              -> boot geoip routing table populate [o]
-T [tunnel]     -> tunnel periodic check [o]
-P [tunnel]     -> pluto up/down [o]
-L              -> loop to check tunnels are alive [o]

root@indra:/config/routectrl# 
```

`-B` is called by `crontab` and detached in the background after a reboot:

```bash
root@indra:/config/routectrl# cat /etc/cron.d/vyatta-crontab
### Added by /opt/vyatta/sbin/vyatta-update-crontab.pl ###
@reboot root /config/routectrl/route_ctrl.sh -L </dev/null &>/dev/null &
@reboot root /config/routectrl/route_ctrl.sh -B </dev/null &>/dev/null &
root@indra:/config/routectrl# 
```

`-L` continuously check services looping around tun devices and calling `fping` to prove if tunnel is alive. Meanwhile it call `-T` with the correct tunnel device name.

`-P` is called by `strongswan`, by `pluto` daemon:

```bash
conn telecomlobby-AU
        left=%defaultroute
        leftauth=pubkey
        leftid=%indra@ca.telecomlobby.com
        leftprotoport=gre
        leftupdown="/config/routectrl/route_ctrl.sh -P tun6"
        ike=aes256-sha2_256-ecp256!
        esp=aes256-sha2_256-ecp256!
        right=139.180.165.223
        rightauth=pubkey
        rightid=%vishnu@ca.telecomlobby.com
        rightcert=/etc/ipsec.d/certs/au.telecomlobby.com.crt
        rightprotoport=gre
```

#### SSH client multiplexing 

```bash
srw-------  1 taglio taglio     0 mar 11 10:10 master-taglio@bhagavati.telecom.lobby:22.socket
srw-------  1 taglio taglio     0 mar 11 10:10 master-taglio@ca.telecom.lobby:22.socket
srw-------  1 taglio taglio     0 mar 11 10:10 master-taglio@ganesha.telecom.lobby:22.socket
srw-------  1 taglio taglio     0 mar 11 10:10 master-taglio@saraswati.telecom.lobby:22.socket
srw-------  1 taglio taglio     0 mar 11 10:10 master-taglio@shiva.telecom.lobby:22.socket
srw-------  1 taglio taglio     0 mar 11 10:10 master-taglio@varuna.telecom.lobby:22.socket
srw-------  1 taglio taglio     0 mar 11 10:10 master-taglio@xolotl.telecom.lobby:22.socket
```

SSH multiplexing let us open a control socket at the first connection to one host and reuse the tunnel for every following attempt to connect to the same host and let reduce overhead to execute the login process. As usual is a standard feature for the state of art remote terminal connection from the OpenBSD folks: [OpenSSH](https://www.openssh.com/).	

Our console central control tool use that feature simply adding those lines to the standard [ssh_config(5)](https://man.openbsd.org/ssh_config):

```bash
Host *.telecom.lobby
        ControlMaster auto
        ControlPath ~/.ssh/master-%r@%h:%p.socket
```

#### OpenBSD iked(8) fine tuning and interoperability.

![](https://github.com/redeltaglio/OpenBSD/raw/master/img/puffyiked.png)

We find the OpenBSD ikev2 implementation directly in the base system, it isn't very simple to understand but the fault is only our. Reading man pages will explain exactly how to use it, but, from I was an adolescent playing with Unix, *I'm too lame to read man man* as I use to write in my IRC whois state.

```bash
root@ganesha:/etc# find . -name "iked.*" ; cd iked && find .
./examples/iked.conf
./iked.conf
./iked.conf.jp.telecomlobby.com
./iked.conf.bg.telecomlobby.com
./iked.conf.spr.telecomlobby.com
./iked.conf.us.telecomlobby.com
./iked.conf.au.telecomlobby.com
./iked.conf.mad.telecomlobby.com
./iked.conf.ixp.telecomlobby.com
./iked.conf.br.telecomlobby.com
.
./ca
./ca/ca.crt
./certs
./certs/local.crt
./certs/jp.telecomlobby.com.crt
./certs/bg.telecomlobby.com.crt
./certs/au.telecomlobby.com.crt
./certs/mad.telecomlobby.com.crt
./certs/us.telecomlobby.com.crt
./certs/br.telecomlobby.com.crt
./crls
./export
./private
./private/local.key
./pubkeys
./pubkeys/ipv4
./pubkeys/ipv6
./pubkeys/fqdn
./pubkeys/fqdn/ixp.telecomlobby.com
./pubkeys/fqdn/spr.telecomlobby.com
./pubkeys/ufqdn
./pubkeys/ufqdn/indra@ca.telecomlobby.com
./pubkeys/ufqdn/calli@ca.telecomlobby.com
./local.pub
root@ganesha:/etc/iked# 
```

```bash
root@ganesha:/etc/iked# ipsecctl -sf 
flow esp in proto gre from 2.139.174.201 to 78.141.201.0 peer 2.139.174.201 srcid UFQDN/ganesha@ca.telecomlobby.com dstid UFQDN/indra@ca.telecomlobby.com type require
flow esp in proto gre from 5.134.119.135 to 78.141.201.0 peer 5.134.119.135 srcid UFQDN/ganesha@ca.telecomlobby.com dstid UFQDN/calli@ca.telecomlobby.com type require
flow esp in proto gre from 94.72.143.163 to 78.141.201.0 peer 94.72.143.163 srcid ASN1_DN//C=UK/ST=England/L=London/CN=uk.telecomlobby.com dstid ASN1_DN//C=BG/ST=Lovech/L=Troyan/O=Telecom Lobby/OU=VPNC/CN=bg.telecomlobby.com type require
flow esp in proto gre from 139.180.165.223 to 78.141.201.0 peer 139.180.165.223 srcid ASN1_DN//C=UK/ST=England/L=London/CN=uk.telecomlobby.com dstid ASN1_DN//C=AU/ST=New South Wales/L=Sidney/CN=au.telecomlobby.com type require
flow esp in proto gre from 139.180.206.19 to 78.141.201.0 peer 139.180.206.19 srcid ASN1_DN//C=UK/ST=England/L=London/CN=uk.telecomlobby.com dstid ASN1_DN//C=JP/ST=Tokyo/L=Heiwajima/CN=jp.telecomlobby.com type require
flow esp in proto gre from 155.138.247.27 to 78.141.201.0 peer 155.138.247.27 srcid ASN1_DN//C=UK/ST=England/L=London/CN=uk.telecomlobby.com dstid ASN1_DN//C=US/ST=Texas/L=Dallas/O=Telecom Lobby/OU=VPNC/CN=us.telecomlobby.com type require
flow esp in proto gre from 216.238.100.26 to 78.141.201.0 peer 216.238.100.26 srcid ASN1_DN//C=UK/ST=England/L=London/CN=uk.telecomlobby.com dstid ASN1_DN//C=BR/ST=Sao Paulo/L=Sao Paulo/O=Telecom Lobby/OU=VPNC/CN=br.telecomlobby.com type require
flow esp out proto gre from 78.141.201.0 to 2.139.174.201 peer 2.139.174.201 srcid UFQDN/ganesha@ca.telecomlobby.com dstid UFQDN/indra@ca.telecomlobby.com type require
flow esp out proto gre from 78.141.201.0 to 5.134.119.135 peer 5.134.119.135 srcid UFQDN/ganesha@ca.telecomlobby.com dstid UFQDN/calli@ca.telecomlobby.com type require
flow esp out proto gre from 78.141.201.0 to 94.72.143.163 peer 94.72.143.163 srcid ASN1_DN//C=UK/ST=England/L=London/CN=uk.telecomlobby.com dstid ASN1_DN//C=BG/ST=Lovech/L=Troyan/O=Telecom Lobby/OU=VPNC/CN=bg.telecomlobby.com type require
flow esp out proto gre from 78.141.201.0 to 139.180.165.223 peer 139.180.165.223 srcid ASN1_DN//C=UK/ST=England/L=London/CN=uk.telecomlobby.com dstid ASN1_DN//C=AU/ST=New South Wales/L=Sidney/CN=au.telecomlobby.com type require
flow esp out proto gre from 78.141.201.0 to 139.180.206.19 peer 139.180.206.19 srcid ASN1_DN//C=UK/ST=England/L=London/CN=uk.telecomlobby.com dstid ASN1_DN//C=JP/ST=Tokyo/L=Heiwajima/CN=jp.telecomlobby.com type require
flow esp out proto gre from 78.141.201.0 to 155.138.247.27 peer 155.138.247.27 srcid ASN1_DN//C=UK/ST=England/L=London/CN=uk.telecomlobby.com dstid ASN1_DN//C=US/ST=Texas/L=Dallas/O=Telecom Lobby/OU=VPNC/CN=us.telecomlobby.com type require
flow esp out proto gre from 78.141.201.0 to 216.238.100.26 peer 216.238.100.26 srcid ASN1_DN//C=UK/ST=England/L=London/CN=uk.telecomlobby.com dstid ASN1_DN//C=BR/ST=Sao Paulo/L=Sao Paulo/O=Telecom Lobby/OU=VPNC/CN=br.telecomlobby.com type require
root@ganesha:/etc/iked# 
```

```bash
ikev2 "us.telecomlobby.com" active transport \
        proto gre from 78.141.201.0 to 155.138.247.27 \
        local uk.telecomlobby.com peer us.telecomlobby.com \
        ikesa  prf hmac-sha2-512  enc aes-256-gcm-12 group brainpool512  \
        childsa  enc chacha20-poly1305 group curve25519 \
        srcid "/C=UK/ST=England/L=London/CN=uk.telecomlobby.com" \
        dstid "/C=US/ST=Texas/L=Dallas/O=Telecom Lobby/OU=VPNC/CN=us.telecomlobby.com" \
        ikelifetime 86400 lifetime 3600 \
        rfc7427 tag us.telecomlobby.com tap enc2
```

```bash
root@ganesha:/etc/iked/certs# openssl x509 -in local.crt -noout -text                                                                                                                                                                                                                    
Certificate:
    Data:
        Version: 3 (0x2)
        Serial Number: 1160289828120333519 (0x101a2d73819c8ccf)
    Signature Algorithm: sha256WithRSAEncryption
        Issuer: C=FR, ST=Seine-Saint-Denis, L=Aubervilliers, O=Telecom Lobby, OU=VPNC, CN=ca.telecomlobby.com
        Validity
            Not Before: Feb 11 23:52:24 2022 GMT
            Not After : Feb 11 23:52:24 2023 GMT
        Subject: C=UK, ST=England, L=London, CN=uk.telecomlobby.com
        Subject Public Key Info:
            Public Key Algorithm: rsaEncryption
                RSA Public-Key: (2048 bit)
                Modulus:
                    00:dd:cf:f7:81:46:3b:c6:e5:bf:df:b4:6e:6d:61:
                    cb:9e:a1:1c:c0:96:83:02:84:3e:4a:e0:12:12:cd:
                    e8:e8:b8:7e:2f:62:38:f9:e5:57:8c:50:7a:3d:19:
                    74:10:27:f3:65:72:7c:fa:48:35:de:5f:47:05:9b:
                    7d:4a:6d:a4:a3:a4:3f:14:f2:e4:c2:92:9a:d3:69:
                    2b:e2:9b:8d:7b:41:19:23:16:f3:2c:ec:7b:87:71:
                    60:4c:6e:de:db:d9:f2:35:b4:29:19:0d:0a:3c:b9:
                    d4:da:b9:90:b4:ea:46:cb:af:d6:22:c2:b6:8a:d0:
                    e6:36:df:f3:76:22:18:e7:52:b1:85:31:87:df:0f:
                    67:35:11:f1:8d:bc:f8:67:00:5e:5c:1f:18:75:aa:
                    d5:c6:36:7e:87:94:46:e5:cd:a9:1f:4d:f6:81:a8:
                    4c:ff:ef:3c:c0:6c:9a:04:09:74:c3:1e:cd:7b:2b:
                    36:ce:ec:6a:d1:a6:9a:e2:9a:80:06:31:04:54:92:
                    6b:a4:29:85:51:fe:45:34:1b:19:f5:27:9c:8a:90:
                    11:59:4f:60:cf:65:27:c7:70:2c:3a:6a:dd:1f:9a:
                    ef:80:4d:a9:18:f9:ea:d2:9d:40:67:14:06:d0:10:
                    29:80:10:67:d1:47:76:c4:74:7d:d1:4d:fe:ab:dd:
                    4d:1b
                Exponent: 65537 (0x10001)
        X509v3 extensions:
            X509v3 Extended Key Usage: 
                TLS Web Client Authentication
            X509v3 Subject Key Identifier: 
                43:80:64:B9:D2:B7:0B:9D:41:6D:99:E1:DB:76:EA:6A:06:CA:1C:A7
            X509v3 Authority Key Identifier: 
                keyid:2A:C5:93:9E:9B:03:61:A9:A9:B6:1E:B3:88:3D:40:C5:8E:E4:4F:50

            X509v3 Subject Alternative Name: 
                email:ganesha@ca.telecomlobby.com
            Netscape Comment: 
                Generated by RouterOS
    Signature Algorithm: sha256WithRSAEncryption
         3d:cb:1f:8e:3d:44:ca:d8:74:d5:21:ac:1c:2e:0f:6b:c1:f8:
         10:76:e6:ad:71:b9:4c:15:18:ac:e5:60:1e:88:5a:70:b8:82:
         e7:38:a4:3e:f2:ce:c2:99:29:df:c6:c0:98:80:da:2d:c4:b8:
         0f:62:d2:ce:fc:58:0e:2b:ae:cb:79:72:89:a9:97:a8:cd:35:
         c9:b1:91:64:5c:5e:6b:cd:9c:5a:4d:7f:e4:59:97:ea:22:28:
         14:4a:a5:79:19:ee:aa:35:42:2e:23:93:97:8a:f8:be:07:98:
         76:35:f4:ad:07:45:3a:6e:5d:9d:3d:cf:c7:bc:79:99:8a:48:
         40:1e:d3:2b:51:71:fa:e4:18:17:2d:e4:36:8d:24:4c:12:f6:
         73:7c:b2:79:c4:8c:04:6a:7e:c1:7a:01:c9:f0:d9:69:9e:43:
         99:4c:01:e7:67:44:91:47:1c:56:e4:36:8b:a5:8c:ad:b9:0c:
         57:c9:bf:09:0e:9c:d6:b7:ea:58:53:e1:29:df:aa:5c:17:06:
         51:dc:3d:e9:65:c2:84:8f:c8:d1:a2:fe:fa:05:93:92:05:54:
         6d:07:1f:c7:82:1a:b8:0d:1f:8a:10:f3:df:ea:3d:57:9f:d4:
         d6:75:74:7f:ba:ed:97:fc:bb:b2:3e:71:2e:ae:ab:32:b1:ce:
         a8:78:63:f0
root@ganesha:/etc/iked/certs# 
```

A couple of advisors:

- Be careful with file system permission under `/etc/iked`.
- Iked use various methods to authenticate to the opposite peer, in our mixed environment we use two:
  - OpenBSD to OpenBSD tunnels will use [RFC 7427](https://datatracker.ietf.org/doc/html/rfc7427) directives. In that case we store X509 certificates in under `/etc/iked/certs.` Normally under OpenBSD we had to use [ikectl(8)](https://man.openbsd.org/ikectl) but in our project we do by hand, or better saying using ours tools. I decide to archive local certificate under the name of `local.crt` and the others with the public hostname and the suffix `.crt`.  Certificates are selected also specifying the complete issuer field of the certificate. *Some fields could be randomized for security also*.
  - OpenBSD to Linux based OS will use public RSA key that will be selected using the [FQDN](https://en.wikipedia.org/wiki/Fully_qualified_domain_name) or the [SAN](https://en.wikipedia.org/wiki/Subject_Alternative_Name) extension fields of the certificate.
- We denied gre traffic onto egress interface, but in [enc(4)](https://man.openbsd.org/enc.4) pseudo device. 
- We use 1/3 default pf state timeout for gre protocol  `set timeout { other.first 20, other.multiple 20, other.single 10 }  `.

#### Queueing and FQ-Codel packet scheduler.

![](https://miro.medium.com/max/1400/1*1Siq7wg78OpNs58Znvu_sw.png)

Let's obtain values to do a correct queue sizing. First of all obtain the egress interface Internet bandwidth available on the VPS:

```bash
neo# wget -4 -O /dev/null http://speedtest.novoserve.com/10GB.bin 
--2022-04-16 09:12:56--  http://speedtest.novoserve.com/10GB.bin
Resolving speedtest.novoserve.com (speedtest.novoserve.com)... 185.80.233.178
Connecting to speedtest.novoserve.com (speedtest.novoserve.com)|185.80.233.178|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 10737418240 (10G) [application/octet-stream]
Saving to: '/dev/null'
/dev/null     2%[===>                                240.97M  20.5MB/s    eta 10m 39
neo# 
```

Next calculate bandwidth of the GRE interface from the point of view of a client, speaking for example about the WISP service:

```
taglio@trimurti:~/Work/telecom.lobby/OpenBSD$ wget -4 -O /dev/null http://speedtest.novoserve.com/10GB.bin
--2022-04-16 11:19:35--  http://speedtest.novoserve.com/10GB.bin
Resolving speedtest.novoserve.com (speedtest.novoserve.com)... 185.80.233.178
Connecting to speedtest.novoserve.com (speedtest.novoserve.com)|185.80.233.178|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 10737418240 (10G) [application/octet-stream]
Saving to: ‘/dev/null’

/dev/null                                                                0%[                                                                                                                                                                           ]  19,41M  6,92MB/s               ^C
taglio@trimurti:~/Work/telecom.lobby/OpenBSD$ 

```

Remember that you can use also iperf or others tools to size it. Next you can size also with web pages like [Speedtest](https://www.speedtest.net/) or [DSLreport](http://www.dslreports.com/speedtest), this last one is very interesting for a sizing of what is known like [bufferbloat](https://en.wikipedia.org/wiki/Bufferbloat), something so important to take in care when we're speaking about IPsec tunneling over conventional FTTH lines.

![](https://raw.githubusercontent.com/redeltaglio/OpenBSD/master/img/speedtest.png)

![](https://raw.githubusercontent.com/redeltaglio/OpenBSD/master/img/dslreport.png)

We apply [FQ-codel](https://github.com/redeltaglio/OpenBSD/raw/master/rfc/rfc8290.txt) packet scheduler and active queue management [OpenBSD implementation](https://github.com/openbsd/src/blob/master/sys/net/fq_codel.c) and [HFSC](https://github.com/redeltaglio/OpenBSD/raw/master/pdf/SIGCOM97.pdf) for link sharing [OpenBSD implementation](https://github.com/mbelop/src/blob/master/sys/net/hfsc.c) to output interfaces, better saying above gre(4) interfaces without classifying traffic and above egress interface doing pf tagging.

Be careful because in OpenBSD could be difficult to understand if we're using FQ-codel, HFSC or the twos together. Using the configuration key `flows` activate FQ-Codle, `bandwidth` and `max` HFSC; some [academic comparisons](http://theapt.org/~mike/hfsc-fq/), as you can see only upload is sized ([PRIQ](https://flylib.com/books/en/2.717.1.250/1/) is default packet scheduler):

| ![](https://github.com/redeltaglio/OpenBSD/raw/master/img/upload-priq.png) | ![](https://github.com/redeltaglio/OpenBSD/raw/master/img/cdf-priq.png) |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| ![](https://github.com/redeltaglio/OpenBSD/raw/master/img/upload-fq-codel.png) | ![](https://github.com/redeltaglio/OpenBSD/raw/master/img/cdf-fq-codel.png) |
| ![](https://github.com/redeltaglio/OpenBSD/raw/master/img/upload-hfsc.png) | ![](https://github.com/redeltaglio/OpenBSD/raw/master/img/cdf-hfsc.png) |
| ![](https://github.com/redeltaglio/OpenBSD/raw/master/img/upload-hfsc-fq.png) | ![](https://github.com/redeltaglio/OpenBSD/raw/master/img/cdf-hfsc-fq.png) |

At the end of our `pf.conf` file we add a `macro` referencing another text file called `pf.conf.macro.queue.out`:

```bash
root@arnuwanda:/etc# cat pf.conf.macro.queue.out                                                                                     
queue outq on gre1 bandwidth 55M max 60M flows 6144 qlimit 1024 default
queue outq on gre2 bandwidth 55M max 60M flows 6144 qlimit 1024 default
queue outq on gre3 bandwidth 55M max 60M flows 6144 qlimit 1024 default
queue outq on gre4 bandwidth 55M max 60M flows 6144 qlimit 1024 default
queue outq on gre5 bandwidth 55M max 60M flows 6144 qlimit 1024 default
queue outq on gre6 bandwidth 55M max 60M flows 6144 qlimit 1024 default
queue outq on gre7 bandwidth 55M max 60M flows 6144 qlimit 1024 default
root@arnuwanda:/etc# 
```

Let's see what is the meaning using the section [QUEUEING](https://man.openbsd.org/pf.conf#QUEUEING) of the `pf.conf` man page.

- `default`: packet that doesn't match other queue pass that one.
- `on int.`: where does the queue act.
- `qlimit`: maximum number of IP packet queued. Default is `50`
- `flows`: when packets are classified by the [stateful inspection engine](https://man.openbsd.org/pf.conf#STATEFUL_FILTERING), a flow identifier is assigned to all packets belonging to the state. Maximum is `32767`.

We've got to tools to take under control our queue system, [pfctl(8)](https://man.openbsd.org/pfctl.8) and [systat(1)](https://man.openbsd.org/systat.1).

```bash
root@arnuwanda:/etc# pfctl -sq -v  
queue outq on gre1 flows 6144 bandwidth 55M, max 60M default qlimit 1024
  [ pkts:      36770  bytes:    6662096  dropped pkts:      0 bytes:      0 ]
  [ qlength:   0/1024 ]
queue outq on gre2 flows 6144 bandwidth 55M, max 60M default qlimit 1024
  [ pkts:      66551  bytes:    6437852  dropped pkts:      0 bytes:      0 ]
  [ qlength:   0/1024 ]
queue outq on gre3 flows 6144 bandwidth 55M, max 60M default qlimit 1024
  [ pkts:      69775  bytes:    7021552  dropped pkts:      0 bytes:      0 ]
  [ qlength:   0/1024 ]
queue outq on gre4 flows 6144 bandwidth 55M, max 60M default qlimit 1024
  [ pkts:      61918  bytes:    6521360  dropped pkts:      0 bytes:      0 ]
  [ qlength:   0/1024 ]
queue outq on gre5 flows 6144 bandwidth 55M, max 60M default qlimit 1024
  [ pkts:   29161132  bytes: 32367471407  dropped pkts:   1253 bytes: 1679020 ]
  [ qlength:   0/1024 ]
queue outq on gre6 flows 6144 bandwidth 55M, max 60M default qlimit 1024
  [ pkts:      63361  bytes:    6638648  dropped pkts:      0 bytes:      0 ]
  [ qlength:   0/1024 ]
queue outq on gre7 flows 6144 bandwidth 55M, max 60M default qlimit 1024
  [ pkts:      56637  bytes:    6607256  dropped pkts:      0 bytes:      0 ]
  [ qlength:   0/1024 ]
root@arnuwanda:/etc# 
```

We can use with `-vv` to got a live update with bandwidth consumption:

```bash
queue outq on gre5 flows 6144 bandwidth 55M, max 60M default qlimit 1024
  [ pkts:   29205017  bytes: 32415555285  dropped pkts:   1253 bytes: 1679020 ]
  [ qlength:   0/1024 ]
  [ measured:   898.8 packets/s, 7.37Mb/s ]
```

And with [systat](https://dataswamp.org/~solene/2021-08-30-openbsd-qos-lan.html#_How_to_monitor) the result is:

![](https://github.com/redeltaglio/OpenBSD/raw/master/img/systat_queue.png)

You can see that we've got some dropped packets and dropped bytes. In that case is important to take care of the number of flows. Using pfctl and some korn shell foo we can know how many flows are used:

```bash
root@arnuwanda:/etc# pfctl -ss | wc -l 
    3147
root@arnuwanda:/etc# 
```

Remember that we're speaking about packet scheduler for the WISP appliance that is running on our infrastructure. Next that we've regulated the download from the clients, we've got to do the same for the upload that is a little bit heavier but nothing special at all.

First we define a general queue above egress interface, next a `internet` one will use HFSC and two leafs one with all the traffic, the `default` one, and the other only with the traffic that was tagged by pf as upload from clients:

```bash
queue eque on vio0 bandwidth 800M
queue internet parent eque bandwidth 240M min 240M max 240M 
queue users parent internet bandwidth 55M max 60M flows 6144 qlimit 1024
queue sbok parent internet bandwidth 150M default
```

![](https://github.com/redeltaglio/OpenBSD/raw/master/img/systat_afteregress.png)

As you can see queues are nested below the one called `eque`.

Results are astonishing:

![](https://github.com/redeltaglio/OpenBSD/raw/master/img/bufferbloat_afterqueueing.png)

But there is a problem. Packet that are classified as `default` are scheduled two times. In the `default` queue we've got  `esp` traffic and inside the gre tunnel we schedule another time. How can we dial with that problem? Answer is one, and it is called [rdomain(4)](https://man.openbsd.org/rdomain.4), as we've discussed above. We use the virtual ethernet interface [pair(4)](https://man.openbsd.org/pair.4) to schedule upload from clients:

```bash
root@shiva:/etc# cat hostname.gre1                                                                                                                                                                                                              
description "spr.telecomlobby.com"
rdomain 1
tunneldomain 0
mtu 1392
!ifconfig gre1 inet 10.10.10.234 10.10.10.233 netmask 0xfffffffc
tunnel 139.180.206.19 2.139.174.201
up
root@shiva:/etc# cat hostname.lo1                                                                                                                                                                                                                                                        
rdomain 1
inet 127.0.0.1 0xff000000
inet6 ::1
up
!route -T 1 add 224/4 127.0.0.1
!route -T 1 add 127/8 127.0.0.1
!route -T 1 add ::/96 ::1
!route -T 1 add ::ffff:0.0.0.0/96 ::1
root@shiva:/etc# 

root@shiva:/etc# cat hostname.pair1
description "gw-pair-1"
rdomain 1
inet 10.200.21.2/30
patch pair0
!/sbin/route -T 1 -qn add default 10.200.21.1

root@shiva:/etc# cat hostname.pair0 
description "gw-pair-0"
rdomain 0
inet 10.200.21.1/30
!/sbin/route -n add 10.0.0.0/8 10.200.21.2
!/sbin/route -n add 172.16.0.0/12 10.200.21.2
!/sbin/route -n add 192.168.0.0/16 10.200.21.2

root@shiva:/etc# cat pf.conf.macro.queue.out | grep pair                                                                                                                                                                                                                           
queue outq on pair1 bandwidth 55M max 60M flows 6144 qlimit 6144 default
root@shiva:/etc# 

```

Result seems to be insane but is fantastic:

```bash
root@shiva:/etc# pfctl -sq -v                                                                                                                                                                                                                                                            
queue outq on gre1 flows 6144 bandwidth 55M, max 60M default qlimit 6144
  [ pkts:      79478  bytes:   46732707  dropped pkts:      0 bytes:      0 ]
  [ qlength:   0/6144 ]
queue outq on gre10 flows 6144 bandwidth 55M, max 60M default qlimit 6144
  [ pkts:        350  bytes:      28000  dropped pkts:      0 bytes:      0 ]
  [ qlength:   0/6144 ]
queue outq on gre11 flows 6144 bandwidth 55M, max 60M default qlimit 6144
  [ pkts:        350  bytes:      28000  dropped pkts:      0 bytes:      0 ]
  [ qlength:   0/6144 ]
queue outq on gre12 flows 6144 bandwidth 55M, max 60M default qlimit 6144
  [ pkts:       1040  bytes:     335520  dropped pkts:      0 bytes:      0 ]
  [ qlength:   0/6144 ]
queue outq on gre13 flows 6144 bandwidth 55M, max 60M default qlimit 6144
  [ pkts:        350  bytes:      28000  dropped pkts:      0 bytes:      0 ]
  [ qlength:   0/6144 ]
queue outq on gre15 flows 6144 bandwidth 55M, max 60M default qlimit 6144
  [ pkts:       1357  bytes:     424296  dropped pkts:      0 bytes:      0 ]
  [ qlength:   0/6144 ]
queue outq on gre2 flows 6144 bandwidth 55M, max 60M default qlimit 6144
  [ pkts:       4613  bytes:     599968  dropped pkts:      0 bytes:      0 ]
  [ qlength:   0/6144 ]
queue outq on gre3 flows 6144 bandwidth 55M, max 60M default qlimit 6144
  [ pkts:       1442  bytes:     428528  dropped pkts:      0 bytes:      0 ]
  [ qlength:   0/6144 ]
queue outq on gre4 flows 6144 bandwidth 55M, max 60M default qlimit 6144
  [ pkts:       3725  bytes:     585340  dropped pkts:      0 bytes:      0 ]
  [ qlength:   0/6144 ]
queue outq on gre6 flows 6144 bandwidth 55M, max 60M default qlimit 6144
  [ pkts:       3851  bytes:     551916  dropped pkts:      0 bytes:      0 ]
  [ qlength:   0/6144 ]
queue outq on gre9 flows 6144 bandwidth 55M, max 60M default qlimit 6144
  [ pkts:       3888  bytes:     587640  dropped pkts:      0 bytes:      0 ]
  [ qlength:   0/6144 ]
queue outq on pair1 flows 6144 bandwidth 55M, max 60M default qlimit 6144
  [ pkts:      67327  bytes:    9658322  dropped pkts:      0 bytes:      0 ]
  [ qlength:   0/6144 ]
root@shiva:/etc# 

```

The same politics we use in EdgeOS and Mikrotik:

```bash
root@indra# show traffic-control   
 advanced-queue {
     filters {
         match 10 {
             attach-to 1
             ip {
                 destination {
                     address 172.16.23.0/24
                 }
             }
             target 10
         }
         match 11 {
             attach-to 2
             mark 111
             target 11
         }
     }
     leaf {
         queue 10 {
             bandwidth 180mbit
             burst {
                 burst-rate 200mbit
                 burst-size 600mb
             }
             parent 1
             queue-type INDRA_CODEL
         }
         queue 11 {
             bandwidth 80mbit
             burst {
                 burst-rate 100mbit
                 burst-size 300mb
             }
             parent 2
             queue-type INDRA_CODEL
         }
     }
     queue-type {
         fq-codel INDRA_CODEL {
             flows 6144
             limit 1024
         }
     }
     root {
         queue 1 {
             attach-to eth3.111
             bandwidth 200mbit
             description "WISP download"
         }
         queue 2 {
             attach-to pppoe0
             bandwidth 300mbit
         }
     }
 }
[edit]
root@indra# 
```

```bash
/ip firewall mangle
add action=mark-packet chain=postrouting dst-address=10.1.10.0/24 new-packet-mark=down out-interface=ether1 \
    passthrough=no
add action=mark-packet chain=postrouting new-packet-mark=up out-interface=lte1 passthrough=no src-address=10.1.10.0/24
/queue type
add kind=fq-codel name=FQCODEL
/queue tree
add limit-at=40M max-limit=50M name=GLOBAL parent=global queue=default
add limit-at=20M max-limit=22M name=DOWN packet-mark=down parent=GLOBAL queue=FQCODEL
add limit-at=20M max-limit=22M name=UP packet-mark=up parent=GLOBAL queue=FQCODEL
```

#### Deep packet inspection packet DSCP classification in GRE transit.

![](https://github.com/redeltaglio/OpenBSD/raw/master/img/tos_dscp.png)

![](https://github.com/redeltaglio/OpenBSD/raw/master/img/tos_dscp_2.png)

## Building a testing environment

When complexity go straight forward, system administrators have got to test configurations in a testing environment to not cause disasters in the production camp.

Considering a Linux based workstation our base doing it in a correct way isn't so complex:

- Installing and configuring [GNS3 framework](https://en.wikipedia.org/wiki/Graphical_Network_Simulator-3) (*it's used also at NASA!*) , very handy speaking about networking emulation. 
- Preparing templates for all kind of machine we want to emulate, like OpenBSD, NetBSD and Mikrotik for example.
- Design and start a project for every kind of testing lab web want to archive.

This kind of working lab is absolutely a most because of [packet and traffic flow](https://en.wikipedia.org/wiki/Traffic_flow_(computer_networking)) debugging. Those systems follow the [monolitich kernel](https://en.wikipedia.org/wiki/Monolithic_kernel) philosophy. 

#### Graphical network simulator 3

Some basic points, this framework use as as testing bed the well known daemons and protocols [QEMU](https://en.wikipedia.org/wiki/QEMU), [libvirt](https://en.wikipedia.org/wiki/Libvirt), [dnsmasq](https://en.wikipedia.org/wiki/Dnsmasq), [SPICE](https://en.wikipedia.org/wiki/Simple_Protocol_for_Independent_Computing_Environments) and [VNC](https://en.wikipedia.org/wiki/Virtual_Network_Computing) into others. All is organized used the [YAML](https://en.wikipedia.org/wiki/YAML) programming language.

To [install GNS3](https://docs.gns3.com/docs/getting-started/installation/linux/) under Ubuntu we've got to add a special [ppa](https://itsfoss.com/ppa-guide/) that we could find in the project home page.

I've recollected the options that I use in the configuration of the virtual environment, then I will discuss with you, reader, the most important ones:

- [GNS3 OpenBSD OpenOSPFD](https://photos.app.goo.gl/u5yeCtcYSxE6Yn6Q9)

![vinagre](https://raw.githubusercontent.com/redeltaglio/GNS3-OpenBSD-OpenOSPFD/main/images/gns3_options/5-imp.jpg)

We prefer  [vinagre](https://en.wikipedia.org/wiki/Vinagre) as the GUI of the VNC protocol because of a bug present only using OpenBSD virtualized systems, keyboard simply doesn't work using others graphical clients.

![](https://github.com/redeltaglio/GNS3-OpenBSD-OpenOSPFD/raw/main/images/gns3_options/13-imp.jpg)

Important to underline the virtual interface used by the GNS3 system to masquerade the connections of the virtual systems to the WAN interface of our workstation is the one created by default with the libvirt installation. With that interface some iptables commands are added to our workstation, here you can review all of them:

```shell
root@trimurti:/home/riccardo/Work/telecom.lobby/GNS3-OpenBSD-OpenOSPFD# ip link | grep virbr0
4: virbr0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP mode DEFAULT group default qlen 1000
7: gns3tap0-0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel master virbr0 state UNKNOWN mode DEFAULT group default qlen 1000
root@trimurti:/home/riccardo/Work/telecom.lobby/GNS3-OpenBSD-OpenOSPFD# ip addr | grep virbr0
4: virbr0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default qlen 1000
    inet 192.168.122.1/24 brd 192.168.122.255 scope global virbr0
root@trimurti:/home/riccardo/Work/telecom.lobby/GNS3-OpenBSD-OpenOSPFD# iptables -t nat  -n -v -L
Chain PREROUTING (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination         

Chain INPUT (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination         

Chain OUTPUT (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination         

Chain POSTROUTING (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination         
 6544 1322K LIBVIRT_PRT  all  --  *      *       0.0.0.0/0            0.0.0.0/0           

Chain LIBVIRT_PRT (1 references)
 pkts bytes target     prot opt in     out     source               destination         
   27  2636 RETURN     all  --  *      *       192.168.122.0/24     224.0.0.0/24        
    0     0 RETURN     all  --  *      *       192.168.122.0/24     255.255.255.255     
    0     0 MASQUERADE  tcp  --  *      *       192.168.122.0/24    !192.168.122.0/24     masq ports: 1024-65535
   72 14790 MASQUERADE  udp  --  *      *       192.168.122.0/24    !192.168.122.0/24     masq ports: 1024-65535
    0     0 MASQUERADE  all  --  *      *       192.168.122.0/24    !192.168.122.0/24    
root@trimurti:/home/riccardo/Work/telecom.lobby/GNS3-OpenBSD-OpenOSPFD# iptables -t nat -S
-P PREROUTING ACCEPT
-P INPUT ACCEPT
-P OUTPUT ACCEPT
-P POSTROUTING ACCEPT
-N LIBVIRT_PRT
-A POSTROUTING -j LIBVIRT_PRT
-A LIBVIRT_PRT -s 192.168.122.0/24 -d 224.0.0.0/24 -j RETURN
-A LIBVIRT_PRT -s 192.168.122.0/24 -d 255.255.255.255/32 -j RETURN
-A LIBVIRT_PRT -s 192.168.122.0/24 ! -d 192.168.122.0/24 -p tcp -j MASQUERADE --to-ports 1024-65535
-A LIBVIRT_PRT -s 192.168.122.0/24 ! -d 192.168.122.0/24 -p udp -j MASQUERADE --to-ports 1024-65535
-A LIBVIRT_PRT -s 192.168.122.0/24 ! -d 192.168.122.0/24 -j MASQUERADE
root@trimurti:/home/riccardo/Work/telecom.lobby/GNS3-OpenBSD-OpenOSPFD# 
root@trimurti:/media/taglio/efb0978c-a864-428a-9264-5dbbcaa81fe8/GNS3/projects/VRF# cat /var/lib/libvirt/dnsmasq/default.conf | grep -v \#
strict-order
user=libvirt-dnsmasq
pid-file=/run/libvirt/network/default.pid
except-interface=lo
bind-dynamic
interface=virbr0
dhcp-range=192.168.122.2,192.168.122.254,255.255.255.0
dhcp-no-override
dhcp-authoritative
dhcp-lease-max=253
dhcp-hostsfile=/var/lib/libvirt/dnsmasq/default.hostsfile
addn-hosts=/var/lib/libvirt/dnsmasq/default.addnhosts
root@trimurti:/media/taglio/efb0978c-a864-428a-9264-5dbbcaa81fe8/GNS3/projects/VRF# ps axu | grep dnsmasq | grep -v grep
libvirt+    1693  0.0  0.0  10144  2492 ?        S    09:00   0:00 /usr/sbin/dnsmasq --conf-file=/var/lib/libvirt/dnsmasq/default.conf --leasefile-ro --dhcp-script=/usr/lib/libvirt/libvirt_leaseshelper
root        1695  0.0  0.0  10040   384 ?        S    09:00   0:00 /usr/sbin/dnsmasq --conf-file=/var/lib/libvirt/dnsmasq/default.conf --leasefile-ro --dhcp-script=/usr/lib/libvirt/libvirt_leaseshelper
root@trimurti:/media/taglio/efb0978c-a864-428a-9264-5dbbcaa81fe8/GNS3/projects/VRF# 
```

#### Virtual machines custom templates.

First of all we shall got templates for new projects and machine instances. Is interesting that the system administrator could connect to them without using resource killers like GUI programs, but do it in [suckless](https://suckless.org/) way something very difficult to understand today look at your Chrome resource eater for example.

![](https://github.com/redeltaglio/altBSD_network/raw/master/img/mikrotik_rawimages.png)

Mikrotik got screen output prepared by default also to the serial device.  Download the correct disk image into the GNS3 root folder, sub directories `images/QEMU/`. You can find it looking for CHR raw disc images. Next configure the template in the framework under the section `Edit/Preferences/QEMU/Qemu Vms`, the only options to argue are:

- RAM size: 128M
- HDA primary master disk image: full path of the downloaded raw image.
- Disk interface: [virtio](https://wiki.libvirt.org/page/Virtio).
- Network adapters: 6.

OpenBSD is a little bit tricky and we shall follow a work flow harder. This because we want to install template for others instances using serial console. Why? Because we like old style, we like suck less, we're geek, we simply want to do it in that way because we're born in 1.981 and we don't like to lame.

We will use an OpenBSD based workstation to edit the release installation CD, that because my fault in understanding options of [genisoimage(1)](https://linux.die.net/man/1/genisoimage). To rebuild the [bootable](https://en.wikipedia.org/wiki/Booting) [ISO9660](https://en.wikipedia.org/wiki/ISO_9660) [image](https://en.wikipedia.org/wiki/Optical_disc_image) with the correct [boot.conf(5)](http://man.openbsd.org/OpenBSD-5.1/man5/amd64/boot.conf.5) follow these instructions:

```bash
taglio@shiva:/home/taglio$ mkdir -p Iso/{mnt,cd-dir} 
taglio@shiva:/home/taglio$ ARCH=$(uname -m) ; RELENG=$(uname -r)
taglio@shiva:/home/taglio$ ftp -o Iso/install$(echo $RELENG | sed "s|\.||g").iso https://cdn.openbsd.org/pub/OpenBSD/${RELENG}/${ARCH}/install$(echo $RELENG | sed "s|\.||g").iso
Trying 151.101.130.217...
Requesting https://cdn.openbsd.org/pub/OpenBSD/7.1/amd64/install71.iso
100% |********************************************************************************************************************************************************|   561 MB    00:21    
588500992 bytes received in 21.72 seconds (25.83 MB/s)
taglio@shiva:/home/taglio$ cat << EOF > Iso/build_serial.sh
#!/bin/ksh

OSREV=$(uname -r)
MACHINE=$(uname -m)
CDROM="iso_serial.iso"

doas vnconfig vnd0 ${1}
doas mount -t cd9660 /dev/vnd0c mnt/
doas cp -Rp  mnt/* cd-dir/ 
doas chown -R $(whoami):$(whoami) cd-dir/
find cd-dir/ -name "TRANS*" -type f -delete
find cd-dir/ -name "boot.catalog" -type f -delete
echo "stty com0 115200" > cd-dir/etc/boot.conf
echo "set tty com0" >> cd-dir/etc/boot.conf
echo "set image /${OSREV}/${MACHINE}/bsd.rd" >> cd-dir/etc/boot.conf
mkhybrid -vv -a -R -T -L -l -d -D -N -o ${CDROM} -A "OpenBSD ${OSREV} ${MACHINE} bootonly CD" -P "Copyright (c) `date +%Y` Theo de Raadt, The OpenBSD project" -p "Theo de Raadt <deraadt@openbsd.org>" -V "serial console boot-only CD" -b ${OSREV}/${MACHINE}/cdbr -c ${OSREV}/${MACHINE}/boot.catalog cd-dir
rm -rf cd-dir/*
doas umount mnt/
doas vnconfig -u vnd0
EOF
taglio@shiva:/home/taglio$ chmod +x Iso/build_serial.sh                                                                                       
taglio@shiva:/home/taglio$ cd Iso ; ksh build_serial.sh
doas (taglio@shiva.telecom.lobby) password:
mkhybrid 1.12b5.1                                                                                                                                          
Scanning cd-dir/7.1
Scanning cd-dir/7.1/amd64
Scanning cd-dir/etc

Size of boot image is 4 sectors -> No-emulation CD boot sector
Total translation table size: 920
Total rockridge attributes bytes: 2495
Total directory bytes: 8192
Path table size(bytes): 48
287354 extents written (561 Mb)
taglio@shiva:/home/taglio/Iso$ ls -al iso_serial.iso                                                               
-rw-r--r--  1 taglio  taglio  588500992 Aug 21 23:09 iso_serial.iso
taglio@shiva:/home/taglio/Iso$ 
```

Take in count that the use of [mkhybrid(8)](https://man.openbsd.org/mkhybrid.8) was read from the OpenBSD CVS repository mirrored into [github](https://raw.githubusercontent.com/openbsd/src/master/distrib/amd64/ramdisk_cd/Makefile) as it was committed by a developer into `src/distrib/amd64/iso/Makefile`. Transfer `iso_serial.iso` to the GNS3 folder that we call `Optics`. 

Create a [qcow2](https://en.wikipedia.org/wiki/Qcow) image into the `Images/QEMU/` sub directory of 1 gigabyte:

```bash
┌─[● trimurti]─[taglio]─[~/Virtual/GNS3/projects/VRF]─[16:53]: $
└─╼ >> qemu-img create OpenBSD$(echo $RELENG | sed "s|\.||g").qcow2 1G
Formatting 'OpenBSD71.qcow2', fmt=raw size=1073741824
┌─[● trimurti]─[taglio]─[~/Virtual/GNS3/projects/VRF]─[16:53]: $
└─╼ >> 
```

Configure the template exactly as the Mikrotik one but:

- RAM: 256MB.
- Boot priority: CD/DVD ROM.
- HDA primary master disk image: full path of the created raw image.
-  CD/DVD ROM: full path of the created optical image.

Create a new project with what so ever name and find it under the emulator root path with it YAML configuration file:

```bash
┌─[● trimurti]─[taglio]─[~/Virtual/GNS3/projects/test]─[17:29]: $
└─╼ >> cat test.gns3 
{
    "auto_close": true,
    "auto_open": false,
    "auto_start": false,
    "drawing_grid_size": 25,
    "grid_size": 75,
    "name": "test",
    "project_id": "6dcaf183-b824-4fb4-b101-f05dc3c4cf45",
    "revision": 9,
    "scene_height": 1000,
    "scene_width": 2000,
    "show_grid": false,
    "show_interface_labels": false,
    "show_layers": false,
    "snap_to_grid": false,
    "supplier": null,
    "topology": {
        "computes": [],
        "drawings": [],
        "links": [],
        "nodes": []
    },
    "type": "topology",
    "variables": null,
    "version": "2.2.33.1",
    "zoom": 100
}┌─[● trimurti]─[taglio]─[~/Virtual/GNS3/projects/test]─[17:29]: $
└─╼ >> 
```

Then drag the icon of the OpenBSD template into the work space and run it and immediately stop it, under the same path you will find more directories:

```bash
└─╼ >> find project-files/
project-files/
project-files/qemu
project-files/qemu/dbf91f2d-2382-4321-a8e0-5f432e150b66
project-files/qemu/dbf91f2d-2382-4321-a8e0-5f432e150b66/ubridge.log
project-files/qemu/dbf91f2d-2382-4321-a8e0-5f432e150b66/qemu-img.log
project-files/qemu/dbf91f2d-2382-4321-a8e0-5f432e150b66/qemu.log
project-files/qemu/dbf91f2d-2382-4321-a8e0-5f432e150b66/hda_disk.qcow2
┌─[● trimurti]─[taglio]─[~/Virtual/GNS3/projects/test]─[19:01]: $
└─╼ >> ls -al hda_disk.qcow2 ; qemu-img info hda_disk.qcow2 
-rw-r--r-- 1 taglio taglio 196624 ago 21 19:01 hda_disk.qcow2
image: hda_disk.qcow2
file format: qcow2
virtual size: 1 GiB (1073741824 bytes)
disk size: 196 KiB
cluster_size: 65536
backing file: /home/taglio/GNS3/images/QEMU/OpenBSD71.qcow2
backing file format: raw
Format specific information:
    compat: 1.1
    compression type: zlib
    lazy refcounts: false
    refcount bits: 16
    corrupt: false
    extended l2: false
```

Notice another qcow2 disc image that is [backing](https://blog.programster.org/qemu-img-cheatsheet) the template one and the [uuid](https://en.wikipedia.org/wiki/Universally_unique_identifier) of the virtual machine instance.  

Next we find also the exact command string that use GNS3 to start QEMU doing a `cat qemu.log`: 

```bash
Start QEMU with /usr/bin/qemu-system-x86_64 -name OpenBSD7.1-1 -m 256M -smp cpus=1,sockets=1 -enable-kvm -machine smm=off -boot order=d -bios /home/taglio/GNS3/images/QEMU/BIOS/bios.bin -cdrom /home/taglio/GNS3/images/Optics/iso_serial.iso -drive file=/home/taglio/Virtual/GNS3/projects/test/project-files/qemu/dbf91f2d-2382-4321-a8e0-5f432e150b66/hda_disk.qcow2,if=ide,index=0,media=disk,id=drive0 -uuid dbf91f2d-2382-4321-a8e0-5f432e150b66 -serial telnet:127.0.0.1:5001,server,nowait -monitor tcp:127.0.0.1:44497,server,nowait -net none -device e1000,mac=0c:f9:1f:2d:00:00,netdev=gns3-0 -netdev socket,id=gns3-0,udp=127.0.0.1:10001,localaddr=127.0.0.1:10000 -device e1000,mac=0c:f9:1f:2d:00:01,netdev=gns3-1 -netdev socket,id=gns3-1,udp=127.0.0.1:10003,localaddr=127.0.0.1:10002 -device e1000,mac=0c:f9:1f:2d:00:02,netdev=gns3-2 -netdev socket,id=gns3-2,udp=127.0.0.1:10005,localaddr=127.0.0.1:10004 -device e1000,mac=0c:f9:1f:2d:00:03,netdev=gns3-3 -netdev socket,id=gns3-3,udp=127.0.0.1:10007,localaddr=127.0.0.1:10006 -device e1000,mac=0c:f9:1f:2d:00:04,netdev=gns3-4 -netdev socket,id=gns3-4,udp=127.0.0.1:10009,localaddr=127.0.0.1:10008 -device e1000,mac=0c:f9:1f:2d:00:05,netdev=gns3-5 -netdev socket,id=gns3-5,udp=127.0.0.1:10011,localaddr=127.0.0.1:10010 -display none
```

Notice that the emulator allocate some ports for serial ports emulation with the option `-serial telnet:127.0.0.1:5001`, that will be of interest if we want to start a [tmux(1)](https://linux.die.net/man/1/tmux) terminal multiplexer with all the machines under control. But it's interesting also to film a nice [asciinema](https://asciinema.org/) video:

[![asciicast](https://asciinema.org/a/V9jUR4JmmpfERq0L6QUqjDYOJ.svg)](https://asciinema.org/a/V9jUR4JmmpfERq0L6QUqjDYOJ)

Next we can add into the graphic workspace a cloud and a link connection between it and the new OpenBSD router meaning the creation of a [TAP](https://en.wikipedia.org/wiki/TUN/TAP) device connecting the virtual machine to the `virbr0` bridge and let network traffic to be masquerade and get access to the Internet.

![](https://github.com/redeltaglio/altBSD_network/raw/master/img/gns3_tap_openbsd.png)

```bash
RT-VIRT-01# dhclient em0                                                       
em0: no lease....got lease
em0: 192.168.122.26 lease accepted from 192.168.122.1 (52:54:00:12:6a:6d)
RT-VIRT-01# 
```

Next we can surf, simply launch `syspatch` as usual and then [halt(8)](https://man.openbsd.org/OpenBSD-7.1/halt.8) the machine and stop the instance from the GUI program. Now we could apply differences between template raw disc and the already installed one with `qemu-img commit hda_disk.qcow2 ` from the uuid subdirectory; but we prefer to add another template copying the instance raw disc to the root path of the program because we will be able to use a system that boot from optic ramdisc support and the other from the raw disc already installed.

```bash
┌─[● trimurti]─[taglio]─[/media/taglio/efb0978c-a864-428a-9264-5dbbcaa81fe8/GNS3/projects/test/project-files/qemu/97794d6d-f155-49a0-a747-585ead84c4db]─[21:53]: $
└─╼ >> GNS3_ROOT="/home/taglio/Virtual/GNS3"
┌─[● trimurti]─[taglio]─[/media/taglio/efb0978c-a864-428a-9264-5dbbcaa81fe8/GNS3/projects/test/project-files/qemu/97794d6d-f155-49a0-a747-585ead84c4db]─[21:54]: $
└─╼ >> cp hda_disk.qcow2 "${GNS3_ROOT}/images/QEMU/
```

Next we've got to detach from backing:

```bash
┌─[● trimurti]─[taglio]─[~/Virtual/GNS3/images/QEMU]─[07:26]: $
└─╼ >> qemu-img info hda_disk.qcow2
image: hda_disk.qcow2
file format: qcow2
virtual size: 1 GiB (1073741824 bytes)
disk size: 979 MiB
cluster_size: 65536
backing file: /home/taglio/GNS3/images/QEMU/OpenBSD71.qcow2
backing file format: raw
Format specific information:
    compat: 1.1
    compression type: zlib
    lazy refcounts: false
    refcount bits: 16
    corrupt: false
    extended l2: false
┌─[● trimurti]─[taglio]─[~/Virtual/GNS3/images/QEMU]─[07:27]: $ qemu-img rebase -F qcow2 -f qcow2 -b "" hda_disk.qcow2
┌─[● trimurti]─[taglio]─[~/Virtual/GNS3/images/QEMU]─[07:29]: $
└─╼ >> qemu-img info hda_disk.qcow2
image: hda_disk.qcow2
file format: qcow2
virtual size: 1 GiB (1073741824 bytes)
disk size: 979 MiB
cluster_size: 65536
Format specific information:
    compat: 1.1
    compression type: zlib
    lazy refcounts: false
    refcount bits: 16
    corrupt: false
    extended l2: false
┌─[● trimurti]─[taglio]─[~/Virtual/GNS3/images/QEMU]─[07:29]: $
└─╼ >> 
```

After all of that we add another BSD to the template collection, mean while we start to understand a little that system operative: [NetBSD](http://netbsd.org/). First of all we shall boot the install optic support using the serial screen output. In that case the NetBSD guys got a "semi hidden" disc image with the suffix `-com`. But it works only as boot stage cd. So we add to connect to the cloud in the program to get Internet connection. Remember to create the qcow2 raw disc image.

https://cdn.netbsd.org/pub/NetBSD/NetBSD-9.3/amd64/installation/cdrom/boot-com.iso

[![asciicast](https://asciinema.org/a/516323.svg)](https://asciinema.org/a/516323)

After the install create a new fresh install template and copy the qcow2 image.

#### Case of study: interconnection between operators.

![](https://github.com/redeltaglio/altBSD_network/raw/master/img/operators_interconnection.png)

#### Case of study: OSPF deep diving

![](https://github.com/redeltaglio/OpenBSD/raw/master/img/routing_tables_mk.png)

![](https://raw.githubusercontent.com/redeltaglio/OpenBSD/master/img/ospf-timers-guide-table.webp)



#### Qemu world

```bash
#if [ -x /usr/local/bin/qemu-system-x86_64 ]; then
#       export ETHER=vether1
#       export BRIDGE=bridge0
#       echo -n ' qemu'; /usr/local/bin/qemu-system-x86_64 -m 256 -hda /home/taglio/Virtual/bhagavati.img -nographic -serial telnet:127.0.0.1:14000,server=on -net nic,macaddr=52:54:00:31:33:7  -net tap
#fi
```

```bash
root@arnuwanda:/etc# cat hostname.vether1                             
-inet
-inet6
rdomain 1
lladdr random
inet 192.168.31.14/24
root@arnuwanda:/etc# cat hostname.bridge0                                                                                                      
rdomain 1
add vether1
add tap0
root@arnuwanda:/etc# cat hostname.tap0     
rdomain 1
up
root@arnuwanda:/etc# cat dhcpd.conf
subnet 192.168.31.0 netmask 255.255.255.0 {
                  range 192.168.31.10 192.168.31.250;
                  default-lease-time 600;
                  max-lease-time 7200;
                  option subnet-mask 255.255.255.0;
                  option broadcast-address 192.168.31.255;
                  option routers 192.168.31.14;
                  option domain-name-servers 10.200.21.1;
                  option domain-name "telecom.lobby";

                host bhagavati {
                  hardware ethernet 52:54:00:31:33:7;
                  fixed-address 192.168.31.13;
                }
}

```



## 

#### Appendix: Git sucks

Why not "[game of trees](https://gameoftrees.org/)"? Or "[game of thrones](https://en.wikipedia.org/wiki/Game_of_Thrones)"? Or other acronym?

![](https://gameoftrees.org/got.png)
