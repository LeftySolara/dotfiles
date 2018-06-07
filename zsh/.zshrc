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
PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/home/jalen/.cargo/bin:$HOME/.local/bin:$PATH"
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

# compile .cpp files in C++17 mode
compile_cpp17() {
    g++ -std=c++17 $1 -o $2
}

# create a new directory and then enter it
new_dir() {
    mkdir -p $1
    cd $1
}

# generate a new colorscheme with pywal and set the wallpaper in scale mode
wal-scale() {
    wal -n -i "$@"
    feh --bg-scale "$(< "${HOME}/.cache/wal/wal")"
}
# =============================================================================

# =============================================================================
# Aliases
alias cm='cmake ../.. && make'
alias down='sudo shutdown now'
alias fetch='neofetch --w3m'
alias g=compile_cpp17
alias gk='gitk &'
alias gst='git status'
alias in='task add +in'
alias ls='ls --color=auto'
alias mk=new_dir
alias pc='cat /dev/null > ~/.config/pianobar/nowplaying'
alias pg='pacgraph -f graph && feh graph.png'
alias pianobar='pianobar; pc'
alias pwall=wal-scale
alias rest='systemctl suspend && lock'
alias rmshit='python ~/bin/rmshit.py'
alias tree='tree -C'
alias vedit='vim ~/.vimrc'
alias wall='feh --bg-scale'     # set desktop wallpaper
alias xre='xrdb ~/.Xresources'  # reload .Xresources
alias zedit='vim ~/.zshrc'
# =============================================================================

# =============================================================================
# Environment Variables
export AUDIODEV=hw:0,0
export CFLAGS='-g -Wall -O3'
export EDITOR=vim
export GDK_SCALE=1
export GTK_IM_MODULE=ibus
export PROJECT_HOME=~/dev/proj
export QT_AUTO_SCREEN_SCALE_FACTOR=1
export QT_IM_MODULE=ibus
export QT_STYLE_OVERRIDE=GTK+
export RANGER_LOAD_DEFAULT_RC=FALSE
export SDL_AUDIODRIVER=alsa
export VENV_HOME=~/venvs
export XMODIFIERS=@im=ibus
