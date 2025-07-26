{ config, pkgs, ... }:

{
  programs.atuin = {
    enable = true;
    settings = {
      invert = true;
      style = "full";
    };
  };
}
