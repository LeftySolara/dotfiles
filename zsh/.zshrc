# =============================================================================
# Shell Theme (Powerlevel10k)
# =============================================================================
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# =============================================================================
# General Configurations
# =============================================================================
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep
bindkey -v

# =============================================================================
# Enable Autocompletions
# =============================================================================
autoload -Uz compinit
compinit

# =============================================================================
# Path
# =============================================================================
PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:$HOME/.local/bin:$PATH"
export PATH

# =============================================================================
# Functions
# =============================================================================

# Create a new directory and then enter it
new_dir_cd() {
  mkdir -p $1
  cd $1
}

# =============================================================================
# Aliases
# =============================================================================
alias down='sudo shutdown now'	# shut down the computer
alias gst='git status'		# print git status
alias ls='ls --color=auto'	# print ls with color
alias mk=new_dir_cd		# create new directory and cd into it
alias rest='systemctl suspend'	# put the computer to sleep
alias tree='tree -C'		# print tree with color
alias slideshow='feh -q -F -Y -z -r -D 15'  # play an image slideshow
alias xre='xrdb ~/.Xresources'  # reload .Xresources file
alias wall='feh --bg-scale'	# set desktop wallpaper
alias zedit='vim ~/.zshrc'	# open ~/.zshrc for editing

# =============================================================================
# GUI Style (Qt)
# =============================================================================
export QT_STYLE_OVERRIDE=GTK+
export QT_QPA_PLATFORMTHEME="qt5ct-style"

# =============================================================================
# End of Configuration
# =============================================================================
