set nocompatible
filetype off

" Enable syntax highlighting
syntax on

" Include vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'ervandew/supertab'

call vundle#end()

" Enable loading plugin and indent files for specific file types
filetype plugin indent on

" Allow use of the same window when switching file buffers
set hidden

" Better command-line completion
set showcmd

" Highlight searches
set hlsearch

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Allow backspacing over autoindent, line breaks, and start of insert action
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled,
" keep the same indent as the line you're currently on
set autoindent

" Stop certain movements from always going to the first character of a line
set nostartofline

" Display the cursor position on the last line or in the status line
set ruler

" Always display the status line, even if only one window is displayed
set laststatus=2

" Instead of failing a command because of unsaved changes, instead raise a
" dialog asking if you with to save changed files
set confirm

" Use visual bell instead of beeping when doing something wrong
set visualbell

" Set visual bell to neither flash nor beep
set t_vb=

" Enable use of the mouse for all modes
set mouse=a

" Set command window to 2 lines
set cmdheight=2

" Display line numbers on the left
set number

" Indentation settings
set shiftwidth=2
set softtabstop=2
set expandtab

" Disable line wrapping
set nowrap

" Key mappings
map <C-n> :NERDTreeToggle<CR>
