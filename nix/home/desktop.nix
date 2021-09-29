{ pkgs, config, ... }: {
  home.packages = with pkgs; [
    font-manager
    dconf
    google-chrome
    dunst
    feh

    docker-compose
  ];
}
