{ ... }:

{
  # xdg-desktop-portal-hyprland rollback 
  nixpkgs.config.packageOverrides = pkgs: {
    xdg-desktop-portal-hyprland = pkgs.xdg-desktop-portal-hyprland.overrideAttrs (oldAttrs: {
      version = "1.2.6";
    });
  };
}
