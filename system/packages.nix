{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    timeshift
  ];
}
