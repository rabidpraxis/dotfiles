{ pkgs, ... }: {
  home.packages = with pkgs; [
    zsh-powerlevel10k
    coreutils
  ];

  programs.zsh = {
    enable = true;
    autocd = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    initExtra = ''
      eval `${pkgs.coreutils}/bin/dircolors "${../config/dircolors/solarized.256dark}"`
      source ~/.aliases
    '';

    zplug = {
      enable = true;
      plugins = [
        { name = "zsh-users/zsh-history-substring-search"; }
        { name = "zsh-users/zsh-completions"; }
        { name = "zsh-users/zsh-syntax-highlighting"; }
        { name = "agkozak/zsh-z"; }
        { name = "zsh-users/zsh-autosuggestions"; }
        { name = "romkatv/powerlevel10k"; tags = [ as:theme depth:1 ]; } # Installations with additional options. For the list of options, please refer to Zplug README.
      ];
    };
  };

  home.file = {
    ".gitconfig".source = ../../.gitconfig;
    ".aliases".source = ../config/zsh/.aliases;
    ".dircolors".source = ../config/dircolors/solarized.256dark;
    ".p10k.zsh".source = ../config/zsh/.p10k.zsh;
  };
}
