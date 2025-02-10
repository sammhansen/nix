{lib, ...}: let
  inherit (lib.options) mkEnableOption;
in {
  options = {
    useHomeManager = mkEnableOption "use homemanager or not" {
      default = true;
    };
  };
}
