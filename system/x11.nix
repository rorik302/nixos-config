{ config, pkgs, ... }:

{
  services.xserver = {
    xkb = {
      layout = "custom_us,custom_ru";
      options = "grp:alt_shift_toggle";
      extraLayouts = {
        custom_us = {
	  description = "Custom US layout";
	  languages = [ "eng" ];
	  symbolsFile = ../xkb_symbols/custom_us.xkb_symbols;
	};
        custom_ru = {
	  description = "Custom RU layout";
	  languages = [ "rus" ];
	  symbolsFile = ../xkb_symbols/custom_ru.xkb_symbols;
	};
      };
    };
  };
}
