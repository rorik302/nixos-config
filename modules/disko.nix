let 
  cfg = {
  disk = "/dev/vda";
  swap_size = "4G";
  efi_size = "1G";
};
in {
  disko.devices = {
    disk = {
      main = {
        type = "disk";
	device = cfg.disk;
	content = {
	  type = "gpt";
	  partitions = {
	    boot = {
	      name = "boot";
	      size = "1M";
	      type = "EF02";
	    };
	    ESP = {
	      priority = 1;
	      name = "ESP";
	      size = cfg.efi_size;
	      type = "EF00";
	      content = {
	        type = "filesystem";
		format = "vfat";
		mountpoint = "/boot";
		mountOptions = [ "umask=0077" ];
	      };
	    };
	    root = {
	      size = "100%";
              content = {
	        type = "btrfs";
	 	extraArgs = [ "-L" "nixos" "-f" ];
		subvolumes = {
		  "@" = { 
		    mountpoint = "/";
	            mountOptions = [ "noatime" "compress=zstd" "discard=async" "space_cache=v2" "ssd" ];
		  };
		  "@home" = { 
		    mountpoint = "/home";
		    mountOptions = [ "noatime" "compress=zstd" "discard=async" "space_cache=v2" "ssd" ];
		  };
		  "@nix" = {
		    mountpoint = "/nix";
		    mountOptions = [ "noatime" "compress=zstd" "discard=async" "space_cache=v2" "ssd" ];
		  };
		  "@snapshots" = {
		    mountpoint = "/.snapshots";
		    mountOptions = [ "noatime" "compress=zstd" "discard=async" "space_cache=v2" "ssd" ];
		  };
		  "@swap" = {
		    mountpoint = "/swap";
		    swap.swapfile.size = cfg.swap_size;
		  };
		  "@persist" = {
		    mountpoint = "/persist";
		    mountOptions = [ "noatime" "compress=zstd" "discard=async" "space_cache=v2" "ssd" ];
		  };
		  "@log" = {
		    mountpoint = "/var/log";
		    mountOptions = [ "noatime" "compress=zstd" "discard=async" "space_cache=v2" "ssd" ];
		  };
		};
	      };
	    };
	  };
	};
      };
    };
  };
  fileSystems."/persist".neededForBoot = true;
  fileSystems."/var/log".neededForBoot = true;
}
