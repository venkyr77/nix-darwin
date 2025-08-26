{
  lib,
  pkgs,
  user,
  ...
}: {
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.${user} = {
      home = {
        file = {
          ".wezterm.lua".source = ../.wezterm.lua;
        };
        homeDirectory = "/Users/${user}";
        stateVersion = "25.11";
      };
      programs = {
        git = {
          enable = true;
          extraConfig = {
            color = {
              diff = {
                commit = "yellow bold";
                frag = "magenta bold";
                func = "146 bold";
                meta = "11";
                new = "green bold";
                old = "red bold";
                whitespace = "red reverse";
              };
              diff-highlight = {
                newHighlight = "green bold 22";
                newNormal = "green bold";
                oldHighlight = "red bold 52";
                oldNormal = "red bold";
              };
              ui = true;
            };
            core.pager = "${lib.getExe pkgs.diff-so-fancy}";
            interactive.diffFilter = "${lib.getExe pkgs.diff-so-fancy} --patch";
          };
          userEmail = "venkyrocker7777@gmail.com";
          userName = "Venkatesan Ravi";
        };
      };
    };
  };
}
