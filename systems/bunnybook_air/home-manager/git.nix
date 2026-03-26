{ ... }:

{
  programs.git = {
    enable = true;

    settings = {
      user = {
        name = "Alessandro Suha";
        email = "plarpoon@plarp.net";
      };
    };

    signing = {
      key = "E66DC37E9B4D6320";
      signByDefault = true;
    };
  };
}
