{ config, pkgs, inputs, ... }:
    {
        home.packages = 
            [
                pkgs.gnome.nautilus
            ];
    }