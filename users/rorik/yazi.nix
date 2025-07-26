{ config, pkgs, ... }:

{
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
}
