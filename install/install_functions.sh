#!/usr/bin/env bash

HAS_XCODE=$(xcode-select -p 1>/dev/null 2>&1 && echo 1 || echo 0)
HAS_HOMEBREW=$(library_exists && echo 1 || echo 0)

function library_exists() {
  command -v $1 >/dev/null
}

function dot_mes_red() {
  echo -e "${red} ${1}"
}

function dot_mes() {
  echo -e "${1} ${2}"
}

function dot_mes_install() {
  dot_mes ${green} "--> Installing ${1}"
}

function dot_mes_update() {
  dot_mes ${yellow} "--> Updating ${1}"
}

function dot_mes_warn() {
  echo -e "${red}/!\  ${1} /!\ "
}

function dot_install() {
    echo -e "${blue}-> Installing ${yellow}${1} ${blue}config"
    . "$DOTFILES/install/install_${1}.sh"
}

function dot_install_func() {
  echo -e "${blue}-> Installing ${yellow}${1} ${blue}config"
  . $DOTFILES/install/install_${1}.sh
  ${2}
}

function dot_sub_install() {
  echo -e "${green}--> Installing ${1}"
}

function install_library() {
  echo -e "${light_cyan}--> Installing ${1}${default}"
  local output=$(brew install $1 2>&1)
  local exit_status=$?

  # echo for debug
  # echo "$output"
  # echo "$exit_status"

  if echo "$output" | grep -q -w "is already installed and up-to-date"; then
    echo -e "${green}--> Already installed ${1}.${default}"
  elif [ "$exit_status" == 0 ]; then
    echo -e "${green}--> Successfully installed ${1}.${default}"
  fi
}

# Install patched fonts
function install_fonts() {
  local FONT_DIR="$DOTFILES/fonts"
  local MACOS_FONT_DIR="$HOME/Library/Fonts"
  local fonts_installed=0

  for font in "$FONT_DIR"/*.ttf; do
    if [[ -f "$font" ]]; then
      # Extract filename from font
      font_name=$(basename "$font")

      #Check if font is successfully installed in directory
      if [[ ! -f "$MACOS_FONT_DIR/$font_name" ]]; then
        cp "$font" "$MACOS_FONT_DIR/"
        echo -e "${green}-->$font_name installed succesfully.${default}"
      elif [[ -f "$MACOS_FONT_DIR/$font_name" ]]; then
        fonts_installed=$((fonts_installed + 1))
      fi
    fi
  done

  if [ $fonts_installed -gt 1 ]; then
    echo -e "${green}--> $fonts_installed fonts installed successfully.${default}"
  fi
}

# Install Xcode Command-Line Tools
function install_xcode() {
  if [ ! "$HAS_XCODE" ]; then
    echo -e "${yellow}Xcode Command Line Tools are not installed.${default}"
    read -p "${yellow}Do you want to install them now? (y/n) ${default}" choice
    if [ "$choice" == "y" ] || [ "$choice" == "Y" ]; then
      xcode-select --install
      echo -e "${yellow}--> Please follow the installation instructions.${default}"
    else
      echo  -e "${red}--> Xcode Command Line Tools are required for this script to work.${default}"
    fi
  else
    echo -e "${green}--> Xcode Command Line Tools are installed.${default}"
  fi
}

# Install Homebrew
function install_homebrew() {
  if [ ! "$HAS_HOMEBREW" ]; then
    echo -e "${light_cyan}--> Installing Homebrew...${default}"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  else
    echo -e "${green}--> Homebrew is already installed.${default}"
  fi
}

function install_zsh_configs() {
  local ZFUNCDIR=${ZFUNCDIR:-$ZDOTDIR/functions}
  echo -e "${green}--> Creating ZSH symlinks"

  echo -e "${green}--> Making $ZDOTDIR recursively"
  mkdir -p "$ZDOTDIR"
  mkdir -p "$ZFUNCDIR"

  echo -e "${green}--> Creating '.zshenv, .zshrc, .zprofile' symlinks"
  ln -sf "$DOTFILES/zsh/.zshenv" "$HOME/.zshenv"
  ln -sf "$DOTFILES/zsh/.zshrc" "$ZDOTDIR/.zshrc"
  ln -sf "$DOTFILES/zsh/.zprofile" "$ZDOTDIR/.zprofile"

  echo -e "${green}--> Creating 'dircolors' symlinks"
  ln -sf "$DOTFILES/zsh/dircolors" "$ZDOTDIR/dircolors"
}
