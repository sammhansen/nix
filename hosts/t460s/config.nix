# this is the main default config
{
  config,
  pkgs,
  host,
  username,
  options,
  lib,
  inputs,
  system,
  ...
}: let
  inherit (import ./variables.nix) keyboardLayout;
  python-packages = pkgs.python3.withPackages (
    ps:
      with ps; [
        pip
      ]
  );
in {
  imports = [
    ./default.nix
    ../../global/default.nix
  ];

  nixpkgs.config.allowUnfree = true;
  #nixpkgs.config.allowUnsupportedSystem = true;

  users = {
    mutableUsers = true;
  };

  environment.systemPackages =
    (with pkgs; [
      vim
      home-manager
    ])
    ++ [
      python-packages
    ];

  system.stateVersion = "24.11";
}
