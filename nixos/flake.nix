{
  description = "nixos config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/release-25.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    { self, nixpkgs, home-manager, ... } @ inputs:
    let
      systems = [ "aarch64-linux" "x86_64-linux" ];
      forAllSystems = nixpkgs.lib.genAttrs systems;
      username = "yourusername";
    in
    {
      packages = forAllSystems(system: import ./pkgs nixpkgs.legacyPackages.${system});
      formatter = forAllSystems(system: nixpkgs.legacyPackages.${system}.nixpkgs-fmt);

      overlays = import ./overlays {inherit inputs;};
      nixosModules = import ./modules/nixos;
      homeModules = import ./modules/home-manager;

      nixosConfigurations = {
        desktop = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs username; };
          modules = [
            { nixpkgs.overlays = [
                self.overlays.additions
                self.overlays.modifications
                self.overlays.unstable-packages
              ];
              nixpkgs.config.allowUnfree = true; 
            }
            ./hosts/desktop
            home-manager.nixosModules.home-manager
            {
              home-manager.extraSpecialArgs = { inherit inputs username; };
              home-manager.users.${username} = import ./hosts/desktop.nix;
            }
          ];
        };

        laptop = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs username; };
          modules = [
            { nixpkgs.overlays = [
                self.overlays.additions
                self.overlays.modifications
                self.overlays.unstable-packages
              ];
            }
            ./hosts/laptop
            home-manager.nixosModules.home-manager
            {
              home-manager.extraSpecialArgs = { inherit inputs username; };
              home-manager.users.${username} = import ./hosts/laptop.nix;
            }
          ];
        };

        server = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs username; };
          modules = [
            { nixpkgs.overlays = [
                self.overlays.additions
                self.overlays.modifications
                self.overlays.unstable-packages
              ];
            }
            ./hosts/server
          ];
        };
      };
    };
}

