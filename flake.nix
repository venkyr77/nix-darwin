{
  description = "nix-darwin system flake";

  inputs = {
    home-manager = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-community/home-manager";
    };
    nfl = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:venkyr77/neovim-flake";
    };
    nix-darwin = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-darwin/nix-darwin/master";
    };
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    wezterm = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:wezterm/wezterm?dir=nix";
    };
  };

  outputs = {
    home-manager,
    nix-darwin,
    nixpkgs,
    self,
    ...
  } @ inputs: let
    systems = [
      "x86_64-linux"
      "aarch64-linux"
      "x86_64-darwin"
      "aarch64-darwin"
    ];

    mkNixFormatter = {pkgs}:
      pkgs.writeShellApplication {
        name = "format";
        runtimeInputs = builtins.attrValues {
          inherit (pkgs) alejandra deadnix fd statix;
        };
        text = ''
          fd "$@" -t f -e nix -x statix fix -- '{}'
          fd "$@" -t f -e nix -X deadnix -e -- '{}'
          fd "$@" -t f -e nix -X alejandra '{}'
        '';
      };
  in {
    darwinConfigurations."nullifier" = let
      system = "aarch64-darwin";
    in
      nix-darwin.lib.darwinSystem {
        modules = [
          home-manager.darwinModules.home-manager
          {
            system.configurationRevision = self.rev or self.dirtyRev or null;
          }
          ./darwin
        ];
        specialArgs = {
          inherit inputs system;
          user = "vravi";
        };
        inherit system;
      };

    formatter = builtins.listToAttrs (
      map (sys: {
        name = sys;
        value = mkNixFormatter {pkgs = nixpkgs.legacyPackages.${sys};};
      })
      systems
    );
  };
}
