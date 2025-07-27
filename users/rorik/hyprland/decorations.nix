{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland.settings.decoration = {
    rounding = 6;
    rounding_power = 2;
    active_opacity = 1.0;
    inactive_opacity = 1.0;
  };
}
