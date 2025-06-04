{ config, pkgs, lib, hostname, ... }:
let currentDir = "${config.home.homeDirectory}/configFile";
in {
  home.username = "chun";
  home.homeDirectory = "/home/chun";
  home.stateVersion = "25.05";
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
    "fastfetch".source =
      config.lib.file.mkOutOfStoreSymlink "${currentDir}/fastfetch";
    "screenshot.sh".source =
      config.lib.file.mkOutOfStoreSymlink "${currentDir}/screenshot.sh";
    "wezterm".source =
      config.lib.file.mkOutOfStoreSymlink "${currentDir}/wezterm";
    "helix".source = config.lib.file.mkOutOfStoreSymlink "${currentDir}/helix";
    "alacritty".source =
      config.lib.file.mkOutOfStoreSymlink "${currentDir}/alacritty";
  };
  imports = [ (import ./zsh/zsh.nix { inherit config pkgs; }) ];

  home.packages = lib.mkMerge [
    (lib.mkIf (hostname == "nixos") (with pkgs; [
      # browser
      google-chrome
      firefox

      clash-verge-rev
      qq
      telegram-desktop
      discord

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

      bibata-cursors
      wezterm
      alacritty
    ]))
    (with pkgs; [
      fastfetch
      nitch
      clash-meta

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

      cargo
      rustc
      nodejs
      nodePackages.pnpm
      python3
      python3Packages.pip
      go
      yazi
      lazygit
      bash
      pgcli
      helix
    ])
  ];

  # git 相关配置
  programs.git = {
    enable = true;
    userName = "pmnmq";
    userEmail = "pujichun@outlook.com";
  };
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

}
