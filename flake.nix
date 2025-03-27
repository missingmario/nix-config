{
  description = "Example nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    nix-darwin.url = "github:LnL7/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nix-homebrew.url = "github:zhaofengli/nix-homebrew";
  };

  outputs =
    {
      self,
      nix-darwin,
      home-manager,
      nix-homebrew,
      ...
    }:
    let
      vars = {
        hostPlatform = "aarch64-darwin";

        rev = self.rev or self.dirtyRev or null;
      };
      specialArgs = {
        inherit vars;
      };
      modules = [
        home-manager.darwinModules.home-manager
        nix-homebrew.darwinModules.nix-homebrew

        ./system/darwin
        ./system/darwin/homebrew

        ./home
        ./home/users/mario
        ./home/files
      ];
    in
    {
      darwinConfigurations."mario-macbook" = nix-darwin.lib.darwinSystem {
        inherit specialArgs;
        inherit modules;
      };
      darwinConfigurations."mario-macbook-vm-macos" = nix-darwin.lib.darwinSystem {
        inherit specialArgs;
        inherit modules;
      };
    };
}
