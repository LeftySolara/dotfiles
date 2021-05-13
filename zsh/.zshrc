# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# =============================================================================
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# =============================================================================
# Poetry completions. Must be placed before compinit.
fpath+=~/.zfunc

# =============================================================================
# The following lines were added by compinstall
zstyle :compinstall filename '~/.zshrc'
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
PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:$HOME/.local/bin:$PATH:$HOME/bin"
export PATH
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
alias xre='xrdb ~/.Xresources'  # reload .Xresources
alias wall='feh --bg-scale'     # set desktop wallpaper
alias gsql=compile_cpp_sql
alias down='sudo shutdown now'
alias tree='tree -C'
alias mk=new_dir
alias vedit='vim ~/.config/nvim/init.vim'
alias zedit='vim ~/.zshrc'
alias tick=tickle
alias pc='cat /dev/null > ~/.config/pianobar/nowplaying'
alias pianobar='pianobar; pc'
alias think='tickle +1d'
alias rest='systemctl suspend'
alias rmshit='python ~/bin/rmshit.py'
alias fetch='neofetch --w3m'
alias gst='git status'
alias gk='gitk &'
alias ga='git add'
alias key='keychain --eval --agents ssh id_rsa'
alias cm='cmake ../.. && make'
alias texclean='mkdir -p out; mv *.aux *.log *.pdf *.synctex.gz *.bcf *.xml out/'
#alias ncmpcpp='ncmpcpp-ueberzug'
alias tin='task +in'
alias tw='timew'
alias slideshow='feh -q -F -Y -z -r -D 15 .'
# =============================================================================

# =============================================================================
# Environment Variables

# Poetry stuff
export PATH="$HOME/.poetry/bin:$PATH"
# =============================================================================
