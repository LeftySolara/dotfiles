"Set a virtualenv for neovim to allow Python plugins
let g:python3_host_prog = '/home/jalen/.virtualenvs/neovim/bin/python'

set clipboard+=unnamedplus


"""""""""""""""""
"    Plugins    "
"""""""""""""""""

"Load plugins
call plug#begin('~/.local/share/nvim/plugged')

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'sbdchd/neoformat'
Plug 'davidhalter/jedi-vim'
Plug 'neomake/neomake'
Plug 'terryma/vim-multiple-cursors'
Plug 'machakann/vim-highlightedyank'
Plug 'morhetz/gruvbox'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }

call plug#end()


"""""""""""""""""""""""""""
"     Plugin Settings     "
"""""""""""""""""""""""""""

""" Deoplete """

"Use deoplete
let g:deoplete#enable_at_startup = 1

"Automatically close deoplete preview window
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

"Use tab key to navigate deoplete list
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

"Move preview window to bottom of screen
set splitbelow


""" air-line """

" Set theme
let g:airline_theme='deus'

" Enable powerline fonts
let g:airline_powerline_fonts = 1

" Symbols
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''


""" neoformat """
let g:neoformat_enabled_c = ['astyle', 'uncrustify']
let g:neoformat_enabled_cpp = ['astyle', 'uncrustify']


""" jedi-vim """

" disable auto-completion, since we use deoplete for that
let g:jedi#completions_enabled = 0

" open the goto function in split, not another buffer
let g:jedi#use_splits_not_buffers = "right"


""" neomake """
let g:neomake_python_enabled_makers = ['flake8']


""" vim-highlightedyank """

" Make it easier to see the yank area highlight
hi HighlightedyankRegion cterm=reverse gui=reverse

" Set the highlight timeout
let g:highlightedyank_highlight_duration = 3000


""" markdown-preview """

" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 0

" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1

" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0

" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 0

" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0

" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''

" specify browser to open preview page
" default: ''
let g:mkdp_browser = ''

" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 0

" a custom vim function name to open preview page
" this function will receive url as param
" default is empty
let g:mkdp_browserfunc = ''

" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {}
    \ }

" use a custom markdown style must be absolute path
let g:mkdp_markdown_css = ''

" use a custom highlight style must absolute path
let g:mkdp_highlight_css = ''

" use a custom port to start server or random for empty
let g:mkdp_port = ''

" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'



"""""""""""""""""
"    config     "
"""""""""""""""""

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
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab

" Disable line wrapping
set nowrap

" Filetype detection
augroup project
  autocmd!
  autocmd BufRead,BufNewFile *.h,*.c set filetype=c
augroup END

" Key mappings
map <C-m> :NERDTreeToggle<CR>

colorscheme gruvbox
