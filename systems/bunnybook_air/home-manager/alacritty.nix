{ ... }:

{
  programs.alacritty = {
    enable = true;

    settings = {
      general.import = [
        "~/.config/alacritty/themes/themes/challenger_deep.toml"
      ];

      env.TERM = "xterm-256color";

      font = {
        size = 12.0;
        normal.family = "FiraCode Nerd Font";
        bold.family = "FiraCode Nerd Font";
        italic.family = "FiraCode Nerd Font";
        bold_italic.family = "FiraCode Nerd Font";
      };

      #scrolling.multiplier = 5;
      #selection.save_to_clipboard = true;

      window = {
        dynamic_title = true;
        opacity = 1.0;
        dimensions = {
          columns = 150;
          lines = 40;
        };
      };

      terminal.shell = {
        program = "/run/current-system/sw/bin/nu";
      };
    };
  };
}
