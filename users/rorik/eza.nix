{ config, pkgs, ... }:

{
  programs.eza = {
    enable = true;
    extraOptions = [
      "--icons"
      "--header"
      "--group-directories-first"
      "--color=always"
      "--git-repos"
      "--total-size"
    ];
  };
}
