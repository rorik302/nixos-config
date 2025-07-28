{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland.settings.input = {
    kb_layout = "custom_us,custom_ru";
    kb_variant = "";
    kb_options = "grp:alt_shift_toggle";

    numlock_by_default = true;
  };
}
