{
  description = "Hansen's Nix Setup";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-24.11";

    hyprland = {
      url = "github:hyprwm/Hyprland?rev=d26439a0fe5594fb26d5a3c01571f9490a9a2d2c&submodules=1";
      inputs.nixpkgs.follows = "nixpkgs-stable";
    };

    stylix.url = "github:danth/stylix";

    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      # inputs.nixpkgs.follows = "hyprland";
    };

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    wezterm = {
      url = "github:wez/wezterm?dir=nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser.url = "github:whoslucifer/zen-browser-flake";

    distro-grub-themes.url = "github:AdisonCavani/distro-grub-themes";

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ags = {
      url = "github:Aylur/ags";
    };
  };

  outputs = {
    nixpkgs,
    nixpkgs-stable,
    stylix,
    home-manager,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    host = "atlantis";
    username = "lilith";

    pkgs = import nixpkgs {
      inherit system;
      config = {
        allowUnfree = true;
      };
    };

    pkgs-stable = import nixpkgs-stable {
      inherit system;
      nixpkgs.config = {
        allowUnfree = true;
        allowBroken = true;
      };
    };
  in {
    nixosConfigurations = {
      "${host}" = nixpkgs.lib.nixosSystem rec {
        specialArgs = {
          inherit system;
          inherit inputs;
          inherit username;
          inherit host;
        };

        modules = [
          ./nodes/orion/config.nix

          {
            nixpkgs.config = {
              allowUnfree = true;
              # allowBroken = true;
            };
          }

          stylix.nixosModules.stylix

          inputs.distro-grub-themes.nixosModules.${system}.default

          # Make pkgs-stable available as a special argument for modules
          {
            _module.args.pkgs-stable = pkgs-stable;
          }

          home-manager.nixosModules.home-manager
          {
            home-manager = {
              # useGlobalPkgs = true;
              useUserPackages = true;
              users."${username}" = import ./home/home.nix;
              backupFileExtension = "backup";

              extraSpecialArgs = {
                inherit pkgs;
                inherit inputs;
                inherit username;
              };
            };
          }
        ];
      };
    };
  };
}
