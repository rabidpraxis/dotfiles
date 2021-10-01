{ pkgs, config, ... }: {
  home.packages = with pkgs; [
    clojure
    unstable.clojure-lsp
    unstable.babashka
    unstable.clj-kondo
  ];
}
