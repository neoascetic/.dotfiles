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
set gdefault      " 'g' flag is default in subtitutes

" mouse support
set ttyfast
set ttymouse=xterm2
set mouse=a
set clipboard=unnamed

" do not show preview window on completion
set completeopt-=preview

set history=1000  " remember more commands and search history
set wildignore=*.swp,*.bak,*.pyc,*.class
set title         " change the terminal's title

" don't beep
set visualbell
set noerrorbells

" use VCS for backuping!
set nobackup
set noswapfile

" no GUI - no problem
set guioptions=a

" system clipboard access
vnoremap <A-c> "+y
noremap <A-v> "+p

" highlight and remove trailing whitespaces
set list
set listchars=tab:▷⋅,trail:⋅,extends:#,nbsp:⋅
nnoremap <silent> <leader>/ :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

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
nmap <silent> <leader>c :nohlsearch<CR>

" write file with root privileges
cmap w!! w !sudo tee % >/dev/null

set keymap=russian-jcukenwin
inoremap <C-l> <C-^>
set iminsert=0
set imsearch=0

" default text encoding
set termencoding=utf-8

" save undo history even for editor closing
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
set colorcolumn=80

" spelling correction
set spl=ru_yo,en_us
nmap <silent> <leader>s :set spell!<CR>

" filetype-depend settings
autocmd filetype html,css,less,lua,vim setlocal shiftwidth=2 softtabstop=2
autocmd CursorMoved * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))
autocmd filetype xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null

function! SortLines() range
  execute a:firstline . "," . a:lastline . 's/^\(.*\)$/\=strdisplaywidth( submatch(0) ) . " " . submatch(0)/'
  execute a:firstline . "," . a:lastline . 'sort n'
  execute a:firstline . "," . a:lastline . 's/^\d\+\s//'
endfunction

filetype plugin indent on

" ########################################################################## "
"                                 PLUGINS                                    "
" ########################################################################## "

call plug#begin()
let g:plug_timeout = 600

" auto close HTML tags
Plug 'HTML-AutoCloseTag'

" autoclose quotes, brackets, etc
Plug 'Raimondi/delimitMate'

" jump between opening/closing XML elements by pressing % and highlight them
Plug 'matchit.zip'
Plug 'gregsexton/MatchTag'

" syntax checking
Plug 'scrooloose/syntastic'

" comment lines fast!
Plug 'tpope/vim-commentary'

" change/replace surroundings and wrap words in them easly
Plug 'tpope/vim-surround'

" file/buffer finder by pressing CTRL+P (Command-T alternative)
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
map <C-p> :FZF<CR>

" better undo history
Plug 'mbbill/undotree'
let g:undotree_WindowLayout = 2
let g:undotree_SetFocusWhenToggle = 1
map <leader>u :UndotreeShow<CR>

" integration with ack (http://beyondgrep.com/)
Plug 'mileszs/ack.vim'

" git wrapper
Plug 'tpope/vim-fugitive'

" shows +/- on modified lines using info provided by git
Plug 'airblade/vim-gitgutter'

" better(?) markdown support
Plug 'tpope/vim-markdown'
au filetype markdown set tw=79
au filetype markdown set formatprg=par\ 79j

" easy motion (like Vimperator)
Plug 'Lokaltog/vim-easymotion'

" view curren buffers in the statusline
Plug 'bling/vim-bufferline'

" awesomier status line
set laststatus=2
Plug 'bling/vim-airline'
let g:airline_theme = 'tomorrow'
let g:airline_left_sep = ''
let g:airline_right_sep = ''

" show count of matches
Plug 'IndexedSearch'

" syntax plugins
Plug 'ap/vim-css-color'
Plug 'pangloss/vim-javascript'
Plug 'groenewege/vim-less'

" snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" zenmode for writing
Plug 'junegunn/goyo.vim'

" solarized theme
Plug 'chriskempson/base16-vim'

" OSX's Dash integration
Plug 'rizzatti/dash.vim'
nmap <silent> <leader>d <Plug>DashSearch

" editorconfig
Plug 'editorconfig/editorconfig-vim'

call plug#end()

let base16colorspace=256
set background=dark
silent! colorscheme base16-tomorrow
