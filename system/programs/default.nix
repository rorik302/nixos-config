{ config, pkgs, ... }:

{
  imports = [
    ./git.nix
    ./fish.nix
    ./hyprland.nix
  ];
}
