#!/usr/bin/env bash

# $WEZTERM defined in zsh/.zshenv
mkdir -p $WEZTERM/

ln -sf $DOTFILES/configs/wezterm/wezterm.lua $WEZTERM

# ln -sf $DOTFILES/i3/lock.png $I3_CONFIG
# ln -sf $DOTFILES/i3/config $I3_CONFIG
# ln -sf $DOTFILES/i3/scripts $I3_CONFIG

# if [[ $I3_STATUS_BAR == "small" ]]; then
#     ln -sf $DOTFILES/i3/i3status-small.conf $I3_CONFIG/i3status.conf
# else
#     ln -sf $DOTFILES/i3/i3status.conf $I3_CONFIG
# fi

