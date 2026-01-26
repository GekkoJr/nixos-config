{ pkgs, ... }:
{
  stylix.targets.firefox.enable = false;
  programs.firefox = {
    enable = true;
    profiles.default = {
      id = 0;
      name = "default";
      isDefault = true;

      extensions.force = true;
      extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; [
        ublock-origin
        proton-pass
      ];

      search = {
        force = true;
        default = "ddg";
        order = [ "ddg" ];
      };

      bookmarks = {
        force = true;
        settings = [
          {
            name = "School";
            toolbar = false;
            bookmarks = [
              {
                name = "IN1000";
                url = "https://www.uio.no/studier/emner/matnat/ifi/IN1000/h25/index.html";
                keyword = "in1000";
              }
              {
                name = "Canvas";
                url = "http://uio.instructure.com/";
                keyword = "canvas";
              }
              {
                name = "Devilry";
                url = "https://devilry.ifi.uio.no/";
                keyword = "devilry";
              }
              {
                name = "IN1010";
                url = "https://www.uio.no/studier/emner/matnat/ifi/IN1010/v26/index.html";
                keyword = "in1010";
              }
              {
                name = "IN1030";
                url = "https://www.uio.no/studier/emner/matnat/ifi/IN1030/v26/index.html";
                keyword = "in1030";
              }
              {
                name = "IN1150";
                url = "https://www.uio.no/studier/emner/matnat/ifi/IN1150/v26/index.html";
                keyword = "in1150";
              }
            ];
          }
        ];
      };
    };
  };
}
