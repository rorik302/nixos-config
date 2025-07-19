{ lib, config, pkgs, ... }:

let
  username = "rorik";
in
{
  imports = [
  ];

  home = {
    username = username;
    homeDirectory = lib.mkForce "/home/${ username }";
    stateVersion = "25.05"; # Не изменять!!!

    packages = [];

    file = {};

    sessionVariables = {
      EDITOR = "nvim";
    };
  };

  programs.home-manager.enable = true;
}
