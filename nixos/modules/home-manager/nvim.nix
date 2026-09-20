{ inputs, ... }:
let
  utils = inputs.nixCats.utils;

  servers = p: {
    lua_ls        = p.lua-language-server;
    nil_ls        = p.nil;
    clangd        = p.clang-tools;
    rust_analyzer = p.rust-analyzer;
    gopls         = p.gopls;
    pyright       = p.pyright;
    ts_ls         = p.typescript-language-server;
    eslint        = p.vscode-langservers-extracted;
  };
in {
  imports = [ inputs.nixCats.homeModule ];

  nixCats = {
    enable = true;
    nixpkgs_version = inputs.nixpkgs;
    addOverlays = [ (utils.standardPluginOverlay inputs) ];
    packageNames = [ "nvim" ];
    luaPath = ../../../nvim/.config/nvim;

    categoryDefinitions.replace = { pkgs, ... }: {
      lspsAndRuntimeDeps = {
        general = with pkgs; [ ripgrep fd ];

        # lsp servers and runtime dependency
        lsp = builtins.attrValues (servers pkgs) ++ [ pkgs.typescript ];

        # formatters
        format = with pkgs; [ stylua nixfmt-rfc-style ];

        # debug adapters
        debug = with pkgs; [
          vscode-extensions.vadimcn.vscode-lldb       # codelldb: c, c++, rust
          delve                                       # go
          (python3.withPackages (ps: [ ps.debugpy ])) # python
          vscode-js-debug                             # node + chrome
        ];
      };

      startupPlugins = {
        general = with pkgs.vimPlugins; [
          lze
          plenary-nvim
          nvim-web-devicons
          oil-nvim
          tokyonight-nvim
        ];
      };

      # lazy loading (lze)
      optionalPlugins = {
        general = with pkgs.vimPlugins; [
          telescope-nvim
          nvim-treesitter.withAllGrammars
          blink-cmp
        ];
        lsp = with pkgs.vimPlugins; [
          nvim-lspconfig
        ];
        debug = with pkgs.vimPlugins; [
          nvim-dap
          nvim-dap-ui
          nvim-dap-virtual-text
          nvim-nio
          nvim-dap-go
          nvim-dap-python
        ];
      };
    };

    packageDefinitions.replace = {
      nvim = { pkgs, ... }: {
        settings = {
          wrapRc = true;
          aliases = [ "vim" "vi" ];
          suffix-path = true;
        };

        categories = {
          general = true;
          lsp = true;
          format = true;
          debug = true;
        };

        # Lua object: nixCats.extra('name')
        extra = {
          servers  = builtins.attrNames (servers pkgs);
          codelldb = "${pkgs.vscode-extensions.vadimcn.vscode-lldb}/share/vscode/extensions/vadimcn.vscode-lldb/adapter/codelldb";
          js_debug = "${pkgs.vscode-js-debug}/bin/js-debug";
        };
      };
    };
  };
}
