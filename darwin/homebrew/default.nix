{user, ...}: {
  homebrew = {
    casks = [
      "brave-browser"
      "tailscale-app"
    ];
    enable = true;
    masApps = {
      "VidHub -Video Library & Player" = 1659622164;
    };
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
