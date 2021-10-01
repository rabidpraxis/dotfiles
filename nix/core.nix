{ config, pkgs, lib, ... }:
let
  unstableTarball =
    fetchTarball
      https://github.com/NixOS/nixpkgs/archive/nixos-unstable.tar.gz;
in
{
  system.stateVersion = "21.05";
  i18n.defaultLocale = "en_US.UTF-8";
  time.timeZone = "America/Los_Angeles";

  users.users.kevin = {
    isNormalUser = true;
    extraGroups = [ "wheel" "docker" ];
    shell = pkgs.zsh;
  };

  nix.allowedUsers = [ "kevin" ];
  nix.trustedUsers = [ "kevin" ];

  environment.systemPackages = with pkgs; [
    vim
    home-manager
    nix-direnv

    rofi
    sxhkd
    libnotify
    betterlockscreen
    bspwm
    polybarFull
    playerctl
    pulsemixer
    unstable._1password-gui
  ];

  hardware.video.hidpi.enable = true;
  virtualisation.docker.enable = true;

  services = {
    autorandr.enable = true;
    openssh.enable = true;
    compton.enable = true;
    compton.shadow = true;

    xserver = {
      autorun = true;
      enable = true;
      layout = "us";

      ### BSPwm
      windowManager.bspwm.enable = true;
      displayManager.autoLogin.user = lib.mkForce "kevin";
      displayManager.defaultSession = "none+bspwm";
      displayManager.sddm.enable = lib.mkForce false;
      displayManager.lightdm.enable = true;
    };
  };

  nixpkgs.config = {
    allowUnfree = true;
    packageOverrides = super: let self = super.pkgs; in {
      nerdfonts-hack = self.nerdfonts.override {
        fonts = [ "Hack" ];
      };

      unstable = import unstableTarball {
        config = config.nixpkgs.config;
      };
    };
  };

  fonts = {
    fonts = with pkgs; [
      nerdfonts-hack
      unstable.material-design-icons
    ];

    fontconfig = {
      antialias = true;
      subpixel.lcdfilter = "light";
      hinting.enable = false;
      dpi = 150;
      defaultFonts = {
        sansSerif = [ "Proxima Nova" ];
        monospace = [ "Hack Nerd Font" ];
      };
    };
  };
}
