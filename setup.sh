#!/bin/bash

FillLine() {
    printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' =
}

PrintStep() {
    FillLine
    echo "$@"
    FillLine
}

HandleStepEnd() {
    FillLine
    read -r -p "Press Enter to continue: "
    clear
}

PrintStep "SETTING UP MAC........................."
HandleStepEnd

PrintStep "Deleting ~/.zshrc, ~/.zshenv, ~/.gitconfig, ~/.config/rde"
sudo rm -rf "${HOME}"/.zshrc "${HOME}"/.zshenv "${HOME}"/.gitconfig "${HOME}"/.config/rde

ls -al "${HOME}"/
ls -al "${HOME}"/.config/
HandleStepEnd

PrintStep "Installing nix"
curl -L https://nixos.org/nix/install | sh -s -- --daemon

export PATH=/nix/var/nix/profiles/default/bin/:${HOME}/.nix-profile/bin/:$PATH
HandleStepEnd

PrintStep "Installing home-manager"
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
nix-shell '<home-manager>' -A install
HandleStepEnd
