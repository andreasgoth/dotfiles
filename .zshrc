export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Add paths
export GOPATH=$HOME/go
export PATH=/usr/local/sbin:/usr/local/bin:$PATH
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="$GOPATH/bin:$PATH"

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
alias todo='rg "TODO|INCOMPLETE|HACK|XXX|TBD|FIXME|REVIEW|REFACTOR|REMOVE|BUG|DEBUG|BUG|NOTE" .'

# zsh completion smartcase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPS="--extended"
export FZF_DEFAULT_COMMAND='ag -t --hidden --ignore node_modules --ignore .git -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Ruby
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Python
export PATH="/Users/andreasgoth/Library/Python/2.7/bin:$PATH"

# start typing + [Up-Arrow] - fuzzy find history forward
if [[ "${terminfo[kcuu1]}" != "" ]]; then
  autoload -U up-line-or-beginning-search
  zle -N up-line-or-beginning-search
  bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search
  bindkey "^[[A" up-line-or-beginning-search # Up
  bindkey "^[[B" down-line-or-beginning-search # Down
fi

# start typing + [Down-Arrow] - fuzzy find history backward
if [[ "${terminfo[kcud1]}" != "" ]]; then
  autoload -U down-line-or-beginning-search
  zle -N down-line-or-beginning-search
  bindkey "${terminfo[kcud1]}" down-line-or-beginning-search
fi

bindkey '^[[1;5C' forward-word # [Ctrl-RightArrow] - move forward one word
bindkey '^[[1;5D' backward-word # [Ctrl-LeftArrow] - move backward one word

if [[ "${terminfo[kcbt]}" != "" ]]; then
  bindkey "${terminfo[kcbt]}" reverse-menu-complete   # [Shift-Tab] - move through the completion menu backwards
fi

