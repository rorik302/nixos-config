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
    functions = {
      y = ''
        set tmp (mktemp -t "yazi-cwd.XXXXXX")
	yazi $argv --cwd-file="$tmp"
	if read -z cwd < "$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		builtin cd -- "$cwd"
	end
	rm -f -- "$tmp"
      '';
    };
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  programs.yazi = {
    enable = true;
    settings = {
      mgr = {
	show_hidden = true;
	sort_by = "natural";
        linemode = "size";
      };
    };
  };

  programs.lazygit = {
    enable = true;
  };
}
