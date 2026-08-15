{ pkgs, ... }:

{
  imports = [
    ../modules/home-manager
  ];

  home.username = "yourusername";
  home.homeDirectory = "/home/yourusername";
  home.stateVersion = "24.11";

  # xkb.layout = "us";
  # xkb.variant = "";

  xresources.properties = {
    "Xcursor.size" = 16;
    "Xft.dpi" = 192;
  };
}
