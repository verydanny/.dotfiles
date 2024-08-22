#!/usr/bin/env bash

# +------------------------------------+
# | Includes                           |
# +------------------------------------+
source ./colors.sh
source ./zsh/.zshenv
source ./install/install_functions.sh

# +------------------------------------+
# | Presentation                       |
# +------------------------------------+
echo -e "
${cyan}
          _ ._  _ , _ ._
        (_ ' ( \`  )_  .__)
      ( (  (    )   \`)  ) _)
     (__ (_   (_ . _) _) ,__)
           ~~\ ' . /~~
         ,::: ;   ; :::,
        ':::::::::::::::'
 ____________/_ __ \____________
|                               |
| Welcome to Daniil's dotfiles~ |
|_______________________________|
"

if [ $# -ne 1 ] || [ "$1" != "-y" ];
    then
        echo -e "${yellow}Press Enter key to continue...\n"
        read key;
fi

# +------------------------------------+
# | Install                            |
# +------------------------------------+
echo -e "${green}Wahoo installing..."

# +------------------------------------+
# | Basics Install                     |
# +------------------------------------+
# install_fonts          # install/install_functions.sh:62
# install_xcode          # install/install_functions.sh:88
# install_homebrew       # install/install_functions.sh:104
# install_library zsh    # install/install_functions.sh:45
# install_zsh_configs    # install/install_functions.sh:113

# +------------------------------------+
# | Libraries Install                  |
# +------------------------------------+
library_exists wezterm && dot_install wezterm    # install/install_wezterm
library_exists rio && dot_install rio            # install/install_rio