{ config, pkgs, ... }:

{
  services.displayManager.ly.enable = true;  
  
  environment.etc."ly/mi-imagen.dur".source = ./assets/mi-imagen.dur;  
  
  environment.etc."ly/config.lua".text = ''  
    ly = {  
      animation = "dur",  
      dur_file_path = "/etc/ly/mi-imagen.dur",  
      dur_offset_alignment = "center",  
      dur_x_offset = 0,  
      dur_y_offset = 0,  
      full_color = true,  
      animation_timeout_sec = 0,  
      animation_frame_delay = 5,  
    }  
  '';  
}
