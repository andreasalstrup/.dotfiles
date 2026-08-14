{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    mouse = true;
    keyMode = "vi";

    plugins = with pkgs.tmuxPlugins; [
      vim-tmux-navigator
      resurrect
    ];

    extraConfig = ''
      setw -g pane-base-index 1

      unbind r
      bind r source-file ~/.tmux.conf \; display "Reloaded tmux.conf"

      bind q killp
      bind C-x setw synchronize-panes \; display "Synchronize panes toggle"

      # Move between panes
      bind-key h select-pane -L
      bind-key j select-pane -D
      bind-key k select-pane -U
      bind-key l select-pane -R

      # Create a new pane
      bind '"' split-window -v -c "#{pane_current_path}"
      bind % split-window -h -c "#{pane_current_path}"

      # Create a new window
      bind c new-window -c "#{pane_current_path}"

      # Ctrl-b + Ctrl-s - Save / Ctrl-b + Ctrl-r - Restore (tmux-resurrect)
    '';
  };
}
