{user, ...}: {
  homebrew = {
    brews = [
      "tailscale"
    ];
    casks = [
      "brave-browser"
    ];
    enable = true;
    onActivation = {
      autoUpdate = true;
      cleanup = "uninstall";
      upgrade = true;
    };
  };

  nix-homebrew = {
    enable = true;
    inherit user;
  };
}
