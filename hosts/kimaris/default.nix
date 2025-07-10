{
	config,
	pkgs,
	...
} : {
	imports = [
		../../modules/core

		#include hardware config
		./hardware-configuration.nix
	];

	networking.hostName = "kimaris";

	# enable networking
	networking.networkmanager.enable = true;
	
	#Do not change!
	system.stateVersion = "25.05";
}
