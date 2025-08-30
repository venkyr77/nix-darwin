{user, ...}: {
  homebrew = {
    casks = [
      "brave-browser"
      "rectangle"
      "tailscale-app"
    ];
    enable = true;
    masApps = {
      "Caffeinated - Anti Sleep App" = 1362171212;
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
