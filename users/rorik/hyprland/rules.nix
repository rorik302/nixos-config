{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland.settings = {
    "$pip_size" = "size 30%";
    "$pip_move" = "move 69.9% 69.9%";
    "$seasonvar_title" = "^(Сериал.*смотреть онлайн *!)$";
    "$youtube_title" = "^(.* - Youtube)$";
    "$tape_operator_title" = "^(.*| Tape Operator)$";

    windowrule = [
      "suppressevent maximize, class:.*"
      "nofocus, class:^$, title:^$, xwayland:1, floating:1, fullscreen:0, pinned:0"
    ];

    windowrulev2 = [
      "float, title:^(Картинка в картинке)$ | $seasonvar_title | $youtube_title | $tape_operator_title"
      "$pip_size, title:^(Картинка в картинке)$ | $seasonvar_title | $youtube_title | $tape_operator_title"
      "$pip_move, title:^(Картинка в картинке)$ | $seasonvar_title | $youtube_title | $tape_operator_title"
      "pin, title:^(Картинка в картинке)$ | $seasonvar_title | $youtube_title | $tape_operator_title"
      "noinitialfocus, title:^(Картинка в картинке)$ | $seasonvar_title | $youtube_title | $tape_operator_title"
    ];
  };
}
