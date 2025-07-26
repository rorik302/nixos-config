{ config, pkgs, lib, ... }:

{
  console = {
    font = "cyr-sun16";
    keyMap = lib.mkDefault "us";
    useXkbConfig = true;
  };
}
