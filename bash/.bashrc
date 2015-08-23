#
# ~/.bashrc
#

# NOTE: I switched away from bash quite a while ago. If you want to see what I'm
#       using now, check out my .zshrc. This file will not be updated to match
#       unless I switch back.

# functions
# =============================================================================

# set "regular" permissions on a directory
# mostly for when programs automatically set odd permissions on directories
normal_dir_permissions() {
    chmod g=rx $1
    chmod o=rx $1
}

# compile for c++11
compile_cpp() {
    g++ -std=c++11 $1 -o $2
}

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


# aliases
# =============================================================================
alias ls='ls --color=auto'
alias xre='xrdb ~/.Xresources'  # reload .Xresources
alias wall='feh --bg-scale'     # set desktop wallpaper
alias perm=normal_permissions   # set "regular" permissions
alias g=compile_cpp             # compile c++11 files
alias vedit='vim ~/.vimrc'
alias zedit='vim ~/.zshrc'

PS1='[\u@\h \W]\$ '

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting