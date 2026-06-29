# Kitty related stuff
if [[ $TERM == "xterm-kitty" ]]; then
	alias ssh="TERM=xterm ssh"
	alias icat="kitty +kitten icat"
fi

# Enable extended glob
# eg. ls !(home)
setopt kshglob
setopt nobareglobqual

alias ls='ls --color=tty'
alias zshconfig="vim ~/.zshrc"
alias vimconfig="vim ~/.vim/vimrc"
alias rgf="rg --files | rg"
alias ducks="du -cksh * | sort -h"
alias clipboard="xclip -sel clip" # Pipe stuff to the clipboard. eg. "ls | clipboard"
alias bwu='export BW_SESSION=$(bw unlock --raw) && bw sync && bw status'
alias gits='git status'
alias gitd='git diff'
alias gitdc='git diff --cached'

# Unbind some ZSH defaults
bindkey -r "^J" # ctrl + j == accept-line

# Fix ctrl+arrow keys
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word

# Enable command history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

# Use neovim instead of vim if installed
export EDITOR=vim
if which nvim &> /dev/null; then
  alias vim=nvim
  export EDITOR=/bin/nvim
fi

  # Load FZF
if [ -f ~/.fzf.zsh ]; then
  source ~/.fzf.zsh
fi

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Better tab autocomplete UI
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

git_info() {
  local branch dirty color
  branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null) || return
  if [[ -n $(git status --porcelain 2>/dev/null) ]]; then
    color="yellow"
  else
    color="green"
  fi

  echo "%F{$color}git:(${branch})%f ❯ "
}
source /usr/share/git/git-prompt.sh
GIT_PS1_SHOWCOLORHINTS="yes"
GIT_PS1_SHOWDIRTYSTATE="yes"
setopt prompt_subst
PROMPT='%K{green}%F{black} %n@%m %f%k%F{green}%k%f%K{blue}%F{white} %~ %f%k%F{blue}%k%f $(git_info)'

