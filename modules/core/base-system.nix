{
	pkgs,
	lib,
	username,
	...
}: {
	nix.settings = {
	#enable flakes
	experimental-features = [
		"nix-command"
		"flakes"
	];
	};
	
	# allow unfree packages
	nixpkgs.config.allowUnfree = true;

	#time zone 
	time.timeZone = "Europe/Oslo";
	
	environment.systemPackages = with pkgs; [
		neovim
		wget
		curl
		git
		neofetch
	];

	security.polkit.enable = true;

	hardware.graphics.enable = true;
}
