HISTFILE=~/.histfile
HISTSIZE=500
SAVEHIST=500
unsetopt beep
bindkey -v

source virtualenvwrapper.sh
# =============================================================================

# =============================================================================
# Compinstall
zstyle :compinstall filename '/home/jalen/.zshrc'
autoload -Uz compinit
compinit
# =============================================================================

# =============================================================================
# Prompt configuration
autoload -U promptinit
promptinit
prompt walters
# =============================================================================

# =============================================================================
# Path
PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:$PATH"
export PATH
# =============================================================================

# =============================================================================
# Coala Configuration
  autoload bashcompinit
  bashcompinit
  eval "$(register-python-argcomplete `which coala`)"
# =============================================================================

# =============================================================================
# Functions

# compile .cpp files in C++11 mode
compile_cpp11() {
    g++ -std=c++11 $1 -o $2
}

# create a new directory and then enter it
new_dir() {
    mkdir -p $1
    cd $1
}
# =============================================================================

# =============================================================================
# Aliases
alias ls='ls --color=auto'
alias tree='tree -C'
alias xre='xrdb ~/.Xresources'	# reload .Xresources
alias wall='feh --bg-scale'	# set desktop wallpaper
alias g=compile_cpp11
alias gGL='g++ -std=c++11 -lGL -lglut -lGLU -lGLEW'
alias mk=new_dir
alias down='sudo shutdown now'
alias rest='systemctl suspend && lock'
alias vedit='vim ~/.vimrc'
alias zedit='vim ~/.zshrc'
alias perm='chmod 755'
alias pc='cat /dev/null > ~/.config/pianobar/nowplaying'
alias pianobar='pianobar; pc'
alias gst='git status'
alias gk='gitk &'
alias fetch='neofetch'
alias rmshit='python ~/bin/rmshit.py'
alias pg='pacgraph -f graph && feh graph.png'

# Taskwarrior Aliases
alias in='task add +in'
# =============================================================================

# =============================================================================
# Environment Variables
export EDITOR=vim
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus
export QT_STYLE_OVERRIDE=GTK+
export SDL_AUDIODRIVER=alsa
export AUDIODEV=hw:0,0
export VENV_HOME=~/venvs
export PROJECT_HOME=~/projects
export RANGER_LOAD_DEFAULT_RC=FALSE

export rvm_ignore_gemrc_issues=1
export PATH="$PATH:$HOME/.rvm/bin:$HOME/.gem/ruby/2.3.0/bin" # Add RVM to PATH for scripting
export PATH="/usr/local/heroku/bin:$PATH"
