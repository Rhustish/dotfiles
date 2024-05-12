{ config, lib, pkgs, ... }:

{
  nixpkgs.config = {
  	allowUnfree = true;
  };

  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # BootLoader
  boot.loader ={
    efi = {
      canTouchEfiVariables = true;
    };
    grub = {
      enable = true;
      copyKernels = true;
      efiSupport = true;
      devices = ["nodev"];
    };
  };
  networking.hostName = "TUBELIGHT"; # Define your hostname.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Set your time zone.
  time.timeZone = "Asia/Kolkata";


  programs = {
  	hyprland = {
  		enable = true;
  		enableNvidiaPatches = true;
  		xwayland.enable = true;
  		portalPackage = pkgs.xdg-desktop-portal-hyprland;
  	};
  	waybar.enable = true;
  	fish.enable = true;
  	steam.enable = true;
  	starship.enable = true;
  	nm-applet = {
  		enable = true;
  		indicator = true;
  	};
  	htop.enable = true;
  	git.enable = true;
  	neovim.enable = true;
  	xwayland.enable = true;
  	
  };

  # Enable sound.
  sound.enable = true;
  security.rtkit.enable = true;
  services.pipewire = {
  	enable = true;
  	alsa.enable = true;
  	alsa.support32Bit = true;
  	pulse.enable = true;
  	jack.enable = true;
  };

  
  hardware = {
  	opengl = {
  		enable = true;
  		driSupport = true;
  		driSupport32Bit = true;
  	};
  	bluetooth = {
  		enable = true;
  		powerOnBoot = true;
  	};
  	nvidia = {
  	  package = config.boot.kernelPackages.nvidiaPackages.production;
  	  modesetting.enable = true;
  	  open = false;
  	  nvidiaSettings = true;
  	  prime = {
  	    offload = {
  	      enable = true;
  	      enableOffloadCmd = true;	
  	    };
  	    amdgpuBusId = "PCI:5:0:0";
  	    nvidiaBusId = "PCI:1:0:0";
  	  };
  	};
  	openrazer = {
  	  enable = true;
  	  users = [ "rhust" ];
  	  syncEffectsEnabled = true;
  	  	
  	};
  };

  # List services that you want to enable:
  services = {
  	xserver = {
  		libinput.enable = true;
  		videoDrivers = [ "nvidia" "amdgpu" ];
  	};
  	upower.enable = true;
  	blueman.enable = true;
  	squeezelite.pulseAudio = true;
  };

  xdg = {
  	sounds.enable = true;
  	mime = {
  		enable = true;
  		defaultApplications = {
  		  "application/xhtml+xml" = "google-chrome-stable";
          "text/html" = "google-chrome-stable";
          "text/xml" = "google-chrome-stable";
          "x-scheme-handler/ftp" = "google-chrome-stable";
          "x-scheme-handler/http" = "google-chrome-stable";
          "x-scheme-handler/https" = "google-chrome-stable";
  		};
  	};
  	menus.enable = true;
  	icons.enable = true;
  	autostart.enable = true;
  	portal.enable = true;
  	#portal.wlr.enable = true;
  	#portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk pkgs.xdg-desktop-portal-kde ];
  };


   fonts = {
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      font-awesome
      source-han-sans
      open-sans
      liberation_ttf
  	  fira-code
      fira-code-symbols
      mplus-outline-fonts.githubRelease
      dina-font
      proggyfonts
      nerdfonts
      unifont_upper
    ];
    fontconfig.defaultFonts = {
      serif = [ "Noto Serif" "Source Han Serif" ];
      sansSerif = [ "Open Sans" "Source Han Sans" ];
      emoji = [ "Noto Color Emoji" ];
    };
    fontDir.enable = true;
    enableGhostscriptFonts = true;
  };


  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.rhust = {
    isNormalUser = true;
    home="/home/rhust";
    description="Bhavy Bhatnagar";
    extraGroups = [ "audio"  "wheel" "networkmanager"  "user-with-access-to-virtualbox" "docker" "vboxusers"  ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      #packages here
    ];
  };

  users.defaultUserShell = pkgs.fish;

  virtualisation = {
  	virtualbox = {
  		host.enable = true;
  		host.enableExtensionPack = true;
  		guest.enable = true;
  		guest.x11 = true;
  	};
  	docker.enable = true;
  };
  
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    discord
    wget
    nodejs_21
    python3
    micro
    kitty
    google-chrome
    vscode
    libsForQt5.dolphin
    libsForQt5.qt5ct
    libsForQt5.qtstyleplugin-kvantum
    qt6Packages.qt6ct
    dunst
    libnotify
    wl-clipboard
    swww
    starship
    nerdfonts
    rofi-wayland
    xdg-utils
    eww-wayland
    killall
    wallust
    cider
    networkmanagerapplet
    lxde.lxsession
    wlogout
    playerctl
    brightnessctl
    pamixer
    hyprshade
    grimblast
    hyprpicker
    slurp
    cliphist
    nwg-look
    qt6.qtwayland
    libsForQt5.qt5.qtwayland
    parallel 
    jq
    envsubst
    pavucontrol
    lm_sensors
    auto-cpufreq
    polychromatic
    wdisplays
  ];
  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  system.stateVersion = "23.11"; # Did you read the comment?
}
