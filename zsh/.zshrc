#!/usr/bin/env zsh

# +------------------------------------+
# | ZSH Options                        |
# +------------------------------------+
setopt extended_glob
setopt COMBINING_CHARS

# +------------------------------------+
# | Brew ZSH Autocompletions           |
# +------------------------------------+
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  # autoload -Uz compinit
  # compinit
fi

# $ZSH defined in zsh/.zshenv
ZFUNCDIR=${ZFUNCDIR:-$ZSH/functions}
ZCOMPLETIONDIR=${ZCOMPLETIONDIR:-$ZSH/completions}
fpath=($ZFUNCDIR $ZCOMPLETIONDIR $fpath)
# autoload -Uz $fpath[1]/*(.:t)

# +------------------------------------+
# | Kubernetes Funnel Config           |
# +------------------------------------+
export KUBECONFIG="${HOME}/.kube/sso-staging-a-kubeconfig:$KUBECONFIG"
export KUBECONFIG="${HOME}/.kube/sso-production-b-kubeconfig:$KUBECONFIG"

# +------------------------------------+
# | Additional Completions             |
# +------------------------------------+
# ...go here

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
# autoload -Uz compinit && compinit
# Load compinit only when needed
autoload -U compinit && compinit

# Uncomment as needed
# # +------------------------------------+
# # | Go                                 |
# # +------------------------------------+
# if [ -x "$(command -v go)" ] && [ -d "$(go env GOPATH)/bin" ]; then
#     PATH="$(go env GOPATH)/bin:$PATH"
# fi

# +------------------------------------+
# | Bun                                |
# +------------------------------------+
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
[ -s "/Users/daniel.veremchuk/.bun/_bun" ] && source "/Users/daniel.veremchuk/.bun/_bun"


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
  eval "$(
    fnm env \
      --shell=zsh \
      --use-on-cd \
      --version-file-strategy=local \
      --corepack-enabled \
      --resolve-engines
  )"
fi