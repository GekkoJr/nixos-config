{
  config,
  pkgs,
  ...
}:
{
  imports = [
    ../../modules/core
    ../../modules/office
    ../../modules/games
    ../../modules/design
    ../../modules/dev

    #include hardware config
    ./hardware-configuration.nix
  ];

  networking.hostName = "bael";

  # enable networking
  networking.networkmanager.enable = true;

  environment.systemPackages = with pkgs; [
    #ollama-rocm
  ];

  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

  services.printing = {
    enable = true;
    drivers = with pkgs; [
      cups-filters
      cups-browsed
    ];
  };

  #Do not change!
  system.stateVersion = "25.05";
  boot.kernelPatches = [
    {
      name = "amdgpu-ignore-ctx-privileges";
      patch = pkgs.fetchpatch {
        name = "cap_sys_nice_begone.patch";
        url = "https://github.com/Frogging-Family/community-patches/raw/master/linux61-tkg/cap_sys_nice_begone.mypatch";
        hash = "sha256-Y3a0+x2xvHsfLax/uwycdJf3xLxvVfkfDVqjkxNaYEo=";
      };
    }
  ];
}
