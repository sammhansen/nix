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
        #intel-compute-runtime
        intel-ocl
        vaapiIntel
        vaapiVdpau
        libvdpau-va-gl
        #intel-media-driver
        mesa.opencl
        mesa
        libGL
        libGLU
      ];
    };

    environment.systemPackages = with pkgs; [
      mesa
      mesa-demos
      vpl-gpu-rt
      clinfo
      ocl-icd
      intel-compute-runtime
      libvdpau-va-gl
      libva
      libva-utils

      egl-wayland
    ];
  };
}
