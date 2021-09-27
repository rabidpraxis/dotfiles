{ pkgs, config, ... }:
let
  unstableTarball =
    fetchTarball
      https://github.com/NixOS/nixpkgs/archive/nixos-unstable.tar.gz;
in
{
  nixpkgs.config = {
    allowUnfree = true;
    packageOverrides = super: let self = super.pkgs; in {
      unstable = import unstableTarball {
        config = config.nixpkgs.config;
      };
    };
  };

  programs.git.enable = true;
  services.sxhkd.enable = true;

  imports = [
    ./home/zsh.nix
    ./home/console.nix
    ./home/nvim.nix
  ];

  xresources.properties = {
    # Dracula Xresources palette
    "*.foreground" = "#F8F8F2";
    "*.background" = "#282A36";
    "*.color0" = "#000000";
    "*.color8" = "#4D4D4D";
    "*.color1" = "#FF5555";
    "*.color9" = "#FF6E67";
    "*.color2" = "#50FA7B";
    "*.color10" = "#5AF78E";
    "*.color3" = "#F1FA8C";
    "*.color11" = "#F4F99D";
    "*.color4" = "#BD93F9";
    "*.color12" = "#CAA9FA";
    "*.color5" = "#FF79C6";
    "*.color13" = "#FF92D0";
    "*.color6" = "#8BE9FD";
    "*.color14" = "#9AEDFE";
    "*.color7" = "#BFBFBF";
    "*.color15" = "#E6E6E6";
  };

  xdg.dataFile = {
    "fonts" = {
      source = ./config/fonts;
      recursive = true;
    };
  };

  xdg.configFile = {
    "polybar/config".source = ./config/polybar/config;
    "sxhkd/sxhkdrc".source = ./config/sxhkd/sxhkdrc;
    "bspwm" = {
      source = ./config/bspwm;
      recursive = true;
    };
  };
}
