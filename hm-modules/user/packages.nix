{pkgs, ...}: {
  home.packages = with pkgs; [
    ghostty
    git
    gh-dash
    jq

    nix-prefetch-git

    xdg-user-dirs

    brightnessctl
    cliphist
    wl-clipboard
    pavucontrol
    playerctl
    hyprshot

    #screenrecord script
    slurp
    wf-recorder

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
    discord
    element-desktop
    wasistlos
    irssi
    chromium
    weechat
    freetube
    twitch-hls-client

    chess-tui

    alacritty
    foot
    anyrun

    (mpv.override {scripts = [mpvScripts.mpris];})

    nautilus
    yad

    libreoffice-fresh
  ];
}
