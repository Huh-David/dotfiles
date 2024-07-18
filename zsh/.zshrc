[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh"
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="afowler"
# ZSH_TMUX_AUTOSTART=true


zstyle ':omz:update' mode auto      # update automatically without asking

# HIST_STAMPS="dd.mm.yyyy"

plugins=(
    git
    zsh-syntax-highlighting
    tmux
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
# else
#   export EDITOR='mvim'
fi


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Load Angular CLI autocompletion.
source <(ng completion script)

# if [ "$(uname)" == "Darwin" ]; then  //  replace with uname === "Darwin"
if [ "$(uname)" = "Darwin" ]; then
  export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
fi

# bun completions
[ -s "/Users/davidhuh/.bun/_bun" ] && source "/Users/davidhuh/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

if [ "$(uname)" = "Darwin" ]; then
  source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

[[ -f "$HOME/fig-export/dotfiles/dotfile.zsh" ]] && builtin source "$HOME/fig-export/dotfiles/dotfile.zsh"

# zoxide (a smarter cd)
eval "$(zoxide init zsh)"
alias y='z'

# eza (maintained version of exa, a modern replacement for ls)

if [ "$(uname)" = "Darwin" ]; then
    alias ls='eza -lh'
else
    alias ls='exa -lh'
fi

# bat (a cat clone with wings)
if [ "$(uname)" = "Darwin" ]; then
    alias cat='bat'
else 
    alias cat='batcat'
fi

precmd () { echo -n "\x1b]1337;CurrentDir=$(pwd)\x07" }

if [ "$(uname)" = "Darwin" ]; then
    [[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh"
fi

