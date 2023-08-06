{ pkgs, ... }:

{
  # https://github.com/nix-community/home-manager/pull/2408
  environment.pathsToLink = [ "/share/fish" ];

  # Since we're using fish as our shell
  programs.fish.enable = true;

  users.users.daniel = {
    isNormalUser = true;
    home = "/home/daniel";
    extraGroups = [ "docker" "wheel" ];
    shell = pkgs.fish;
    password = "857291";
  };

  nixpkgs.overlays = import ../../lib/overlays.nix ++ [
    (import ./vim.nix)
  ];
}
