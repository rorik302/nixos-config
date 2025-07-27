{ config, pkgs, ... }:

{
  imports = [
    ./animations.nix
    ./binds.nix
    ./cursor.nix
    ./decorations.nix
    ./env.nix
    ./general.nix
    ./input.nix
    ./layouts.nix
    ./misc.nix
    ./monitors.nix
    ./rules.nix
  ];

  wayland.windowManager.hyprland.enable = true;
}
