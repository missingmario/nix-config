{ pkgs, ... }:
let
  user = {
    name = "mario";
    home = "/Users/mario";
  };
  packages = [
    pkgs.tree

    pkgs.tree-sitter

    pkgs.nixfmt-rfc-style
    pkgs.nixd
    pkgs.lua-language-server
  ];
  programs = {
    zsh = {
      enable = true;
      dotDir = ".config/zsh";

      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;

      initExtra = ''
        . $ZDOTDIR/modules/prompt.zsh
      '';
    };

    git = {
      enable = true;

      userName = "Mario Sanchez Lara";
      userEmail = "mario@mariosl.com";

      extraConfig = {
        init.defaultBranch = "main";
        push.autoSetupRemote = true;
      };

      aliases = {
        s = "status";
        adog = "log --all --decorate --oneline --graph";
      };
    };

    gh = {
      enable = true;
      gitCredentialHelper.enable = true;
    };

    neovim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;
    };
  };
in
{
  users.users."${user.name}" = {
    home = "${user.home}";
  };

  home-manager.users."${user.name}" = {
    home = {
      username = "${user.name}";
      homeDirectory = "${user.home}";
      stateVersion = "24.11";

      inherit packages;
    };

    inherit programs;
  };
}
