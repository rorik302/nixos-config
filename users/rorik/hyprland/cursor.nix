{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland.settings.cursor = {
    hide_on_key_press = true;
  };
}
