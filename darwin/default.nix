{
  inputs,
  pkgs,
  system,
  user,
  ...
}: {
  environment.systemPackages = [
    inputs.nfl.packages.${system}.default
    inputs.wezterm.packages.${system}.default
  ];
  fonts.packages = [pkgs.nerd-fonts.jetbrains-mono];
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.${user}.home = {
      file = {
        ".wezterm.lua".source = ./.wezterm.lua;
      };
      homeDirectory = "/Users/${user}";
      stateVersion = "25.11";
    };
  };
  nix.settings.experimental-features = "nix-command flakes";
  nixpkgs.hostPlatform = system;
  system.stateVersion = 6;
  users.users.${user}.home = "/Users/${user}";
}
