{user, ...}: {
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
}
