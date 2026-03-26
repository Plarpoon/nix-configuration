{
  description = "Multi-platform Nix configuration";

  inputs = {
    # NixOS
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    home-manager.url = "github:nix-community/home-manager/release-25.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # Darwin
    nixpkgs-darwin.url = "github:NixOS/nixpkgs/nixpkgs-25.11-darwin";
    home-manager-darwin.url = "github:nix-community/home-manager/release-25.11";
    home-manager-darwin.inputs.nixpkgs.follows = "nixpkgs-darwin";
    nix-darwin.url = "github:nix-darwin/nix-darwin/nix-darwin-25.11";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs-darwin";
    nix-homebrew.url = "github:zhaofengli/nix-homebrew";
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      home-manager-darwin,
      nix-darwin,
      nix-homebrew,
      ...
    }:
    let
      lib = import ./systems/lib.nix {
        inherit
          nixpkgs
          nix-darwin
          home-manager
          home-manager-darwin
          nix-homebrew
          ;
      };
    in
    {
      # NixOS hosts
      nixosConfigurations = {
        daisy = lib.mkNixOS {
          hostname = "daisy";
          system = "x86_64-linux";
          username = "plarpoon";
        };
      };

      # Darwin hosts
      darwinConfigurations = {
        bunnybook_air = lib.mkDarwin {
          hostname = "bunnybook_air";
          system = "aarch64-darwin";
          username = "plarpoon";
        };
      };
    };
}
