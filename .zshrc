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

# Settings
setopt EXTENDED_HISTORY   # Add timestamps to history
setopt INC_APPEND_HISTORY # Add timestamps to history

# Initialize completion
autoload -Uz compinit
if [ $(date +'%j') != $(/usr/bin/stat -f '%Sm' -t '%j' ${ZDOTDIR:-$HOME}/.zcompdump) ]; then
  compinit
else
  compinit -C
fi
zstyle ':completion:*' menu select

# Execute code in the background to not affect the current session
{
  # Compile zcompdump, if modified, to increase startup speed.
  zcompdump="${ZDOTDIR:-$HOME}/.zcompdump"
  if [[ -s "$zcompdump" && (! -s "${zcompdump}.zwc" || "$zcompdump" -nt "${zcompdump}.zwc") ]]; then
    zcompile "$zcompdump"
  fi
}

# Colorize terminal
alias l='ls -lAFhG'
export GREP_OPTIONS="--color"

# Nicer history
export HISTSIZE=100000
export HISTFILE="$HOME/.zsh_history"
export SAVEHIST=$HISTSIZE

# Use nvim as the editor
export EDITOR=nvim

# Aliases
function mkcd() { mkdir -p $1 && cd $1 }
alias lock="osascript -e 'tell application \"System Events\" to keystroke \"q\" using {command down,control down}'"
alias noFileVaultNextReboot='sudo fdesetup authrestart -delayminutes -1'

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
alias repo='cd ~/Documents/repos'
alias repos='cd ~/Documents/repos'
alias nvimcfg='nvim ~/.config/nvim/init.vim'
alias nvimcolors='nvim ~/.config/nvim/colors/andreasgoth.vim'
alias zshrc='nvim ~/.zshrc'
alias hosts='sudo nvim /etc/hosts'
alias todo='rg "TODO|INCOMPLETE|HACK|XXX|TBD|FIXME|REVIEW|REFACTOR|REMOVE|BUG|DEBUG|BUG|NOTE" .'

# zsh completion smartcase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPS="--extended"
#export FZF_DEFAULT_COMMAND='rg -t --hidden --ignore node_modules --ignore .git -g ""'
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Ruby
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Start typing + [Up-Arrow] - fuzzy find history forward
if [[ "${terminfo[kcuu1]}" != "" ]]; then
  autoload -U up-line-or-beginning-search
  zle -N up-line-or-beginning-search
  bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search
  bindkey "^[[A" up-line-or-beginning-search # Up
  bindkey "^[[B" down-line-or-beginning-search # Down
fi

# Start typing + [Down-Arrow] - fuzzy find history backward
if [[ "${terminfo[kcud1]}" != "" ]]; then
  autoload -U down-line-or-beginning-search
  zle -N down-line-or-beginning-search
  bindkey "${terminfo[kcud1]}" down-line-or-beginning-search
fi

bindkey '^[[1;5C' forward-word # [Ctrl-RightArrow] - move forward one word
bindkey '^[[1;5D' backward-word # [Ctrl-LeftArrow] - move backward one word

if [[ "${terminfo[kcbt]}" != "" ]]; then
  # [Shift-Tab] - move through the completion menu backwards
  bindkey "${terminfo[kcbt]}" reverse-menu-complete
fi

export PATH="/usr/local/opt/sqlite/bin:$PATH"
