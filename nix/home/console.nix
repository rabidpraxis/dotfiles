{ pkgs, config, ... }: {
  home = {
    packages = with pkgs; [
      htop
      ripgrep
      killall
      alacritty
      xclip
      nodejs
      yarn

      gcc
      llvm
      clang-tools
    ];
    username = "kevin";
    homeDirectory = "/home/kevin";

    sessionVariables = {
      EDITOR = "nvim";
    };
  };

  xdg.configFile."alacritty/alacritty.yml".source = ../config/alacritty/alacritty.yml;
}
