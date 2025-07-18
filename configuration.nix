{ config, lib, pkgs, ... }:

{
  imports = [ 
    ./hardware-configuration.nix
  ];
  
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
    resumeDevice = "/dev/vda/nixos";
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
      xkb = {
        layout = "us";
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
	packages = with pkgs; [
	];
      };
    };
  };

  environment = {
    systemPackages = with pkgs; [
      neovim
      gitFull
      curl
      wget
      gnome-keyring
      libsecret
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
        credential = {
	  helper = "libsecret";
	};
       };
     };
  };

  system.stateVersion = "25.05";
}
