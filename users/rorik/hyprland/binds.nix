{ config, pkgs, ...}:

{
  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";

    bind = [
      "$mod, Q, killactive"
      "$mod, F, fullscreen, 1"
      "$mod ALT, F, fullscreen"
      "$mod, P, pin"

      "$mod, T, exec, ${pkgs.ghostty}/bin/ghostty"
      # "$mod, B, exec, ${browser}"
      # "$mod ALT, B, exec, ${browser} --incognito"
      # "$mod, G, exec, wl-kbptr"

      "$mod SHIFT, S, togglesplit"
      "$mod SHIFT, F, togglefloating"
      "$mod SHIFT, P, pseudo"

      "$mod, H, movefocus, l"
      "$mod, J, movefocus, d"
      "$mod, K, movefocus, u"
      "$mod, L, movefocus, r"
      "$mod, TAB, cyclenext"
      "$mod SHIFT, H, resizeactive, -50 0"
      "$mod SHIFT, J, resizeactive, 0 50"
      "$mod SHIFT, K, resizeactive, 0 -50"
      "$mod SHIFT, L, resizeactive, 50 0"
      "$mod CTRL SHIFT, H, movewindow, l"
      "$mod CTRL SHIFT, J, movewindow, d"
      "$mod CTRL SHIFT, K, movewindow, u"
      "$mod CTRL SHIFT, L, movewindow, r"

      "$mod CTRL, TAB, workspace, e+1"
      "$mod CTRL SHIFT, TAB, workspace, e-1"
      "$mod, 1, workspace, 1"
      "$mod, 2, workspace, 2"
      "$mod, 3, workspace, 3"
      "$mod, 4, workspace, 4"
      "$mod, 5, workspace, 5"
      "$mod, 6, workspace, 6"
      "$mod, 7, workspace, 7"
      "$mod, 8, workspace, 8"
      "$mod, 9, workspace, 9"
      "$mod, 0, workspace, 10"
      "$mod SHIFT, 1, movetoworkspace, 1"
      "$mod SHIFT, 2, movetoworkspace, 2"
      "$mod SHIFT, 3, movetoworkspace, 3"
      "$mod SHIFT, 4, movetoworkspace, 4"
      "$mod SHIFT, 5, movetoworkspace, 5"
      "$mod SHIFT, 6, movetoworkspace, 6"
      "$mod SHIFT, 7, movetoworkspace, 7"
      "$mod SHIFT, 8, movetoworkspace, 8"
      "$mod SHIFT, 9, movetoworkspace, 9"
      "$mod SHIFT, 0, movetoworkspace, 10"
    ];

    bindm = [
      "$mod, mouse:272, movewindow"
      "$mod, mouse:273, resizewindow"
    ];

    bindel = [
      ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
      ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
      ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ",XF86MonBrightnessUp, exec, ddcutil setvcp 10 + 10"
      ",XF86MonBrightnessDown, exec, ddcutil setvcp 10 - 10"
    ];
  };
}
