{ pkgs, ... }:

{
  programs.nushell = {
    enable = true;

    # shell aliases
    shellAliases = {
      neofetch = "fastfetch";
      cat = "bat --color=always";
      htop = "btop";
      ll = "ls -a";
      rwatch = "cargo watch -q -c -w src/ -x 'run -q'";

      # Darwin
      darwin-switch = "sudo darwin-rebuild switch --flake ~/nix-configuration#bunnybook_air";
      darwin-dry = "darwin-rebuild build --dry-run --flake ~/nix-configuration#bunnybook_air";
    };

    # env.nu
    envFile.text = ''
      # Path
      use std/util "path add"
      path add "~/.cargo/bin"
      path add "/run/current-system/sw/bin"
      path add "/nix/var/nix/profiles/default/bin"
      path add "/opt/homebrew/bin"
      path add $"/etc/profiles/per-user/($env.USER)/bin"

      # Nushell
      $env.config.buffer_editor = "${pkgs.neovim}/bin/nvim"
      $env.config.show_banner = false
    '';

    # config.nu
    configFile.text = ''
      # Auto-activate Python .venv when entering directories
      $env.config.hooks = {
        env_change: {
          PWD: [
            {|before, after|
              # Auto-activate .venv if it exists
              if (".venv" | path exists) {
                $env.VIRTUAL_ENV = ($env.PWD | path join ".venv")
                $env.PATH = ($env.PATH | prepend ($env.VIRTUAL_ENV | path join "bin"))
              }
            }
          ]
        }
      }
    '';
  };
}
