Assignment F.1 - Home Pentesting Lab
💡It is extremely helpful to have the means to investigate malware, vulnerabilities and practice your penetration testing in a controlled lab environment. In this assignment you will be shown a means in which to construct such a lab using VMWare Workstation on either a dedicated system or one used for your daily work.
This activity is divided into 4 milestones and is designed to be completed over a course of 2-3 weeks. It's important you don't wait until the last minute to tackle this assignment.
AssumptionsYou have a personal laptop or PC that is capable of running VMWare Workstation or FusionThis system has 16GiB or RAM or better and at least 100 GiB of spare space. External fast media can also work.ORYou have fast reliable removable storage and you are prepared to hang out in a CYBER lab to create your externally stored lab. You will need to pay particular attention to Virtual Machine versioning and networking so that you can move between workstations. You will need to be super careful about properly handling your external media.
Milestone 1 - VMWare and KaliInstructionsWatch the following [video](https://drive.google.com/file/d/1OjnmpTTeEeCHAjvELruoR68uvcT3xntW/view?usp=sharing)ISOs pull down the following ISO's or prebaked VMs to your host or fast external media.centos vulnerable[ iso](https://vault.centos.org/6.5/isos/x86_64/CentOS-6.5-x86_64-bin-DVD1.iso)xubuntu[ ](https://mirror.us.leaseweb.net/ubuntu-cdimage/xubuntu/releases/21.04/release/xubuntu-21.04-desktop-amd64.iso)https://xubuntu.org/kali linux[ iso](https://cdimage.kali.org/kali-2022.3/kali-linux-2022.3-installer-amd64.iso) or[ vm](https://kali.download/virtual-images/kali-2021.3/kali-linux-2021.3-vmware-amd64.7z) (feel free to upgrade)vyos[ iso](https://www.vyos.org/get/nightly-builds/) or[ vm](https://drive.google.com/file/d/15IoPxzjaW6Fmn7Bp8QqKN32arprq5jrX/view?usp=sharing) If you want to know how to build prepare your own ova, see [this](https://blog.vyos.io/where-is-my-ova-dude)The ova uses the vyos/Ch@mpl@1n!22 username/password combination.KaliCreate a Kali VM called kali-base. Get Kali installed using NAT Networking.Make a Linked Clone of kali-base called kali-lab
Deliverable 1. Provide a screenshot of your kali-lab vm pinging google.com similar to the one below![img](https://lh6.googleusercontent.com/vZYvsW46YXFhk1I1C5fzfnsJaOTpCq7lwTzjodK-ZeVTTUAavXg2TiHNzvRpM2sLIr9GMKJgFD3RC2SWkKSRTR9zhUeabQtN1sXiJFv-DlQqyZAEF0eSowOnYmY7me21dYwe_44gYIYL78H02V0UCKeAcOZOLX8gk8vS03HBPgavxlVi5_gmzBqz)
Milestone 2 - vyosInstructionsWatch the following [video](https://drive.google.com/file/d/17vf7-zZ5eFmNrXr-cSf42nUHJEL8SU0T/view?usp=sharing)
Create a Base Image for vyos called vyos-baseMake sure to clear hw-id's as instructed in the videoCreate a "Base" snapshotCreate a Linked Clone called vyos-labChange eth1 to be VMNET 5
Here are the vyos configuration commands from the video. Don't forget the configure, commit and save commands.
configureset interfaces ethernet eth0 address '192.168.229.10/24'
set interfaces ethernet eth0 description 'Nat on VMware Host'
set interfaces ethernet eth1 address '10.0.5.2/24'
set interfaces ethernet eth1 description 'VMNET5-RANGE'
set protocols static route 0.0.0.0/0 next-hop 192.168.229.2
set service ssh listen-address '192.168.229.10'
set system name-server '192.168.229.2'
set service ssh listen-address 192.168.229.10commitsave

💡VYOS's nightly images are sometimes a moving target, with new features being introduced and old syntax being deprecated. If you run into an issue with the latest and greatest iso image, let your instructor know.
Deliverable 2. Provide a screenshot similar to the one below that displays your interfaces as well as a successful ping against google.com
![img](https://lh5.googleusercontent.com/D6rwFeYGKtkPY9KFdP0jEp1fnFIKZeZgLjo9PBD3d-_Yz7oIsGUjwZgrhPWGbEwoZyYcPNeqhrZHBJ0XU9MwqRP3HFZ6b0GBfHBhqfMkAFpPU9P7Kl85CIbHdBvLGkE55DdyvXbhr1o3mdvlf09U-ivqlk9k0CddRN5F-tSpgiMbThCG8MSxaU8Z)
Milestone 3 - the centos targetInstructionsWatch the following [video](https://drive.google.com/file/d/1W5a8WndPtERSGYBppRZJ0odVZIHrBDiy/view?usp=sharing)
Create a Base Image for vyos called centos-baseClear out UUIDs an MAC addresses from configurations as shownInstall vmware tools on centos-baseCreate a linked clone called cupcakeConfigure ssh on vyos-labConfigure DHCP on vyos-labReboot cupcake and demonstrate that it is pingable by IP from vyos-labDHCP Configuration Commands from the Video
💡Note, depending on the vyos release you are using, the command syntax may differ. Use the tab character to see the valid commands such as: set service dhcp-server <TAB><TAB>
configure set service dhcp-server global-parameters 'local-address 10.0.5.2;'
set service dhcp-server shared-network-name DHCPPOOL authoritative
set service dhcp-server shared-network-name DHCPPOOL subnet 10.0.5.0/24 default-router '10.0.5.2'
set service dhcp-server shared-network-name DHCPPOOL subnet 10.0.5.0/24 domain-name 'range.local'
set service dhcp-server shared-network-name DHCPPOOL subnet 10.0.5.0/24 lease '86400'
set service dhcp-server shared-network-name DHCPPOOL subnet 10.0.5.0/24 range POOL1 start '10.0.5.50'
set service dhcp-server shared-network-name DHCPPOOL subnet 10.0.5.0/24 range POOL1 stop '10.0.5.100'
commit
save
Note, a DNS server is not required in the DHCP settings. We actually do not want our range to resolve external hostnames. The following shows a completed dhcp-server on vyos.![img](https://lh3.googleusercontent.com/TcTNGEpdD81FpvCkkIDMKtEXuZ7sPs_-WhvOOekMDpeJT-qWbpkkH1juZNaGES2KSVjo044Fl2IVvA7Bk-eR3KEu520g380AoUe0vYmo8TZ-2QUWr0juaR0QsTsbwBf1rf27HJsbeun7SFTaeD-LXbppb1mn46G73Ga_C6RFER5uw8xQ28rz_Qvr)Deliverable 3. Provide a screenshot of an ssh session with vyos-lab and subsequent ping to cupcake from vyos-lab. Similar to the one below.
![img](https://lh4.googleusercontent.com/oLMhM8zaBUIBrvC7t-nEWKWYQbg9aCLC0lpSCGVTYgPOu8YaUxLQbN4BNbDe04WHWGNmDSgU5v9APHqO1nLQYWKBLmYOyBWW1RapDLS85l4Hb2e6qCR3PIWvlORx6at0CIL4Y9mBqF0Vno0MveSdaZaKioZUI-CkQQbcFpa0SL6-wtGQ6A6TGSwC)
Milestone 4 - VPN connectivity to the target networkInstructionsWatch the following [video](https://drive.google.com/file/d/1yvMxjf2mgUQ_b7dQB14Bl4lhr2Zb2x-P/view?usp=sharing)Install Wireguard on KaliCreate a keypair on kalisudo apt install wireguard
cd /etc/wireguard
umask 077
wg genkey | tee privatekey | wg pubkey > publickey
Create the default keypair on vyosgenerate wireguard default-keypair
configure
set interfaces wireguard wg0 private-key default
Create a peer for 10.0.99.100 on vyosset interfaces wireguard wg0 address '10.0.99.1/24'
set interfaces wireguard wg0 peer namegoeshere allowed-ips '10.0.99.100/32'
set interfaces wireguard wg0 peer namegoeshere public-key keygoeshere
set interfaces wireguard wg0 port '51820'commitsaveexitexit
show interfaces wireguard wg0 public-key
Deliverable 4. Demonstrate network connectivity from kali to the victim machine using the DHCP provided address on VMNET5. Provide a screenshot similar to the one below.![img](https://lh4.googleusercontent.com/HvUzwFsNMFCUb1oqzgU4uFfiyPxnRZcDXPmRSvSwacv3GvOT7n2SRuWD00EQmQWhCU-i_NyJeR1H-0xyPM_sPa7qoy25eIukR6wse7m65IhmUBmXcGCJfvd5_PajiVGWAuFcWg4Lmaq2CaLKiJlpKY-y6uNEKv3NnmkUnhPipuOVKQ-shNTBTTVm)
Deliverable 5. Comprehensive journaling and chronological reflections on this activity. Provide a video overview of all documentation authored and your reflections on this activity. Submit a link to your panopto or google drive based video (not a link to your wiki).