{ config, pkgs, ... }:

{
  users.users = {
    rorik = {
      isNormalUser = true;
      extraGroups = [ "wheel" ];
      shell = pkgs.fish;
    };
  };
}
