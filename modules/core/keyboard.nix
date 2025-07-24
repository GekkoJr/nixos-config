{ ... }:
{
  i18n.defaultLocale = "en_GB.UTF-8";

  #fix keymap
  services.xserver.xkb.layout = "no";
  console.keyMap = "no";
}
