{
  description = "GekkoJr's nixos config (i don't really know what im doing...)";

  inputs = {
    # using nixos unstable
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    # adding NUR for firefox extensions
    nur.url = "github:nix-community/NUR";
    nur.inputs.nixpkgs.follows = "nixpkgs";

    # adding stylix for theming
    stylix.url = "github:danth/stylix";
    stylix.inputs.nixpkgs.follows = "nixpkgs";

    # adding home manager for dotfiles
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # adding howdy for windows hello like unlocking
    howdy-pkg.url = "github:fufexan/nixpkgs/howdy";
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      home-manager,
      nur,
      stylix,
      howdy-pkg,
      ...
    }:
    {
      nixosConfigurations = {
        # config for the crappy thinkpad :/
        kimaris = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";

          modules = [
            ./hosts/kimaris
            nur.modules.nixos.default
            stylix.nixosModules.stylix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.gekko = ./hosts/kimaris/home.nix;
            }
          ];
        };

        #lenovo yoga slim 7i
        asmodeus = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/asmodeus
            nur.modules.nixos.default
            stylix.nixosModules.stylix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.gekko = ./hosts/asmodeus/home.nix;
            }
          ];
        };

        bael = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";

          modules = [
            ./hosts/bael
            nur.modules.nixos.default
            stylix.nixosModules.stylix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.gekko = ./hosts/bael/home.nix;
            }
          ];
        };
      };
    };
}
