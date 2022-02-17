export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="simple_gruvbox"

plugins=(git)
source $ZSH/oh-my-zsh.sh

NPM_PACKAGES="$HOME/.npm_packages"

export PATH="$PATH:$NPM_PACKAGES/bin"
export PATH="$PATH:~/.local/bin"

export MANPATH="${MANPATH-$(manpath)}:$NPM_PACKAGES/share/man"

alias vim=nvim
LS_COLORS="$(vivid generate gruvbox)"

