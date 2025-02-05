{pkgs}: let
  imgLink = "https://img.freepik.com/free-photo/morskie-oko-tatry_1204-510.jpg";

  image = pkgs.fetchurl {
    url = imgLink;
    sha256 = "05g7zk10li2d2qfzxlrp16cvh5lbi0vs7lz9wwsvp9li35i21w6n";
  };
in
  pkgs.stdenv.mkDerivation {
    name = "sddm-theme";
    src = pkgs.fetchFromGitHub {
      owner = "whoslucifer";
      repo = "SDDM-NIX";
      rev = "9365be88ff1a2dbe5532561086f22b00614ecb9a";
      sha256 = "1sa4hrhv0isq24a60c150ih3drkf1hs4yjxm4mbanafrfvfn77a3";
    };
    installPhase = ''
      mkdir -p $out
      cp -R ./* $out/
      #cd $out/
      #rm background.jpg
      #rm README.md
      #cp -r #$#{#image} $out/background.jpg
    '';
  }
