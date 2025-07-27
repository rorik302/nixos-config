{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland.settings = {
    dwindle = {
      pseudotile = true;
      preserve_split = true;
    };

    master = {
      new_status = "slave";
      new_on_top = true;
    };
  };
}
