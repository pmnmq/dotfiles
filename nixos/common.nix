{ config, lib, pkgs, ... }:

{
  time.timeZone = "Asia/Shanghai";
  services.timesyncd = {
    enable = true;
    servers = [ "ntp.aliyun.com" ];
  };

  nix.settings.substituters =
    [ "https://mirrors.ustc.edu.cn/nix-channels/store" ];
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  programs.nix-ld.enable = true;

  users.users.chun = {
    isNormalUser = true;
    home = "/home/chun";
    description = "average human";
    extraGroups = [ "wheel" "networkmanager" ];
  };

  environment.systemPackages = with pkgs; [
    git
    wget
    curl
    neovim
    zsh
    gcc
    nix-du
    gnumake
    nurl
  ];

  environment.variables.EDITOR = "nvim";
  system.stateVersion = "24.05";
}
