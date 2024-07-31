{ config, pkgs, inputs, ... }:
    {
        home.packages = 
            [
                pkgs.google-chrome
            ];
    }