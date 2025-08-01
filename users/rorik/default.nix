{ config, pkgs, ... }:

{
  imports = [
    ./atuin.nix
    ./bat.nix
    ./eza.nix
    ./ghostty.nix
    ./home.nix
    ./hyprland
    ./hyprpanel.nix
    ./fish.nix
    ./fzf.nix
    ./lazygit.nix
    ./navi.nix
    ./neovim.nix
    ./starship.nix
    ./yazi.nix
    ./zoxide.nix
  ];
}
