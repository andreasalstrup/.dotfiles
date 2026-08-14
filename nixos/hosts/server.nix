{ pkgs, ... }:

{
  imports = [
    ../modules/home-manager/nvim.nix
  ];

  home.username = "yourusername";
  home.homeDirectory = "/home/yourusername";
  home.stateVersion = "24.11";
}
