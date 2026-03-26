_:

{
  programs.git = {
    enable = true;

    settings = {
      user = {
        name = "Alessandro Suha";
        email = "github@plarp.net";
      };
    };

    signing = {
      key = "B32EE4AA9247F217";
      signByDefault = true;
    };
  };
}
