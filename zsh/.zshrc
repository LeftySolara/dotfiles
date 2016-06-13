HISTFILE=~/.histfile
HISTSIZE=500
SAVEHIST=500
unsetopt beep
bindkey -v
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

# add tasks to tickler folder in Taskwarrior
alias in='task add +in'
tickle() {
    deadline=$1
    shift
    in +tickle wait:$deadline $@
}
# =============================================================================

# =============================================================================
# Aliases
alias ls='ls --color=auto'
alias tree='tree -C'
alias xre='xrdb ~/.Xresources'	# reload .Xresources
alias wall='feh --bg-scale'	    # set desktop wallpaper
alias g=compile_cpp11
alias gGL='g++ -std=c++11 -lGL -lglut -lGLU -lGLEW'
alias mk=new_dir
alias down='sudo shutdown now'
alias rest='systemctl suspend && lock'
alias vedit='vim ~/.vimrc'
alias zedit='vim ~/.zshrc'
alias perm='chmod 755'
alias tick=tickle
alias think='tickle +1d'
alias pc='cat /dev/null > ~/.config/pianobar/nowplaying'
alias pianobar='pianobar; pc'
alias steam='env SDL_AUDIODRIVER=alsa AUDIODEV=hw:0,0 steam'
alias tasks='task'
alias rbackup='rsync -aAXv --progress --exclude={"/dev/*","/proc/*","/sys/*","/tmp/*","/run/*","/mnt/*","/media/*","/lost+found"} -e ssh / jalen@vault-53:/srv/backup/xps13'
alias gst='git status'
alias gk='gitk'
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

export rvm_ignore_gemrc_issues=1
export PATH="$PATH:$HOME/.rvm/bin:$HOME/.gem/ruby/2.3.0/bin" # Add RVM to PATH for scripting
export PATH="/usr/local/heroku/bin:$PATH"
