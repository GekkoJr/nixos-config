{
	config,
	pkgs,
	...
} : {
	imports = [
		../../modules/base-system.nix

		#include hardware config
		./hardware-configuration.nix
	];

	boot.loader = {
		efi = {
			canTouchEfiVariables = true; 
		};
		systemd-boot.enable = true;
	};

	networking.hostName = "kimaris";

	# enable networking
	networking.networkmanager.enable = true;
	
	#enable opengl
	hardware.opengl.enable = true;

	#Do not change!
	system.stateVersion = "25.05";
}
