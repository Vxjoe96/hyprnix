{ config, pkgs, inputs, ... }:
    {
        networking.networkmanager.enable = true;
        services.openssh = {
            enable = true;
            # require public key authentication for better security
            settings.PasswordAuthentication = false;
            settings.KbdInteractiveAuthentication = false;
            #settings.PermitRootLogin = "yes";
        };
    }