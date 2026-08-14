{ pkgs, config, ... }:

{
  home.packages = [ pkgs.kitty ];

  home.file.".config/kitty" = {
    source = ../../../kitty/.config/kitty;
  };
}
