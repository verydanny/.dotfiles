#!/usr/bin/env zsh

# +------------------------------------+
# | ZSH Options                        |
# +------------------------------------+
setopt extended_glob
setopt COMBINING_CHARS

# $ZSH defined in zsh/.zshenv
ZFUNCDIR=${ZFUNCDIR:-$ZSH/functions}
ZCOMPLETIONDIR=${ZCOMPLETIONDIR:-$ZSH/completions}
fpath=($ZFUNCDIR $ZCOMPLETIONDIR $fpath)
# autoload -Uz $fpath[1]/*(.:t)

# +------------------------------------+
# | My Helpers                         |
# +------------------------------------+

# Chuck-based tools
source "$ZSH/helpers/dcr.sh"

# +------------------------------------+
# | Aliases                            |
# +------------------------------------+
source "$ZSH/.aliases"

# +------------------------------------+
# | Custom Prompt                      |
# +------------------------------------+
# fpath=($ZSH/theme $fpath)
# autoload -Uz custom_prompt; custom_prompt
source "$ZSH/theme/custom_prompt"

# +------------------------------------+
# | Compinit                           |
# +------------------------------------+
autoload -Uz compinit && compinit

# +------------------------------------+
# | rust                               |
# +------------------------------------+
source "$HOME/.cargo/env"

# Uncomment as needed
# # +------------------------------------+
# # | SDKMAN!                            |
# # +------------------------------------+
# export SDKMAN_DIR="$HOME/.sdkman"
# [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# +------------------------------------+
# | fnm https://github.com/Schniz/fnm  |
# +------------------------------------+
FNM_PATH="$HOME/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  eval "`fnm env \
    --shell=zsh \
    --use-on-cd \
    --version-file-strategy=local \
    --corepack-enabled \
    --resolve-engines \
  `"
fi
