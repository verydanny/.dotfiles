#!/usr/bin/env bash

# $RIO defined in zsh/.zshenv
mkdir -p $RIO/

ln -sf $DOTFILES/configs/rio/config.toml $RIO/config.toml
ln -sf $DOTFILES/configs/rio/themes $RIO
