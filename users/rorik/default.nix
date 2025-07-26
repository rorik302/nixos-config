{ config, pkgs, ... }:

{
  imports = [
    ./atuin.nix
    ./bat.nix
    ./eza.nix
    ./home.nix
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
