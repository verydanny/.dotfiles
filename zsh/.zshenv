#!/usr/bin/env zsh

# +------------------------------------+
# | Environment Variables              |
# +------------------------------------+

# Basic exports
export TERM='rxvt-256color'
export DOTFILES="$HOME/.dotfiles"
export ZSH="$DOTFILES/zsh"
export WORKSPACE="$HOME/source"

# XDG - https://specifications.freedesktop.org/basedir-spec/latest/index.html
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
export XDG_DATA_HOME=${XDG_DATA_HOME:-$HOME/.local/share}
export XDG_STATE_HOME=${XDG_STATE_HOME:-$HOME/.local/state}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:-$HOME/.local/cache}

# ZSH
export ZDOTDIR=${ZDOTDIR:-$XDG_CONFIG_HOME/zsh}    # ZDOT Dir
export HISTFILE="$ZDOTDIR/.zhistory"               # History file location
export HISTSIZE=10000                              # Maximum events for internal history
export SAVEHIST=10000                              # Maximum events in history file

# Wezterm
export WEZTERM="$XDG_CONFIG_HOME/wezterm"
export WEZTERM_CONFIG_FILE=${WEZTERM_CONFIG_FILE:-$XDG_CONFIG_HOME/wezterm/wezterm.lua}

# Rio
export RIO="$XDG_CONFIG_HOME/rio"

# Alacritty
export ALACRITTY="$XDG_CONFIG_HOME/alacritty"

# You can use .zprofile to set environment vars for non-login, non-interactive shells.
if [[ ( "$SHLVL" -eq 1 && ! -o LOGIN ) && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi
