{ config, pkgs, ... }:

{
  home = {
    username = "rorik";
    homeDirectory = "/home/rorik";

    stateVersion = "25.05";
  };

  programs.fish = {
    enable = true;
    shellInit = ''
      set -g fish_greeting "" 
    '';
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  programs.yazi = {
    enable = true;
  };

  programs.lazygit = {
    enable = true;
  };
}
