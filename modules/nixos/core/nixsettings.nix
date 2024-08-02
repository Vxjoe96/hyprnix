{ ... }:
  {
    nixpkgs.config.allowUnfree = true;
    system.stateVersion = "24.05";
    nix.settings = {
      max-jobs = 8;
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
    };
  nix.gc = {
          dates = "weekly";
          automatic = true;
          options = "--delete-generations +3";
      };
}