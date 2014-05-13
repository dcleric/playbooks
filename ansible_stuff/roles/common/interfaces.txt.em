auto lo
iface lo inet loopback

auto em1
auto em1.101
iface em1.101 inet manual
	vlan-raw-device em1
auto em1.102
iface em1.102 inet manual
	vlan-raw-device em1
	
auto em2
auto em2.103
iface em2.103 inet manual
	vlan-raw-device em2
auto em2.104
iface em2.104 inet manual
	vlan-raw-device em2
auto em2.105
iface em2.105 inet manual
	vlan-raw-device em2
auto cloudvirbr101
iface cloudvirbr101 inet static
        address 10.80.101.X
        network 10.80.101.0
        netmask 255.255.255.0
        broadcast  10.80.101.255
        gateway  10.80.101.1
        bridge_ports em1.101
        bridge_stp off
        bridge_fd 0
        bridge_maxwait 0
iface cloudvirbr102 inet static
        address 10.80.102.X
        network 10.80.102.0
        netmask 255.255.255.0
        broadcast  10.80.102.255
        bridge_ports em1.102
        bridge_stp off
        bridge_fd 0
        bridge_maxwait 0
iface cloudvirbr103 inet manual
        bridge_ports em2.103
        bridge_stp off
        bridge_fd 0
        bridge_maxwait 0
iface cloudvirbr104 inet manual
        bridge_ports em2.104
        bridge_stp off
        bridge_fd 0
        bridge_maxwait 0
iface cloudvirbr105 inet manual
        bridge_ports em2.105
        bridge_stp off
        bridge_fd 0
        bridge_maxwait 0

source /etc/network/interfaces.d/*.cfg
