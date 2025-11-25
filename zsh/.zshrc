# Kiro CLI pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.pre.zsh"
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="afowler"

zstyle ':omz:update' mode auto      # update automatically without asking

plugins=(
    git
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

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

[[ -f "$HOME/fig-export/dotfiles/dotfile.zsh" ]] && builtin source "$HOME/fig-export/dotfiles/dotfile.zsh"

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

# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/davidhuh/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions

# pnpm
export PNPM_HOME="/Users/davidhuh/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# Added by Antigravity
export PATH="/Users/davidhuh/.antigravity/antigravity/bin:$PATH"

# Kiro CLI post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.post.zsh"
