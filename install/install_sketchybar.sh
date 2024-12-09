#!/usr/bin/env bash

# $RIO defined in zsh/.zshenv
mkdir -p "$SKETCHYBAR/"

ln -sf "$DOTFILES/configs/sketchybar/sketchybarrc" "$SKETCHYBAR/sketchybarrc"
ln -sf "$DOTFILES/configs/sketchybar/plugins" "$SKETCHYBAR"
