#!/usr/bin/env zsh
# +------------------------------------+
# | ZSH Options                        |
# +------------------------------------+
setopt extended_glob
setopt COMBINING_CHARS

# $ZSH defined in zsh/.zshenv
ZFUNCDIR=${ZFUNCDIR:-$ZSH/functions}
ZCOMPLETIONDIR=${ZFUNCDIR:-$ZSH/completions}

fpath=($ZFUNCDIR $ZCOMPLETIONDIR $fpath)
autoload -Uz $fpath[1]/*(.:t)

# +------------------------------------+
# | rust                               |
# +------------------------------------+
. "$HOME/.cargo/env"

# +------------------------------------+
# | fnm https://github.com/Schniz/fnm  |
# +------------------------------------+
FNM_PATH="$HOME/.local/share/fnm"
eval "$(fnm env \
  --use-on-cd \
  --shell zsh \
  --version-file-strategy recursive \
  --corepack-enabled \
  --resolve-engines \
)" # --fnm-dir $FNM_PATH)"

# +------------------------------------+
# | Compinit                           |
# +------------------------------------+
autoload -Uz compinit && compinit
