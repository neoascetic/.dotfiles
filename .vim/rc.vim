" activate plugins
source ~/.vim/plugins.vim

" source of cyrillic keymappings
source ~/.vim/cyrkeys.vim


" ########################################################################## "
"                                 SETTINGS                                   "
" ########################################################################## "
" called by solarized theme plugin
" syntax enable
filetype plugin on
filetype indent on

" default text encoding
set termencoding=utf-8

" save undo history even for editor closing
set history=64
set undolevels=128
set undodir=~/.vim/undodir/
set undofile
set undolevels=1000
set undoreload=10000
set dir=/tmp

" show where selection ends
set cpoptions+=$

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" show incomplete cmds down the bottom
set showcmd
" show current mode down the bottom
set showmode
" show line numbers
set number
" cursorline
set cursorline

" display tabs and trailing spaces
set list
set listchars=tab:▷⋅,trail:⋅,nbsp:⋅

" find the next match as we type the search
set incsearch
" hilight searches by default
set hlsearch
" ignore case while search
set ignorecase

" don't wrap lines
set nowrap
" wrap lines at convenient points
set linebreak

" mark the ideal max text width
set colorcolumn=+1

" default indent settings
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent

" fold based on indent
set foldmethod=indent
" deepest fold is 3 levels
set foldnestmax=3
" don't fold by default
set nofoldenable

" enable ctrl-n and ctrl-p to scroll thru matches
set wildmenu
" stuff to ignore when tab completing
set wildignore=*pyc,*~
set wcm=<Tab>

" don't continue comments when pushing o/O
set formatoptions-=o

" clear trailing whitespaces
nnoremap <Leader>c :%s/\s\+$//g<CR>

" nightmare mode
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>


" ########################################################################## "
"                                 COMMANDS                                   "
" ########################################################################## "

" python's vritual environment
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF

" Проверка орфографии
menu SetSpell.ru_en :set spl=ru,en spell<CR>
menu SetSpell.off :set nospell<CR>
map <F4> :emenu SetSpell.<Tab>

" filetype-depend settings
autocmd FileType html,css,less setlocal shiftwidth=2 softtabstop=2
