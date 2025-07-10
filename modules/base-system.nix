{
	pkgs,
	lib,
	username,
	...
}: {
	# Creating my user (gekko)
	users.users.gekko = {
		isNormalUser = true;
		extraGroups = [
			"networkmanager"
			"wheel"
		];
	};

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

	# set the keyboard locale 
	i18n.defaultLocale = "en_GB.UTF-8";
	
	environment.systemPackages = with pkgs; [
		neovim
		wget
		curl
		git
		neofetch
	];

	security.polkit.enable = true;

	# make keyboard usable 
	services.xserver.xkb.layout = "no";
	console.keyMap = "no";
}
