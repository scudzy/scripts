#!/usr/bin/env bash

run_install()
{
    ## Prompt the user
    read -p "Do you want to install missing packages? [Y/N]: " answer
    ## Set the default value if no answer was given
    answer=${answer:Y}
    ## If the answer matches y or Y, install
    [[ $answer =~ [Yy] ]] && sudo apt install ${packagesnames[@]}
}

packagesnames=("fzf" "tio" "neofetch" "zsh" "vim" "ffmpeg" "python3-pip" "vim-gtk" "tmux" "git" "curl" "htop" "shellcheck" "ripgrep" "pass" "dos2unix" "sysbench" "inxi" "fontconfig" "jq" "pwgen" "unzip" "rclone")

## Run the run_install function if sany of the libraries are missing
dpkg -s "${packagesnames[@]}" >/dev/null 2>&1 || run_install