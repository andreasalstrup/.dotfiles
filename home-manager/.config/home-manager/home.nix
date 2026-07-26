{ _config, pkgs, ... }:

let
  local = import ./local.nix;
in
{
  # home manager needs a bit of information about you and the paths it should
  # manage.
  home.username = local.username;
  home.homeDirectory = local.homeDirectory;

  # this value determines the home manager release that your configuration is
  # compatible with. this helps avoid breakage when a new home manager release
  # introduces backwards incompatible changes.
  #
  # you should not change this value, even if you update home manager. if you do
  # want to update the value, then make sure to first check the home manager
  # release notes.
  home.stateVersion = "26.05"; # please read the comment before changing.

  # the home.packages option allows you to install nix packages into your
  # environment.
  home.packages = with pkgs; [
    fzf

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  services.dunst = {
    enable = true;
  };

  programs.git = {
    enable = true;

    settings = {
      user = {
        name = local.gitName;
        email = local.gitEmail;
      };
    };
  };

  programs.zsh = {
    enable = true;

    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    plugins = [
      {
        name = "spaceship";
        src = pkgs.spaceship-prompt;
        file = "share/zsh/themes/spaceship.zsh-theme";
      }
      {
        name = "zsh-autosuggestions";
        src = pkgs.zsh-autosuggestions;
        file = "share/zsh-autosuggestions/zsh-autosuggestions.zsh";
      }
      {
        name = "zsh-syntax-highlighting";
        src = pkgs.zsh-syntax-highlighting;
        file = "share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh";
      }
    ];

    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "fzf"
      ];
    };

    initContent = ''
      DISABLE_UPDATE_PROMPT=true
      SPACESHIP_PROMPT_ASYNC=true
      SPACESHIP_NODE_SHOW=false

      SPACESHIP_PROMPT_ORDER=(
        time
        user
        dir
        git
        python
        line_sep
        char
      )

      ZSH_AUTOSUGGEST_USE_ASYNC=1
    '';
  };

  programs.neovim = {
    defaultEditor = true; # $EDITOR=nvim
  };

  # xdg.configFile."nvim" = {
  #   source = ./nvim; # path relative to your home.nix
  #   recursive = true; # symlink contents, not the folder itself
  # };

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  # home.file = {
  #   # # Building this configuration will create a copy of 'dotfiles/screenrc' in
  #   # # the Nix store. Activating the configuration will then make '~/.screenrc' a
  #   # # symlink to the Nix store copy.
  #   # ".screenrc".source = dotfiles/screenrc;
  #
  #   # # You can also set the file content immediately.
  #   # ".gradle/gradle.properties".text = ''
  #   #   org.gradle.console=verbose
  #   #   org.gradle.daemon.idletimeout=3600000
  #   # '';
  # };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/novem/etc/profile.d/hm-session-vars.sh
  #
  # home.sessionVariables = {
  #   # EDITOR = "emacs";
  # };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
