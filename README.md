A "simple" virtualization testbed for exploring cloud OSes
------------------------------------------------------------

This is a brain dump of deploying VM clusters of minimalist operating systems
using ``qemu`` (mostly in threes).  This is here for science, and assumes you
do your homework before blindly executing sample scripts.  You'll need to
update Cloud Config files with your own SSH pubkey among other things.  You've
been warned!

1.  Setup 64bit Linux on a system with systemd and some extra memory.  I used
    Arch Linux.
1.  Setup systemd-networkd to plug your physical NIC into your virtual switch
    (bridge), something like:

        $ cat /etc/systemd/network/bridge.netdev
        [NetDev]
        Name=br0
        Kind=bridge

        $ cat /etc/systemd/network/bridge.network
        [Match]
        Name=br0

        [Network]
        DNS=8.8.8.8
        DNS=8.8.4.4
        Address=192.168.1.70/24
        Gateway=192.168.1.1

        $ cat /etc/systemd/network/enp6s0.network
        [Match]
        Name=enp6s0

        [Network]
        Bridge=br0

1.  Install ``qemu`` with KVM hardware support.  The instructions here should
    work on a large variety of operating systems since they do not involve
    thirdparty wrapper scripts or tools to manage the execution of ``qemu``.
1.  Setup your DHCP server on your local network to assign specific IP
    addresses based on your pre-defined VM MAC addresses.

Snappy Ubuntu Core
---------------------

1.  Download/extract ``ubuntu-core-alpha-01.img``.
1.  Run ``snappy.sh``.

I have been unsuccessful in getting Snappy to utilize cloud init data so far,
but it is totally possible since cloud providers support it.

Fedora/CentOS Atomic
--------------------------

1.  Download/extract Fedora/CentOS Atomic images.
1.  Convert the Fedora image to qcow2.
1.  Modify cloud-init data in conf.
1.  Run ``genisos.sh``, ``genimgs.sh``, then ``fedora.sh`` or ``centos.sh``.

Somehow I had Fedora working correctly and then it borked on me.  YMMV

CoreOS
---------

1.  Download/extract CoreOS image(s).
1.  Modify cloud-init data in conf.
1.  Run ``genisos.sh``, ``genimgs.sh``, then ``fedora.sh`` or ``centos.sh``.

NixOS
---------

1.  Download the NixOS iso.
1.  Manually create a new nix1.img file similar to what ``genimgs.sh`` scripts do.
1.  Run ``nixos-bootstrap.sh`` on a system with a display.
1.  Follow the NixOS installation instructions.
1.  Setup openssh and docker in the NixOS configuration.nix file, for example:

        environment.systemPackages = with pkgs; [
          wget vim docker
        ];

        virtualisation.docker.enable = true;
        services.openssh.enable = true;
        services.openssh.permitRootLogin = "yes";
        services.openssh.authorizedKeysFiles = [ "/root/id_rsa.pub" ];

1.  Run ``nixos-rebuild switch``, then reboot and verify functionality.
1.  Shutdown and clone the nix1.img file for additional systems.  Yup, this is
    a hack that is probably not a great idea to use outside of testing.
1.  Run ``nixos.sh`` on a headless server.
