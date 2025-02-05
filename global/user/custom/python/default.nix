{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # (callPackage ./senpwai.nix {
    # wheel = python311Packages.wheel;
    # setuptools = python311Packages.setuptools;
    # poetry-core = python311Packages.poetry-core;
    # poetry = poetry;
    # })
  ];
}
