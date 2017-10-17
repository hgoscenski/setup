# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/hgoscenski/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="robbyrussell"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git osx brew)

source $ZSH/oh-my-zsh.sh

# User configuration

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

if [ "$TERM_PROGRAM" = "Hyper" ]; then
	ZSH_THEME="hyperzsh"
else
	autoload -U colors && colors
	export TERM=xterm-256color
	[ -n "$TMUX" ] && export TERM=screen-256color
	PROMPT="%F{blue}%n%f@%F{blue}%m%f:%F{cyan}%~%f
%F{blue}λ%f "
	# PROMPT="%F{blue}%n%f@%F{blue}%m%f:%F{cyan}%~%f%F{blue}λ%f "
	export CLICOLOR=1
fi

#alias for starting/stopping postgresql server
alias startPsql='pg_ctl -D /usr/local/var/postgres start'
alias stopPsql='pg_ctl -D /usr/local/var/postgres stop'	
alias tmux='tmux -2'

alias hideIcons='defaults write com.apple.dock static-only -bool TRUE; killall Dock'
alias showIcons='defaults write com.apple.dock static-only -bool FALSE; killall Dock'

alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES;
killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO;
killall Finder /System/Library/CoreServices/Finder.app'
	
# sourcing zsh-syntax-highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#Changes the export directory for Homebrew.
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

#Sets the path
PATH=/sbin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin
# export GOPATH = /Users/hgoscenski/.go
GOPATH=/Users/hgoscenski/go 

export ANDROID_HOME=/Users/$USER/Library/Android/sdk
export PATH=${PATH}:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
