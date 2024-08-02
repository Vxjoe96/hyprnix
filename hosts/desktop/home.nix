{ ... }:

{
  imports =
    [
      ../../modules/hm
      ../../modules/hm/wm/hyprland/config/vrr.nix
    ];
    
  home.username = "joseph";
  home.homeDirectory = "/home/joseph";

  home.stateVersion = "24.05";
  
  fonts.fontconfig.enable = true;

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  programs.home-manager.enable = true;
}
