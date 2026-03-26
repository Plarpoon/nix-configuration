{ pkgs, ... }:

{
  programs.gpg = {
    enable = true;
    settings = {
      default-key = "E66DC37E9B4D6320";
    };
  };

  home.file.".gnupg/gpg-agent.conf".text = ''
    enable-ssh-support
    pinentry-program ${pkgs.pinentry_mac}/Applications/pinentry-mac.app/Contents/MacOS/pinentry-mac
  '';
}
