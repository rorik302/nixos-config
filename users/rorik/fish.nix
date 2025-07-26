{ config, pkgs, ... }:

{
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
}
