{ pkgs, config, ... }:
{
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "application/zip" = "xarchiver";
    };
  };

  xdg.configFile."openxr/1/active_runtime.json".source =
    "${pkgs.wivrn}/share/openxr/1/openxr_wivrn.json";

  xdg.configFile."openvr/openvrpaths.vrpath".text = ''
    {
      "config" :
      [
        "${config.xdg.dataHome}/Steam/config"
      ],
      "external_drivers" : null,
      "jsonid" : "vrpathreg",
      "log" :
      [
        "${config.xdg.dataHome}/Steam/logs"
      ],
      "runtime" :
      [
      "/home/gekko/.steam/steam/steamapps/common/SteamVR"
      ],
      "version" : 1
    }
  '';
}
