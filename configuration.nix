{ config, lib, pkgs, ... }:

{
  imports = [ 
    ./hardware-configuration.nix
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  
  boot = {
    loader = {
      grub = {
        enable = true;
	device = "/dev/vda";
      };
    };
    kernelParams = [
      "resume_offset=533760"
    ];
    resumeDevice = "/dev/disk/by-label/nixos";
  };

  services = {
    pipewire = {
      enable = true;
      pulse = {
        enable = true;
      };
    };
    gnome = {
      gnome-keyring = {
        enable = true;
      };
    };
    displayManager = {
      sddm = {
        enable = true;
        wayland = {
	  enable = true;
	};
      };
    };
    xserver = {
      enable = true;
      xkb = {
        layout = "us,ru";
	options = "grp:alt_shift_toggle";
      };
    };
    openssh = {
      enable = true;
    };
  };

  networking = {
    hostName = "Rorik-PC";
    networkmanager = {
      enable = true;
    };
  };

  time = {
    timeZone = "Europe/Moscow";
  };

  i18n = {
    supportedLocales = [
      "en_US.UTF-8/UTF-8"
      "ru_RU.UTF-8/UTF-8"
    ];
    defaultLocale = "en_US.UTF-8";
  };

  console = {
    font = "cyr-sun16";
    keyMap = "us";
  };

  users = {
    users = {
      rorik = {
        isNormalUser = true;
	extraGroups = [ "wheel" ];
	shell = pkgs.fish;
      };
    };
  };

  environment = {
    systemPackages = with pkgs; [
      home-manager
      neovim
      gitFull
      curl
      wget
      hyprland
      yazi
      lazygit
      fish
    ];
  };

  programs = {
    git = {
      enable = true;
      package = pkgs.gitFull;
      config = {
        user = {
          name = "Aleksandr Danilenko";
	  email = "rorik302@gmail.com";
	};
      };
    };
    fish = {
      enable = true;
    };
    hyprland = {
      enable = true;
      withUWSM = true;
    };
    yazi = {
      enable = true;
    };
    lazygit = {
      enable = true;
    };
  };

  system.stateVersion = "25.05";
}
