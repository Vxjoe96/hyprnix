{ config, pkgs, inputs, ... }:
{
  imports =
    [ 
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.default
      ../../modules/nixos
    ];

  networking.hostName = "laptop";
  boot.kernelPackages = pkgs.linuxPackages_latest;
  time.timeZone = "America/Denver";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };
  
#move out at some point
  services.printing.enable = true;

  

  # Enable touchpad support (enabled default in most desktopManager).
  services.xserver.libinput.enable = true;

  # Home-Manager
  home-manager = {
    extraSpecialArgs = { inherit inputs;};
    useGlobalPkgs = true;
    users = {
      "joseph" = import ./home.nix;
      };
   };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.joseph = {
    isNormalUser = true;
    description = "joseph";
    extraGroups = [ "networkmanager" "wheel" "gamemode" ];
  };
  users.extraUsers.joseph = {
    openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHayEgLGs1ZBXwApfIsmPejHHrCb7POF79OBo85kTYr1 joseph@desktop"
    ];
}
