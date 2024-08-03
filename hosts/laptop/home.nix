{ inputs, ... }:

{
  imports =
    [
      ../../modules/hm
      ../../modules/hm/wm/hyprland/config/touchpad.nix
      ../../modules/hm/wm/hyprland/services/batteryprofile.nix
      inputs.nixvim.homeManagerModules.nixvim
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
