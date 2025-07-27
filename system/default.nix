{ config, lib, pkgs, ... }:

{
  imports = [
    ./audio.nix
    ./console.nix
    ./datetime.nix
    ./fonts.nix
    ./grub.nix
    ./hardware.nix
    ./locale.nix
    ./network.nix
    ./nix.nix
    ./packages.nix
    ./printer.nix
    ./programs
    ./sddm.nix
    ./ssh.nix
    ./users.nix
    ./x11.nix
  ];
}

