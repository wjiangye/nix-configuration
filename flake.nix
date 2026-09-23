{
  description = "NixOS config, btw";

  inputs = {

    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stbl.url = "github:NixOS/nixpkgs/nixos-26.05";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };
  outputs = inputs@{ self, nixpkgs, nixpkgs-stbl, home-manager, ... }:
  let
    system = "x86_64-linux";
    hostname = "nixosbtw";
    username = "s4yok";

    pkgs-stbl = import nixpkgs-stbl {
      inherit system;
      config.allowUnfree = true;
    };
  in {
    nixosConfigurations.${hostname} = nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = { inherit inputs pkgs-stbl username; };

      modules = [
	{ nixpkgs.config.allowUnfree = true; }
        ./hosts/laptop/configuration.nix
	./modules
        home-manager.nixosModules.home-manager

        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;

            users.${username}.imports = [ ./home-manager/home.nix ];

            extraSpecialArgs = {
              inherit inputs pkgs-stbl username;
            };
          };
        }
      ];
    };
  };
}
