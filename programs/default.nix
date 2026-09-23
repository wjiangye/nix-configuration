{ config, pkgs, pkgs-stbl, ... }: {

    programs.dconf.enable = true;

    environment.systemPackages = with pkgs; [
      pkgs-stbl.alacritty
      btop
      
      ripgrep
      fd
      fzf
      eza

      mako
      fuzzel
      swaylock
      grim
      slurp
      wl-clipboard

      pkgs-stbl.proton-vpn-cli
      pkgs-stbl.steam
      pkgs-stbl.yazi
      pkgs-stbl.zathura

      vlc
      libreoffice

    ];

}
