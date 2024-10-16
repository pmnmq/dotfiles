# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, ... }:
let
  commonPackages = (import ./common.nix {
    inherit config pkgs lib;
  }).environment.systemPackages;
in {
  imports = [ # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./common.nix
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub.configurationLimit = 20;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  networking.proxy.default = "http://192.168.31.11:7890";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;
  networking.nameservers = [ "8.8.8.8" "114.114.114.114" ];

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  i18n.inputMethod = {
    type = "fcitx5";
    enable = true;
    fcitx5.addons = with pkgs; [
      fcitx5-mozc
      fcitx5-gtk
      fcitx5-chinese-addons
      fcitx5-pinyin-zhwiki
    ];
  };
  i18n.inputMethod.fcitx5.waylandFrontend = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.chun.shell = pkgs.zsh;

  programs.hyprland.enable = true;
  programs.zsh.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  # environment.systemPackages = lib.mkMerge [
  #   config.environment.systemPackages
  #   (with pkgs; [ kitty psmisc networkmanagerapplet xclip openssl blueman ])
  # ];
  # environment.systemPackages = config.environment.systemPackages ++ [
  #   pkgs.kitty
  #   pkgs.psmisc
  #   pkgs.networkmanagerapplet
  #   pkgs.xclip
  #   pkgs.openssl
  #   pkgs.blueman
  # ];
  # environment.systemPackages = config.environment.systemPackages
  #   ++ (with pkgs; [ kitty psmisc networkmanagerapplet xclip openssl blueman ]);
  # environment.systemPackages = lib.debug.traceVal config.environment.systemPackages;
  environment.systemPackages = (commonPackages ++ [
    pkgs.kitty
    pkgs.psmisc
    pkgs.networkmanagerapplet
    pkgs.xclip
    pkgs.openssl
    pkgs.blueman
  ]);
  # environment.systemPackages = with pkgs;
  #   [ kitty psmisc networkmanagerapplet xclip openssl blueman ]
  #   ++ config.environment.systemPackages;

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    liberation_ttf
    nerdfonts
    font-awesome
    unifont
    wqy_zenhei
    wqy_microhei
  ];

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  services.blueman.enable = true;

  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [ 22 53317 ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;
}
