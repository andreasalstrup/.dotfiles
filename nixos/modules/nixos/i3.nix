{ pkgs, ... }:

{
  # environment.pathsToLink = [ "/libexec" ]; # links /libexec from derivations to /run/current-system/sw
  # services.displayManager.defaultSession = "none+i3";
  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;

    desktopManager = {
      xterm.enable = false;
    };

    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        dmenu
        # i3status
        i3blocks
        i3lock
        xautolock
      ];
    };
  };
}
