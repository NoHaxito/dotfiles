#!/usr/bin/env bash

source $HOME/.nix-profile/etc/profile.d/nix.sh

echo "[+] Downloading MesloLGL Nerd Font"
wget https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Meslo/L/Bold/MesloLGLNerdFont-Bold.ttf
mkdir ~/.fonts
cp ./MesloLGLNerdFont-Bold.ttf ~/.fonts/*
fc-cache -fv
echo "[!] Done!"

echo "[+] Downloading Neovim from Nix Packages"
nix-env -iA nixpkgs.neovim
echo "[!] Done!"

echo "[+] Downloading Bun"
curl -fsSL https://bun.sh/install | bash
source ~/.bashrc
echo "[!] Done"


current_dir="$(cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd)"
dotfiles_source="${current_dir}/gitpod-home-files"

while read -r file; do

    relative_file_path="${file#"${dotfiles_source}"/}"
    target_file="${HOME}/${relative_file_path}"
    target_dir="${target_file%/*}"

    if test ! -d "${target_dir}"; then
        mkdir -p "${target_dir}"
    fi

    printf '[+] Installing dotfiles symlink %s\n' "${target_file}"
    ln -sf "${file}" "${target_file}"

done < <(find "${dotfiles_source}" -type f)