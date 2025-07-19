{ lib, config, pkgs, ... }:

{
  users.users = {
    rorik = {
      isNormalUser = true;
      extraGroups = [ "wheel" ];
      home = "/home/rorik";
    };
  };
}
