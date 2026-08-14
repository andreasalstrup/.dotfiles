{ pkgs, config, ... }:

{
  # /etc/i3/config
  home.file.".config/i3/config".source = ../../../i3/.config/i3/config;
  # /etc/i3blocks.conf and scripts
  home.file.".config/i3blocks" = {
    source = ../../../i3blocks/.config/i3blocks;
    recursive = true;
    executable = true;
  };
}
