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
      silver-searcher
      gnumake

      jq
      sassc
      libsass

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

  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;
  programs.direnv.nix-direnv.enableFlakes = true;

  xdg.configFile."alacritty/alacritty.yml".source = ../../config/alacritty/alacritty.yml;
}
