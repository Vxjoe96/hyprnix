{ config, pkgs, inputs, ... }:
    {
        home.packages = 
            [
                pkgs.dconf 
                pkgs.jetbrains-mono
                (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
            ];
        home.sessionVariables.GTK_THEME = "Colloid-Grey-Dark";
        home.pointerCursor = {
           # gtk.enable = true;
            x11.enable = true;
            package = pkgs.bibata-cursors;
            name = "Bibata-Modern-Classic";
            size = 16;
          };
        gtk = {
            enable = true;
            theme = {
              package = pkgs.colloid-gtk-theme.override {
                themeVariants = ["grey"];
                colorVariants = ["dark"];
                tweaks = ["black" "rimless" "float"];
              };
              name = "Colloid-Grey-Dark";
            };

            iconTheme = {
              package = pkgs.gnome.adwaita-icon-theme;
              name = "Adwaita";
            };

            font = {
                name = "JetBrainsMono";
                size = 11;
            };
            gtk3.extraConfig = 
              {
                gtk-application-prefer-dark-theme=1;
                gtk-decoration-layout=appmenu:none;
              };
            gtk4.extraConfig = 
              {
                gtk-application-prefer-dark-theme=1;
                gtk-decoration-layout=appmenu:none;
              };
          };
    }