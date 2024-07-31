{ config, pkgs, inputs, ... }:

{
  imports =
    [
      ../../modules/hm
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
