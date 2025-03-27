.PHONY: default prepare install
.SILENT: default prepare install

default:
	echo "Select one of the following options:"
	echo "- make prepare"
	echo "- make install"

prepare:
	curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install

install:
	rm -rf /etc/nix-darwin
	ln -s $(shell pwd) /etc/nix-darwin
	nix run nix-darwin/master#darwin-rebuild -- switch --flake .
