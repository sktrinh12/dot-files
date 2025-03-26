# If you come from bash you might have to change your $PATH.
export NODEJS_HOME=/usr/local/nodejs
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:/opt/nvim-linux64/bin:$NODEJS_HOME/bin:/opt/sqldeveloper/sqldeveloper/sqldeveloper/bin:$PATH
export FZF_DEFAULT_COMMAND='fdfind --hidden --no-ignore --strip-cwd-prefix --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fdfind --type=d --hidden --no-ignore --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_OPTS="
  --walker-skip .git,node_modules,target
  --preview 'batcat -n --color=always --line-range :500 {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"
export FZF_ALT_C_OPTS="
  --walker-skip .git,node_modules,target
  --preview 'eza --tree --color=always {} | head -200'"
export FZF_DEFAULT_OPTS='--border --info=inline --layout=reverse --height 60%'
export FZF_CTRL_R_OPTS="--bind 'ctrl-y:execute-silent(echo -n {2..} | xclip -selection clipboard)+abort'
  --color header:italic
  --header 'Press CTRL-Y to copy command into clipboard'"
export BAT_THEME="Catppuccin Mocha"

_fzf_compgen_path() {
  fdfind --hidden --follow --exclude ".git" . "$1"
}

_fzf_compgen_dir() {
  fdfind --type d --hidden --follow --exclude ".git" . "$1"
}

_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo \$'{}"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview 'batcat -n --color=always --line-range :500  {}' "$@" ;;
  esac
}

# Ensure that tmux doesn't change the TERM variable if it's already set correctly
# Set TERM to screen-256color if using tmux
if [[ -n "$TMUX" ]]; then
    export TERM="screen-256color"
fi
# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"
alias ..='cd ..'
alias cat='batcat'
alias vi='nvim'
alias cow='$HOME/Documents/scripts/dot-files/zsh_fx/cowsay-prompt.sh'
alias gp="git push origin main"
alias gco="git checkout ${1} ${2}"
alias gpl="git pull ${1} ${2}"
alias grb="git rebase ${1} ${2}"
alias gs="git status"
alias ga="git add ${1}"
alias gcc="git commit -m ${1}"
alias gc="git commit"
alias tf='terraform'
alias zs="source $HOME/.zshrc"
alias zz="vi $HOME/.zshrc"
alias teams="$HOME/Documents/scripts/teams.sh"
alias vpn="$HOME/Documents/scripts/remote_vpn.sh"
alias mvpn="$HOME/Documents/scripts/terraform/wireguard-ec2/config/main.sh"
alias check="$HOME/Documents/scripts/startup_curl.sh"
alias rf="$HOME/Documents/dot-files/zsh_fx/rg-fzf.sh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"
export EDITOR='nvim'
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

# Enable fzf key bindings and completion
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

autoload -Uz compinit dri drcv dstp sqlps ovpn wvpn nbk tlog

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  fzf-zsh-plugin
  zsh-syntax-highlighting 
)

source $ZSH/oh-my-zsh.sh

fpath=(~/zsh_fx "${fpath[@]}")
typeset -U PATH fpath

bindkey -v

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

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/spencer-trinh/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/spencer-trinh/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/spencer-trinh/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/spencer-trinh/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

alias ll="eza --color=always --long --git --icons=always --no-time --no-user --no-permissions"
alias la="eza --color=always --long --git --icons=always"

export PROMPT='%F{green}🐧 %F{blue}%~ %F{reset}%# '

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
