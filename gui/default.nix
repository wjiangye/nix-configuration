{ config, pkgs, ... }: {

    hardware.graphics = {
      enable = true;
      enable32Bit = true;
    };

    xdg.portal = {
      enable = true;
      extraPortals = [
	pkgs.xdg-desktop-portal-gnome
	pkgs.xdg-desktop-portal-gtk
      ];

      config.common.default = [ "gnome" "gtk" ];
    };

    environment = {
      sessionVariables = {
        NIXOS_OZONE_WL = "1";

	QT_QPA_PLATFORM = "wayland;xcb";
	QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";

	GTK_BACKEND = "wayland,x11,*";
	CLUTTER_BACKEND = "wayland";

	SDL_VIDEODRIVER = "wayland";
	_JAVA_AWT_WM_NONREPARENTING = "1";
      };

      systemPackages = with pkgs; [
        xwayland-satellite
        xwayland

      ];
    };

    programs = {
      niri.enable = true;

      firefox = {
	enable = true;
	languagePacks = [ "es-ES" "de" ];

	policies = {
	  DisableTelemetry = true;
	  DisableFirefoxStudies = true;
	  DisablePocket = true;
	  DisableFeedbackCommands = true;

	  EnableTrackingProtection = {
	    Value = true;
	    Locked = true;
	    Criptomining = true;
	    Fingerprinting = true;
	  };

	  DontCheckDefaultBrowser = true;

	  FirefoxHome = {
	    Search = true;
	    TopSites = false;
	    SponsoredTopSites = false;
	    Pocket = false;
	    SponsoredPocket = false;
	    Snippets = false;
	  };

	  ExtensionSettings = {
	    "*".installation_mode = "blocked";

	    "uBlock0@raymondhill.net" = {
	      install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
	      installation_mode = "force_installed";
	    };

	    "" = {
	      install_url = "https://addons.mozilla.org/firefox/downloads/latest/decentraleyes/latest.xpi";
	      installation_mode = "force_installed";
	    };
	  };

	  UserPreferences = {
	    "privacy.globalprivacycontrol.enabled" = true;
	    "browser.newtabpage.activity-stream.showSponsored" = false;
	    "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
	    "browser.ping-centre.telemetry" = false;
	  };
        };
      };      
    };
}
	
