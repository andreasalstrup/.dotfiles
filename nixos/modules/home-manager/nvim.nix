{ pkgs, config, ... }:

{
  home.packages = [ pkgs.neovim ];

  home.file.".config/nvim" = {
    source = ../../../nvim/.config/nvim;
    recursive = true;
  };
}
