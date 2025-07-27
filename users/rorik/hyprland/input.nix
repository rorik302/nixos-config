{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland.settings.input = {
    kb_layout = "us,ru";
    kb_options = "grp:alt_shift_toggle";

    numlock_by_default = true;
  };
}
