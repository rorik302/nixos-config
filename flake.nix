{
  description = "NixOS configuration flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-25.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, ... }@inputs: 
    let
      system = "x86_64-linux";
      pkgs = nixpkgs-unstable.legacyPackages.${ system };
      overlay-unstable = final: prev: {
        unstable = nixpkgs-unstable.legacyPackages.${ prev.system };
      };
    in {
      nixosConfigurations = {
        rorik = nixpkgs.lib.nixosSystem {
	  inherit system;
          specialArgs = { inherit inputs; };
	  modules = [
	    ({ config, pkgs, ... }: {
	      nixpkgs.overlays = [ overlay-unstable ];
	    })

	    ./configuration.nix
            ./modules/users.nix
	    
	    home-manager.nixosModules.home-manager
	    {
	      home-manager = {
	        useGlobalPkgs = true;
		useUserPackages = true;

		users = {
		  rorik = import ./hosts/rorik/home.nix;
		};
	      };
	    }
	  ];
        };
      };
    };
}
