{ config, pkgs, ... }: {

    imports = [
    #  ./theme
    #  ./alias
    #  ./terminal
    ];

    home.username = "s4yok";
    home.homeDirectory = "/home/s4yok";

    programs.git = {
      enable = true;
      settings = {
        user.name = "s4yok";
        user.email = "s4yok@proton.me";
	init.defaultBranch = "main";
      };
    }; 

    programs.bash.enable = true;

    programs.home-manager.enable = true;
    home.stateVersion = "26.05";


    home.packages = with pkgs; [

      foot
      cmatrix
      btop
      fastfetch
    ];

}
