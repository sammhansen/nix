{
  lib,
  pkgs,
  config,
  ...
}:
with lib; let
  cfg = config.drivers.intel;
in {
  options.drivers.intel = {
    enable = mkEnableOption "Enable Intel Graphics Drivers";
  };

  config = mkIf cfg.enable {
    services.xserver.videoDrivers = ["modesetting"];
    hardware.cpu.intel.updateMicrocode = true;
    hardware.enableRedistributableFirmware = true;

    hardware.graphics = {
      enable = true;
      extraPackages = with pkgs; [
        # intel-ocl
        # vaapiIntel
        # vaapiVdpau
        # libvdpau-va-gl
        #intel-media-driver
        mesa.opencl
        mesa
        libGL
        libGLU
        vpl-gpu-rt
      ];
    };
  };
}
