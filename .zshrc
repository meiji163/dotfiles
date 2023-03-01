# If you come from bash you might have to change your $PATH.
export PATH="$HOME/bin:/usr/local/bin:$HOME/.config/emacs/bin:$PATH"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME=""


# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
zstyle ':omz:update' mode auto      # update automatically without asking
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
DISABLE_UNTRACKED_FILES_DIRTY="true"

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

# Install: 
# git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting.git
plugins=(zsh-autosuggestions zsh-syntax-highlighting)

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

# enable cd on ^G for nnn
nnn() {
  declare -x +g NNN_TMPFILE=$(mktemp --tmpdir $0.XXXX)
  trap "rm -f $NNN_TMPFILE" EXIT
  =nnn $@
  [ -s $NNN_TMPFILE ] && source $NNN_TMPFILE
}

alias em="emacsclient -t -a 'emacs'"
alias emg="emacsclient -c -n -a 'emacs'"

# ========== MAC OS ========
#
#export HOMEBREW_PREFIX="/Users/meiji163/homebrew";
#export HOMEBREW_CELLAR="/Users/meiji163/homebrew/Cellar";
#export HOMEBREW_REPOSITORY="/Users/meiji163/homebrew";
#export PATH="/Users/meiji163/homebrew/bin:/Users/meiji163/homebrew/sbin${PATH+:$PATH}";
#export MANPATH="/Users/meiji163/homebrew/share/man${MANPATH+:$MANPATH}:";
#export INFOPATH="/Users/meiji163/homebrew/share/info:${INFOPATH:-}";
# ==========================


# shell history
export HISTFILESIZE=1000000000
export HISTSIZE=1000000000
export HISTFILE=~/.cache/.zsh_history
export HISTTIMEFORMAT="[%F %T] "
setopt INC_APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_FIND_NO_DUPS

# pure shell
# Install: git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure"
fpath+=("$HOME/.zsh/pure")

autoload -U promptinit; promptinit
prompt pure

bindkey -v
bindkey ^R history-incremental-search-backward
bindkey ^S history-incremental-search-forward

#cli ghd
#export PATH="$HOME/Documents/cli/bin/ghd:$PATH"

#go
#export GOPATH=$HOME/go
#export GOROOT="$(brew --prefix golang)/libexec"
#export GOBIN=$GOPATH/bin
#export PATH=$PATH:$GOPATH/bin
#export PATH=$PATH:$GOROOT/bin
#export HISTTIMEFORMAT="%d/%m/%y %T "

export FZF_DEFAULT_OPTS="
--bind 'alt-c:clear-query'
--bind 'alt-u:first,alt-d:last'
--bind 'alt-r:refresh-preview'
--bind 'ctrl-w:preview-half-page-up,ctrl-s:preview-half-page-down'"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
#__conda_setup="$('/Users/meiji163/homebrew/Caskroom/miniforge/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
#if [ $? -eq 0 ]; then
#    eval "$__conda_setup"
#else
#    if [ -f "/Users/meiji163/homebrew/Caskroom/miniforge/base/etc/profile.d/conda.sh" ]; then
#        . "/Users/meiji163/homebrew/Caskroom/miniforge/base/etc/profile.d/conda.sh"
#    else
#        export PATH="/Users/meiji163/homebrew/Caskroom/miniforge/base/bin:$PATH"
#    fi
#fi
#unset __conda_setup
# <<< conda initialize <<<

[ -f "/Users/meiji163/.ghcup/env" ] && source "/Users/meiji163/.ghcup/env" # ghcup-env
