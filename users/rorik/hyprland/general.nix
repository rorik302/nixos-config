{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland.settings.general = {
    border_size = 5;
    gaps_in = 3;
    gaps_out = 10;
    layout = "dwindle";

    snap = {
      enabled = true;
    };
  };
}
