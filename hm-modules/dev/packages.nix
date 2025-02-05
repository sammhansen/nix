{pkgs, ...}: {
  home.packages = with pkgs; [
    delta
    typescript
    jetbrains.idea-community
  ];
}
