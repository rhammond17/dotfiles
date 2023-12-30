#!/bin/bash

install_on_fedora() {
    sudo dnf install -y ansible
}

install_on_ubuntu() {
    sudo apt-get update
    
    # Install and configure tzdata so ansible doesn't prompt for the info
    ln -fs /usr/share/zoneinfo/US/Pacific /etc/localtime
    DEBIAN_FRONTEND=noninteractive apt-get install -y tzdata
    dpkg-reconfigure --frontend noninteractive tzdata

    sudo apt-get install -y ansible
}

install_on_mac() {
    brew install ansible
}

OS="$(uname -s)"
case "${OS}" in
    Linux*)
        if [ -f /etc/fedora-release ]; then
            install_on_fedora
        elif [ -f /etc/lsb-release ]; then
            install_on_ubuntu
        else
            echo "Unsupported Linux distribution"
            exit 1
        fi
        ;;
    Darwin*)
        install_on_mac
        ;;
    *)
        echo "Unsupported operating system: ${OS}"
        exit 1
        ;;
esac


ansible-playbook ~/.bootstrap/setup.yml --ask-become-pass

echo "Ansible installation complete."

