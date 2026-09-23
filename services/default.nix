{ config, pkgs, ... }: {


    hardware.bluetooth = {
      enable = true;
      powerOnBoot = false;
    };

    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      wireplumber.enable = true;
    };

    services = {
      upower.enable = true;
      power-profile-daemon= true;
      libinput.enable = true;
      fwupd.enable = true;
    };

    environment.systemPackages = with pkgs; [
      brightnessctl
      proton-vpn-cli
    ];

    services.flatpak.enable = true;  

    security.polkit.enable = true;
    security.pam.services.swaylock = {};

    services.udisks2.enable = true;
    services.gvfs.enable = true;


}
