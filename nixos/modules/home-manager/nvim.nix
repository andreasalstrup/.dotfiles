{ pkgs, config, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    extraPackages = with pkgs; [
      # LSP Servers
      gopls
      rust-analyzer
      typescript-language-server
      lua-language-server
      clang-tools
      pyright
      nil

      # Formatters/Linters
      stylua
      black
      eslint_d
    ];
  };

  home.file.".config/nvim" = {
    source = ../../../nvim/.config/nvim;
    recursive = true;
  };

  # Install packer.nvim itself so `require('packer')` resolves
  # home.file.".local/share/nvim/site/pack/packer/start/packer.nvim" = {
  #   source = pkgs.vimPlugins.packer-nvim;
  # };
}
