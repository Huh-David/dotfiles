# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="afowler"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

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

# zoxide (a smarter cd)
eval "$(zoxide init zsh)"
alias y='z'

# eza (maintained version of exa, a modern replacement for ls)
# if mac, use eza, else use exa
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

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"

# source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
if [ "$(uname)" = "Darwin" ]; then
  source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

LINE_LENGTH=35

# Function to print a formatted line
print_line() {
  local content="$1"
  local pipe="|"
  local padding_length=$(($LINE_LENGTH - ${#content}))  # Adjust the total line length as needed

  echo "| $content$(printf ' %.0s' $(seq 1 $padding_length)) $pipe"
}

# Function to print the header line
print_header() {
  local content="$1"
  local equal_signs=$(printf '=%.0s' $(seq 1 $(($LINE_LENGTH + 2))))  # Adjust the total line length as needed
  local padding_length=$(($LINE_LENGTH - ${#content} - 2))  # Adjust the total line length as needed

  echo "|$equal_signs|"

  if [ -n "$content" ]; then
    print_line "> $content"
  fi
}



    # Print out system information
if [ "$(uname)" = "Darwin" ]; then
    print_header "System Information"
    print_line "OS: $(uname)"
    print_line "Shell: $SHELL"
    print_line "ZSH version: $ZSH_VERSION"
    print_line "Username: $(whoami)"
    print_header "Hardware"
    print_line "CPU: $(sysctl -n machdep.cpu.brand_string)"
    print_line "Memory: $(sysctl -n hw.memsize)"
    print_line "Disk: $(df -h / | awk 'NR==2{print $4}')"
    print_line "Uptime: $(uptime | awk '{print $3,$4}' | sed 's/,//')"
    print_line "Battery: $(pmset -g batt | grep -Eo '\d+%' | cut -d% -f1)"
    print_header "Network"
    print_line "Hostname: $(hostname)"
    print_line "IP: $(ipconfig getifaddr en0)"
    print_header ""
else 
    print_header "System Information"
    print_line "OS: $(uname)"
    print_line "Shell: $SHELL"
    print_line "ZSH version: $ZSH_VERSION"
    print_line "Username: $(whoami)"
    print_header "Hardware"
    print_line "CPU: $(lscpu | grep 'Model name' | awk '{print $3,$4,$5,$6,$7,$8}')"
    print_line "Memory: $(free -h | awk 'NR==2{print $2}')"
    print_line "Disk: $(df -h / | awk 'NR==2{print $4}')"
    print_line "Uptime: $(uptime | awk '{print $3,$4}' | sed 's/,//')"
    print_header "Network"
    print_line "Hostname: $(hostname)"
    print_line "IP: $(hostname -I)"
    print_header ""
fi
