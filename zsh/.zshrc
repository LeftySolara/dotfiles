# =============================================================================
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# =============================================================================

# =============================================================================
# The following lines were added by compinstall
zstyle :compinstall filename '/home/jalen/.zshrc'
autoload -Uz compinit
compinit
# End of lines added by compinstall
# =============================================================================

# =============================================================================
# Prompt configuration
autoload -U promptinit
promptinit
prompt walters
# =============================================================================

# =============================================================================
# Set path
PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:"
export PATH
# =============================================================================

# =============================================================================
# Functions

# because some programs do weird things when creating directories
normal_permissions() {
    chmod g=rx $1
    chmod o=rx $1
}

# compile for c++11
compile_cpp() {
    g++ -std=c++11 $1 -o $2
}

# compile foe c++11 with sqlite3 library
compile_cpp_sql() {
    g++ -std=c++11 $1 -lsqlite3 -o $2
}

# create a directory and then enter it
new_dir() {
    mkdir -p $1
    cd $1
}

# add tickler items to taskwarrior
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
alias xre='xrdb ~/.Xresources'  # reload .Xresources
alias wall='feh --bg-scale'     # set desktop wallpaper
alias perm=normal_permissions   # set "regular" permissions
alias g=compile_cpp             # compile in c++11 mode
alias gsql=compile_cpp_sql
alias down='sudo shutdown now'
alias tree='tree -C'
alias mk=new_dir
alias vedit='vim ~/.vimrc'
alias zedit='vim ~/.zshrc'
alias tick=tickle
alias think='tickle +1d'
alias rest="systemctl suspend"
# =============================================================================

# =============================================================================
# Environment Variables

# iBus stuff (for Japanese IME)
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus

# Powerline
export POWERLINE_DIR=/usr/lib/python3.4/site-packages/powerline
# =============================================================================
