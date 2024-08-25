#!/usr/bin/env bash

# $ALACRITTY defined in zsh/.zshenv
mkdir -p $ALACRITTY/

ln -sf $DOTFILES/configs/alacritty/alacritty.toml $ALACRITTY/alacritty.toml
