{
  inputs,
  pkgs,
  system,
  user,
  ...
}: {
  imports = [
    ./home-manager
    ./homebrew
  ];

  environment.systemPackages = [
    inputs.nfl.packages.${system}.default
    inputs.wezterm.packages.${system}.default
  ];

  fonts.packages = [pkgs.nerd-fonts.jetbrains-mono];

  nix.settings.experimental-features = "nix-command flakes";

  nixpkgs.hostPlatform = system;

  system = {
    primaryUser = user;
    stateVersion = 6;
  };

  users.users.${user}.home = "/Users/${user}";
}
