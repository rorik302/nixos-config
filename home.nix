{ config, pkgs, ... }:

{
  imports = [
    ./shell.nix
  ];

  home = {
    username = "rorik";
    homeDirectory = "/home/rorik";

    stateVersion = "25.05";
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  programs.yazi = {
    enable = true;
  };
}
