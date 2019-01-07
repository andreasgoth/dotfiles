export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Add paths
export PATH=/usr/local/sbin:/usr/local/bin:$PATH
export PATH=/usr/local/lib/ruby/gems/2.5.0/bin:$PATH

# Set custom prompt
setopt PROMPT_SUBST
autoload -Uz promptinit
promptinit
prompt andreasgoth 

# Initialize completion
autoload -Uz compinit
compinit -D
zstyle ':completion:*' menu select

# Colorize terminal
alias l='ls -lAFhG'
export GREP_OPTIONS="--color"

# Nicer history
export HISTSIZE=100000
export HISTFILE="$HOME/.zsh_history"
export SAVEHIST=$HISTSIZE

# Use vim as the editor
export EDITOR=vim

# Aliases
function mkcd() { mkdir -p $1 && cd $1 }

# Set Apple Terminal.app resume directory
# Makes new tab/window open in same working directory work
if [[ $TERM_PROGRAM == "Apple_Terminal" ]] && [[ -z "$INSIDE_EMACS" ]] {
  function chpwd {
    local SEARCH=' '
    local REPLACE='%20'
    local PWD_URL="file://$HOSTNAME${PWD//$SEARCH/$REPLACE}"
    printf '\e]7;%s\a' "$PWD_URL"
  }
  chpwd
}

# Directories
alias repo='cd ~/repos'
alias repos='cd ~/repos'
alias lr='cd ~/repos/fsm/livereplayer'
alias lrweb='cd ~/repos/fsm/livereplayer/webapp'
alias fsmapp='cd ~/repos/fsm/app'
alias nvimcfg='nvim ~/.config/nvim/init.vim'
alias nvimcolors='nvim ~/.config/nvim/colors/andreasgoth.vim'
alias zshrc='nvim ~/.zshrc'
alias hosts='sudo nvim /etc/hosts'

# zsh completion smartcase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPS="--extended"

