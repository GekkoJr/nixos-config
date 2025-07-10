{
	description = "GekkoJr's nixos config (i don't really know what im doing...)";

	inputs = {
		# using nixos unstable
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
		
		#adding NUR for firefox extensions
		nur.url = "github:nix-community/NUR";
		nur.inputs.nixpkgs.follows = "nixpkgs";

		# adding home manager for dotfiles
		home-manager.url = "github:nix-community/home-manager";
		home-manager.inputs.nixpkgs.follows = "nixpkgs";
	};
	
	outputs = inputs@ {
		self,
		nixpkgs,
		home-manager,
		nur,
		...
	}: {
	nixosConfigurations = {
		# config for the crappy thinkpad :/
		kimaris = nixpkgs.lib.nixosSystem {
			system = "x86_64-linux";
			
			modules = [
				./hosts/kimaris
				nur.modules.nixos.default
				home-manager.nixosModules.home-manager
				{
					home-manager.useGlobalPkgs = true;
					home-manager.useUserPackages = true;
					home-manager.users.gekko = ./hosts/kimaris/home.nix;
				}
			];
			};
		};
	};
}
