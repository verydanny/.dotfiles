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
export EDITOR="${EDITOR:-$CURRENT_EDITOR}"
export VISUAL="${VISUAL:-$CURRENT_EDITOR}"
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
# | Path setup                         |
# +------------------------------------+
typeset -gU path fpath
path=(
  $HOME/{,s}bin(N)
  /opt/{homebrew,local}/{,s}bin(N)
  /usr/local/{,s}bin(N)
  $path
)
