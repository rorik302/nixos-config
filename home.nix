{ config, pkgs, ... }:

{
  home = {
    username = "rorik";
    homeDirectory = "/home/rorik";

    stateVersion = "25.05";
  };

  programs.starship = {
    enable = true;
  };

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

  programs.navi = {
    enable = true;
  };

  programs.atuin = {
    enable = true;
    settings = {
      invert = true;
      style = "full";
    };
  };

  programs.fish = {
    enable = true;
    shellAliases = {
      ls = "eza";
      tree = "eza --tree";
    };
    shellInit = ''
      set -g fish_greeting "" 

      # zoxide
      zoxide init fish | source

      # fzf
      fzf --fish | source
      set -g FZF_DEFAULT_OPTS "--exact --ignore-case --style full --preview 'bat -n --color=always {}'"

      # atuin
      atuin init fish | source

      # navi
      navi widget fish | source

      # starship
      starship init fish | source
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

  programs.bat = {
    enable = true;
  };

  programs.fzf = {
    enable = true;
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

  programs.zoxide = {
    enable = true;
  };

  programs.lazygit = {
    enable = true;
  };
}
