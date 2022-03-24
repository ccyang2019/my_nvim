#!/usr/bin/env bash
arch=''
# function
# check nvim is installed
is_nvim_install() {
    if ! command -v nvim >/dev/null 2>&1; then
        # echo "nvim is not installed ..."
        return 1
    else
        # echo "nvim is installed"
        return 0
    fi
}
install_nvim_amd64() {
    wget https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.deb
    # check user is root
    if [ "$(id -u)" == "0" ]; then
        apt install ./nvim-linux64.deb
    else
        sudo apt install ./nvim-linux64.deb
    fi
    rm ./nvim-linux64.deb
}
install_nvim_arm64() {
    tar xzvf ./bin/aarch64/nvim.tgz -C "${HOME}"/.local --strip-components=2
}

# main

if is_nvim_install; then
    echo "nvim is installed...skip it"
    exit 0
fi

case $(uname -m) in
    x86_64)
        arch=amd64
        install_nvim_amd64
        ;;
    i?86)
        arch=386
        ;;
    aarch64)
        arch=arm64
        install_nvim_arm64
        ;;
    *)
        echo "Unknown architecture: $(uname -m)"
        exit 1
        ;;
esac
echo "Done. Installed nvim for ${arch}"
