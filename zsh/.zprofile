#!/usr/bin/env zsh

# +------------------------------------+
# | Use Brew Curl                      |
# +------------------------------------+
export PATH="/opt/homebrew/opt/curl/bin:$PATH"

# +------------------------------------+
# | Browser                            |
# +------------------------------------+
if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER="${BROWSER:-open}"
fi

# +------------------------------------+
# | Editors                            |
# +------------------------------------+
CURRENT_EDITOR="cursor"
export EDITOR="${EDITOR:-$CURRENT_EDITOR} -w"
export VISUAL="${VISUAL:-$CURRENT_EDITOR} -w"
export PAGER="${PAGER:-less}"

# +------------------------------------+
# | Homebrew                           |
# +------------------------------------+
# export HOMEBREW_BREW_GIT_REMOTE="https://github.com/Homebrew/brew.git"
# export HOMEBREW_CORE_GIT_REMOTE="https://github.com/Homebrew/homebrew-core.git"

# # Use Asian mirrors (use in Korea)
# export HOMEBREW_API_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles/api"
# export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles"

# Homebrew initialization
export HOMEBREW_PREFIX="/opt/homebrew";
export HOMEBREW_CELLAR="/opt/homebrew/Cellar";
export HOMEBREW_REPOSITORY="/opt/homebrew";
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin${PATH+:$PATH}";
export MANPATH="/opt/homebrew/share/man${MANPATH+:$MANPATH}:";
export INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}";

# Not convinced we need this
# +------------------------------------+
# | Path setup                         |
# +------------------------------------+
# typeset -gU path fpath
# path=(
#   $HOME/{,s}bin(N)
#   /opt/{homebrew,local}/{,s}bin(N)
#   /usr/local/{,s}bin(N)
#   $path
# )

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init.zsh 2>/dev/null || :

# Created by `pipx` on 2024-12-16 16:06:47
export PATH="$PATH:/Users/daniel.veremchuk/.local/bin"
