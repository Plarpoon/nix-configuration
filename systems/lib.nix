{
  nixpkgs,
  nix-darwin,
  home-manager,
  home-manager-darwin,
  nix-homebrew,
}:

{
  mkNixOS =
    {
      hostname,
      system,
      username,
    }:
    nixpkgs.lib.nixosSystem {
      inherit system;

      specialArgs = {
        inherit hostname username;
      };

      modules = [
        ./${hostname}

        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            backupFileExtension = "backup";
            users.${username} = import ./${hostname}/home-manager;
          };
        }
      ];
    };

  mkDarwin =
    {
      hostname,
      system,
      username,
    }:
    nix-darwin.lib.darwinSystem {
      inherit system;

      specialArgs = {
        inherit hostname username;
      };

      modules = [
        ./${hostname}

        home-manager-darwin.darwinModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            backupFileExtension = "backup";
            users.${username} = import ./${hostname}/home-manager;
          };
        }

        nix-homebrew.darwinModules.nix-homebrew
      ];
    };
}
