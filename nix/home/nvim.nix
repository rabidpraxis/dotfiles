{ pkgs, config, ... }: {
  home.packages = with pkgs; [
    unstable.neovim
  ];

  xdg.configFile."nvim" = {
    source = ../config/nvim;
    recursive = true;
  };
}
