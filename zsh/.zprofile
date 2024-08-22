#!/usr/bin/env zsh

# +------------------------------------+
# | Browser                            |
# +------------------------------------+
if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER="${BROWSER:-open}"
fi

# +------------------------------------+
# | Editors                            |
# +------------------------------------+
CURRENT_EDITOR="code-insiders"
export EDITOR="${EDITOR:-$CURRENT_EDITOR} -w"
export VISUAL="${VISUAL:-$CURRENT_EDITOR} -w"
export PAGER="${PAGER:-less}"

# +------------------------------------+
# | Homebrew                           |
# +------------------------------------+
export HOMEBREW_PREFIX="/opt/homebrew";
export HOMEBREW_CELLAR="/opt/homebrew/Cellar";
export HOMEBREW_REPOSITORY="/opt/homebrew";
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin${PATH+:$PATH}";
export MANPATH="/opt/homebrew/share/man${MANPATH+:$MANPATH}:";
export INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}";

# +------------------------------------+
# | fnm https://github.com/Schniz/fnm  |
# +------------------------------------+
# fnm
FNM_PATH="$HOME/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$HOME/.local/share/fnm:$PATH"
  eval "`fnm env \
    --shell=zsh \
    --use-on-cd \
    --version-file-strategy=recursive \
    --corepack-enabled \
    --resolve-engines \
  `"
fi

# +------------------------------------+
# | Path setup                         |
# +------------------------------------+
typeset -gU path fpath
path=(
  $HOME/{,s}bin(N)
  /opt/{homebrew,local}/{,s}bin(N)
  /usr/local/{,s}bin(N)
  $path
)
