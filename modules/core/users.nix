{...}: 
{
	users.users.gekko = {
		isNormalUser = true;
		extraGroups = [
			"networkmanager"
			"wheel"
		];
	};
}
