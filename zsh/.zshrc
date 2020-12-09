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
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# =============================================================================

# =============================================================================
# Set path
PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:$HOME/.local/bin:$PATH"
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

# compile for c++17
compile_cpp() {
    g++ -std=c++17 $1 -o $2
}

# compile for c++17 with sqlite3 library
compile_cpp_sql() {
    g++ -std=c++17 $1 -lsqlite3 -o $2
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
alias lsh='ls -lSh | less'
alias xre='xrdb ~/.Xresources'  # reload .Xresources
alias wall='feh --bg-scale'     # set desktop wallpaper
alias perm='chmod 755'          # set default permissions
alias g=compile_cpp             # compile in c++11 mode
alias gsql=compile_cpp_sql
alias down='sudo shutdown now'
alias tree='tree -C'
alias mk=new_dir
alias vedit='nvim ~/.config/nvim/init.vim'
alias zedit='nvim ~/.zshrc'
alias tick=tickle
alias pc='cat /dev/null > ~/.config/pianobar/nowplaying'
alias pianobar='pianobar; pc'
alias think='tickle +1d'
alias rest='systemctl suspend && lock'
alias rmshit='python ~/bin/rmshit.py'
alias rbackup='rsync -aAv --progress --numeric-ids --exclude={"/dev/*","/proc/*","/sys/*","/tmp/*","/run/*","/mnt/*","/lost+found"} -e "ssh -p 32719" / jalen@vault-53:/srv/backup/vault-101'
alias fetch='neofetch --w3m'
alias gst='git status'
alias gk='gitk &'
alias ga='git add'
alias key='keychain --eval --agents ssh id_rsa'
alias cm='cmake ../.. && make'
alias texclean='mkdir -p out; mv *.aux *.log *.pdf *.synctex.gz *.bcf *.xml out/'
alias ncmpcpp='ncmpcpp-ueberzug'
alias psh='pipenv shell'
# =============================================================================

# =============================================================================
# Environment Variables

# virtualenv
export VENV_HOME=~/venvs
export PROJECT_HOME=~/proj

# iBus stuff for Japanese IME
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus

export QT_STYLE_OVERRIDE=GTK+
export QT_QPA_PLATFORMTHEME="qt5ct-style"

# Powerline
#export POWERLINE_DIR=/usr/lib/python3.4/site-packages/powerline

# Ruby stuff
export rvm_ignore_gemrc_issues=1
export PATH="$PATH:$HOME/.rvm/bin:$HOME/.gem/ruby/2.5.0/bin" # Add RVM to PATH for scripting
export PATH="/usr/local/heroku/bin:$PATH"

# Rust stuff
source ~/.cargo/env
# =============================================================================
