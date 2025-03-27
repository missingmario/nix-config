{ ... }:
let
  user = "mario";
  casks = [
    "ghostty"
  ];
in
{
  nix-homebrew = {
    enable = true;
    inherit user;
  };

  homebrew = {
    enable = true;
    inherit casks;
  };
}
