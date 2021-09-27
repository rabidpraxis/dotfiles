{ pkgs, config, ... }: {
  home = {
    packages = with pkgs; [
      htop
      ripgrep
      alacritty
    ];
    username = "kevin";
    homeDirectory = "/home/kevin";

    sessionVariables = {
      EDITOR = "nvim";
    };
  };

  xdg.configFile."alacritty/alacritty.yml".source = ../config/alacritty/alacritty.yml;
}
