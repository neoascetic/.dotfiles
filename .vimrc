" ########################################################################## "
"                                 SETTINGS                                   "
" ########################################################################## "
" change the mapleader from \ to ,
let mapleader=","

syntax enable     " highlight filetypes syntax

set autochdir     " change the current directory automatically
set hidden        " hide buffers instead of closing them
set nowrap        " don't wrap lines
set tabstop=4     " a tab is four spaces
set expandtab
set backspace=indent,eol,start
                  " allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set number        " always show line numbers
set shiftwidth=4  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                  " case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to
                  " shiftwidth, not tabstop
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type

" do not show preview window on completion
set completeopt-=preview

set history=1000  " remember more commands and search history
set undolevels=1000
                  " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title         " change the terminal's title

" don't beep
set visualbell
set noerrorbells

" use VCS for backuping!
set nobackup
set noswapfile

" highlight whitespaces
set list
set listchars=tab:▷⋅,trail:⋅,extends:#,nbsp:⋅

" switch between paste mode
set pastetoggle=<F2>

nnoremap ; :

" nightmare mode!
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

nnoremap j gj
nnoremap k gk

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" turn off current search highlighting
nmap <silent> <leader>/ :nohlsearch<CR>

" write file with root privileges
cmap w!! w !sudo tee % >/dev/null

filetype plugin indent on

set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0

" default text encoding
set termencoding=utf-8

" save undo history even for editor closing
set undolevels=128
set undodir=~/.vim/undodir
set undofile
set undolevels=1000
set undoreload=1000

" show where selection ends
set cpoptions+=$

set cursorline

" wrap lines at convenient points
set linebreak

" mark the ideal max text width
set colorcolumn=81

" spelling correction
set spl=ru_yo,en_us
nmap <silent> <leader>s :set spell!<CR>

" filetype-depend settings
autocmd filetype html,css,less setlocal shiftwidth=2 softtabstop=2

" ########################################################################## "
"                                 PLUGINS                                    "
" ########################################################################## "

" Call Vundle
set rtp+=~/.vim/bundle/vundle/
let g:vundle_default_git_proto = 'git'
call vundle#rc()

" let Vundle manage itself
Bundle 'gmarik/vundle'

" auto close HTML tags
Bundle 'HTML-AutoCloseTag'

" autoclose quotes, brackets, etc
Bundle 'Raimondi/delimitMate'

" jump between opening/closing elements by pressing %
Bundle 'matchit.zip'

" syntax checking
Bundle 'scrooloose/syntastic'

" comment lines fast!
Bundle 'tpope/vim-commentary'

" change/replace surroundings and wrap words in them easly
Bundle 'tpope/vim-surround'

" file/buffer finder by pressing CTRL+P (Command-T alternative)
Bundle 'kien/ctrlp.vim'

" better undo history
Bundle 'mbbill/undotree'
map <F6> :UndotreeToggle<CR>

" integration with ack (http://beyondgrep.com/)
Bundle 'mileszs/ack.vim'

" virtualenv support
Bundle 'jmcantrell/vim-virtualenv'

" git wrapper
Bundle 'tpope/vim-fugitive'

" better(?) markdown support
Bundle 'tpope/vim-markdown'
au filetype markdown set tw=80

" RestructuredText tables generation
Bundle 'nvie/vim-rst-tables'

" easy text aligning
Bundle 'junegunn/vim-easy-align'
vnoremap <silent> <Enter> :EasyAlign<cr>

" easy motion (like Vimium)
Bundle 'Lokaltog/vim-easymotion'

" Exuberant tags support
Bundle 'majutsushi/tagbar'
nmap <F8> :TagbarOpen fj<CR>

" awesomiest status line
" TODO: unmantained, need to swich to https://github.com/Lokaltog/powerline
set laststatus=2
Bundle 'Lokaltog/vim-powerline'
let g:Powerline_symbols='fancy'

" show count of matches
Bundle 'IndexedSearch'

" syntax plugins
Bundle 'Jinja'
Bundle 'ap/vim-css-color'
Bundle 'pangloss/vim-javascript'
Bundle 'groenewege/vim-less'
au BufRead,BufNewFile *.less set filetype=less
Bundle 'kchmck/vim-coffee-script'
au BufRead,BufNewFile *.coffee set filetype=coffee

" better omnicompletion
Bundle 'Valloric/YouCompleteMe'

" zenmode for writing
Bundle 'mikewest/vimroom'
let g:vimroom_sidebar_height=0

" solarized theme
Bundle 'altercation/vim-colors-solarized'
set background=light
let g:solarized_termcolors=256
colorscheme solarized
