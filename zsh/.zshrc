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
autoload -Uz $fpath[1]/*(.:t)

# +------------------------------------+
# | Aliases                            |
# +------------------------------------+
source "$ZSH/.aliases"

# +------------------------------------+
# | Custom Prompt                      |
# +------------------------------------+
fpath=($ZSH/theme $fpath)
autoload -Uz custom_prompt; custom_prompt

# +------------------------------------+
# | rust                               |
# +------------------------------------+
. "$HOME/.cargo/env"

# +------------------------------------+
# | Compinit                           |
# +------------------------------------+
autoload -Uz compinit && compinit

