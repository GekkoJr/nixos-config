{pkgs ,...}: 
{
	programs.firefox = {
		enable = true;
		profiles.default = {
			id = 0;
			name = "default";
			isDefault = true;

			extensions = with pkgs.nur.repos.rycee.firefox-addons; [
				ublock-origin
			];

			search = {
				force = true;
				default = "DuckDuckGo";
				order = ["DuckDuckGo"];
			};
		};
	};
}


