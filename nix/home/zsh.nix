{ pkgs, ... }: {
  home.packages = with pkgs; [
    zsh-powerlevel10k
    coreutils-full
  ];

  programs.zsh = {
    enable = true;
    autocd = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    initExtra = ''
      eval `${pkgs.coreutils}/bin/dircolors "${../../config/dircolors/dark}"`

      bindkey '^R' history-incremental-search-backward

      files=(
        $HOME/.p10k.zsh
        $HOME/.exports
        $HOME/.aliases
        $HOME/.initrc
        $HOME/.exports.local
        $HOME/.aliases.local
        $HOME/.initrc.local
      )

      for file in $files; do
        [ -r $file ] && source $file
      done
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
    ".aliases".source = ../../config/zsh/.aliases;
    ".functions".source = ../../config/zsh/.functions;
    ".exports".source = ../../config/zsh/.exports;
    ".p10k.zsh".source = ../../config/zsh/.p10k-lean.zsh;
  };
}
