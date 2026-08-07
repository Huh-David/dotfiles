
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="amuse"

zstyle ':omz:update' mode auto      # update automatically without asking

# Docker CLI completions (must be on fpath before compinit)
fpath=(/Users/davidhuh/.docker/completions $fpath)

# fzf-tab must load after compinit, before the ZLE-wrapping plugins below
plugins=(
    git
    fzf-tab
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# fzf-tab configuration
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' menu no
zstyle ':completion:*:git-checkout:*' sort false
zstyle ':fzf-tab:*' switch-group '<' '>'
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'

# zsh-autosuggestions: inline ghost text from history (accept with Right arrow)
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'
bindkey '^ ' autosuggest-accept  # Ctrl+Space accepts the whole suggestion

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
fi


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

if [ "$(uname)" = "Darwin" ]; then
  export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
fi

# bun completions
[ -s "/Users/davidhuh/.bun/_bun" ] && source "/Users/davidhuh/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

if [ "$(uname)" = "Darwin" ]; then
    alias ls='eza'
else
    alias ls='exa'
fi

if [ "$(uname)" = "Darwin" ]; then
    alias cat='bat'
else
    alias cat='batcat'
fi

precmd () { echo -n "\x1b]1337;CurrentDir=$(pwd)\x07" }

# pnpm
export PNPM_HOME="/Users/davidhuh/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

eval "$(direnv hook zsh)"
