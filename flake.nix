{
  description = "NixOS configuration for me";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    xremap-flake.url = "github:xremap/nix-flake";
  };

  outputs = inputs@{ self, nixpkgs, nixos-wsl, home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };

    in {
      nixosConfigurations = {
        nixos = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            ./nixos/configuration.nix
            inputs.xremap-flake.nixosModules.default
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              # home-manager.extraSpecialArgs = inputs;
              home-manager.users.chun = import ./home.nix;
            }
            {
              services.xremap = {
                # enable = true;
                # serviceMode = "user";
                # userName = "chun";
                withWlroots = true;
                withGnome = false;
                withX11 = false;
                withKDE = false;
              };
              services.xremap.config.modmap = [{
                name = "Global";
                remap = {
                  "Esc" = "CapsLock";
                  "CapsLock" = "Esc";
                };
              }];
            }
          ];
        };
        wsl = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            nixos-wsl.nixosModules.wsl
            ./nixos/wsl-configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              # home-manager.extraSpecialArgs = inputs;
              home-manager.users.chun = import ./home.nix;
            }
          ];
        };
      };
    };
}
