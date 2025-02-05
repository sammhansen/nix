{pkgs, ...}: {
  home.packages = with pkgs; [
    ghostty
    git
    jq

    nix-prefetch-git

    xdg-user-dirs

    brightnessctl
    cliphist
    pavucontrol
    playerctl
    hyprshot

    btop
    carapace
    zoxide
    delta
    bat
    fzf
    ripgrep
    tlrc
    zip
    unzip

    glib
    ydotool
    file

    ani-cli
    manga-cli
    yt-dlp
    spotdl

    telegram-desktop
    vesktop
    irssi
    weechat

    (mpv.override {scripts = [mpvScripts.mpris];})

    nautilus
    yad

    libreoffice-fresh
  ];
}
