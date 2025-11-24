{
  
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }:
    {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

	modules = [
	  ./configuration.nix

	  # Home Manager
	  home-manager.nixosModules.home-manager

	  {
	    home-manager.useGlobalPkgs = true;
	    home-manager.useUserPackages = true;

	    home-manager.users.montony = import ./home.nix;
	  }
	];
      };
      
      homeConfigurations.montony = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs { system = "x86_64-linux"; };

	modules = [
	./home.nix

	{
	  home.username = "montony";
	  home.homeDirectory = "/home/montony";

	  home.stateVersion = "25.05";
	}
	];
      };
    };
}
