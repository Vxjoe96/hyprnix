{ config, pkgs, inputs, ... }:
    {
        home.packages = 
            [
                pkgs.remmina
            ];
    }