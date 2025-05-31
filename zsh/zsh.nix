{ config, pkgs, ... }:

let
  nebula = builtins.fetchGit {
    url = "https://github.com/pmnmq/nebula";
    ref = "main";
    rev = "978e5d4d942bb63df3b7f1fa3323bb5bee0051e4";
  };
in {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    historySubstringSearch.enable = true;
    initContent = ''
      if [ -f ${config.xdg.configHome}/zsh/zshrc ]; then
        source ${config.xdg.configHome}/zsh/zshrc
      fi
    '';

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "extract" "1password" ];
      custom = "${nebula}";
      theme = "nebula";
    };
  };
}
