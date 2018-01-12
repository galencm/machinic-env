
        #!/bin/bash
        usage="
        Usage:
            ./machinic-firewall.sh [interface]

        Example:
            ./machinic-firewall.sh enp0s25

        Notes:
            'ifconfig' lists interfaces
            wireless interfaces prefixed with a 'w'
            wired interfaces with an 'e'

        TODO:
            Drop all incoming rule may need to change
            or be modified for consul gossip and zyre protocols...
        "
        # show usage string if no args
        : ${1?"$usage"}
        interface=$1

        #debian based
        sudo apt-get install firewalld
        #fedora
        sudo dnf install firewalld

        #following commands work for either system:

        #set default zone to 'drop'
        sudo firewall-cmd --permanent --set-default-zone=drop

        #set network interface fro drop zone

        sudo firewall-cmd --permanent --zone=drop --change-interface=$interface

        #add rule

        sudo firewall-cmd --zone=drop  --add-rich-rule='rule family="ipv4" source address="192.168.0.0/24" accept'

        #to remove rule:
        #sudo firewall-cmd --zone=drop  --remove-rich-rule='rule family="ipv4" source address="192.168.0.0/24" accept'
    