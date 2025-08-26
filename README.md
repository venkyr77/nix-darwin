# nix-darwin

```sh
bash -c "$(curl -fsSL https://raw.githubusercontent.com/venkyr77/nix-darwin/main/setup.sh)"
```

reboot, then run

```sh
sudo nix --experimental-features "nix-command flakes" run nix-darwin/master#darwin-rebuild -- switch --flake github:venkyr77/nix-darwin#nullifier
```

