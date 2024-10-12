{ config, pkgs, ... }:
let currentDir = "${config.home.homeDirectory}/configFile";
in {
  home.username = "chun";
  home.homeDirectory = "/home/chun";
  home.stateVersion = "24.05";
  home.enableNixpkgsReleaseCheck = false;
  xdg.enable = true;
  xdg.configFile = {
    "fd".source = config.lib.file.mkOutOfStoreSymlink "${currentDir}/fd";
    "fish".source = config.lib.file.mkOutOfStoreSymlink "${currentDir}/fish";
    "hypr".source = config.lib.file.mkOutOfStoreSymlink "${currentDir}/hypr";
    "kitty".source =
      config.lib.file.mkOutOfStoreSymlink "${currentDir}/kitty-linux";
    "lazygit".source =
      config.lib.file.mkOutOfStoreSymlink "${currentDir}/lazygit";
    "nvim".source = config.lib.file.mkOutOfStoreSymlink "${currentDir}/nvim";
    "pip".source = config.lib.file.mkOutOfStoreSymlink "${currentDir}/pip";
    "rofi".source = config.lib.file.mkOutOfStoreSymlink "${currentDir}/rofi";
    "yazi".source = config.lib.file.mkOutOfStoreSymlink "${currentDir}/yazi";
    "zsh".source = config.lib.file.mkOutOfStoreSymlink "${currentDir}/zsh";
    "waybar".source =
      config.lib.file.mkOutOfStoreSymlink "${currentDir}/waybar";
  };
  imports = [ (import ./zsh/zsh.nix { inherit config pkgs; }) ];
  home.packages = with pkgs; [
    # show sys info in term
    neofetch
    nitch

    # browser
    google-chrome
    firefox

    clash-meta
    clash-verge-rev
    qq
    telegram-desktop
    discord

    # cli
    gh
    eza
    fzf
    btop

    # archives
    zip
    xz
    unzip
    gzip
    # utils
    ripgrep
    jq
    fd
    which
    gnutar
    gawk
    gnupg
    glow
    lsof
    ldns
    bat

    # set wayland wallpaper
    swww

    obs-studio
    localsend

    # screen shot
    watershot
    grim

    slurp
    # lock
    swaylock
    # logout
    wlogout
    rofi-wayland
    mako
    waybar

    cargo
    rustc
    nodejs
    nodePackages.pnpm
    python3
    python3Packages.pip
    go
    yazi
    lazygit
    bibata-cursors
  ];

  # git 相关配置
  programs.git = {
    enable = true;
    userName = "Chun";
    userEmail = "pujichun@outlook.com";
  };
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

}
