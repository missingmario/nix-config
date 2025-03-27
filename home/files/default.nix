{ ... }:
let
  file = {
    ".config/ghostty/config".source = ./config/ghostty/config;
    ".config/zsh/modules".source = ./config/zsh/modules;
  };
in
{
  home-manager.users."mario".home.file = file;
}
