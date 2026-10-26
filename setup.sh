#!/bin/sh
# Add the OSIRIS APT repository. Usage:  curl -fsSL https://richardblaha.github.io/osiris-deb-repo/setup.sh | sudo sh
set -e
[ "$(id -u)" = 0 ] || { echo "run as root (sudo)" >&2; exit 1; }
command -v curl >/dev/null || { echo "install curl first" >&2; exit 1; }
install -d -m 0755 /usr/share/keyrings /etc/apt/sources.list.d
curl -fsSL https://richardblaha.github.io/osiris-deb-repo/osiris-archive-keyring.gpg -o /usr/share/keyrings/osiris-archive-keyring.gpg
curl -fsSL https://richardblaha.github.io/osiris-deb-repo/osiris.sources -o /etc/apt/sources.list.d/osiris.sources
apt-get update
echo "OSIRIS repo added — now: apt install osiris-desktop-theme"
