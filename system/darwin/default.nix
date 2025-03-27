{ vars, ... }:
{
  system.stateVersion = 6;
  system.configurationRevision = vars.rev;

  nix.settings.experimental-features = "nix-command flakes";
  nixpkgs.hostPlatform = "aarch64-darwin";
}
