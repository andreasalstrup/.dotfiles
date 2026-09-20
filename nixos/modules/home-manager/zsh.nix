{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "";
    };

    localVariables = {
      ZSH_AUTOSUGGEST_USE_ASYNC = 1;
      SPACESHIP_PROMPT_ASYNC = true;
      SPACESHIP_NODE_SHOW = false;
      SPACESHIP_PROMPT_ORDER = [
        "time"
        "user"
        "dir"
        "git"
        "python"
        "line_sep"
        "char"
      ];
    };

    initContent = ''
      source ${pkgs.spaceship-prompt}/share/zsh/themes/spaceship.zsh-theme
    '';
  };
}
