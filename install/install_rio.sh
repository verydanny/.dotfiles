#!/usr/bin/env bash

# $RIO defined in zsh/.zshenv
mkdir -p $RIO/

ln -sf $DOTFILES/configs/rio/config.toml $RIO/config.toml
ln -sf $DOTFILES/configs/rio/themes $RIO/themes

# ln -sf $DOTFILES/i3/lock.png $I3_CONFIG
# ln -sf $DOTFILES/i3/config $I3_CONFIG
# ln -sf $DOTFILES/i3/scripts $I3_CONFIG

# if [[ $I3_STATUS_BAR == "small" ]]; then
#     ln -sf $DOTFILES/i3/i3status-small.conf $I3_CONFIG/i3status.conf
# else
#     ln -sf $DOTFILES/i3/i3status.conf $I3_CONFIG
# fi

