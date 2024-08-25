#!/usr/bin/env bash

# $WEZTERM defined in zsh/.zshenv
mkdir -p $WEZTERM/

ln -sf $DOTFILES/configs/wezterm/wezterm.lua $WEZTERM
