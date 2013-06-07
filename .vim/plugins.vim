" Call Vundle
set rtp+=~/.vim/bundle/vundle/
let g:vundle_default_git_proto = 'git'
call vundle#rc()


" let Vundle manage itself
Bundle 'gmarik/vundle'

" AutoClose
Bundle 'AutoClose--Alves'
Bundle 'HTML-AutoCloseTag'

" matchit
Bundle 'matchit.zip'

" zencoding
Bundle 'mattn/zencoding-vim'

" syntastic
Bundle 'scrooloose/syntastic'
noremap <silent><leader>lc :lcl<CR>
noremap <silent><leader>lo :lw<CR>

" nerd tree
Bundle 'scrooloose/nerdtree'
autocmd vimenter * if !argc() | NERDTree | endif
map <F7> :execute 'NERDTreeToggle ' . getcwd()<CR>

" comment lines fast!
Bundle 'tpope/vim-commentary'

" ctrlp
Bundle 'kien/ctrlp.vim'

" gundo
Bundle 'sjl/gundo.vim'
map <F6> :GundoToggle<CR>

" ack.vim
Bundle 'mileszs/ack.vim'

" supertab
Bundle 'ervandew/supertab'
" au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType='context'
set completeopt=menuone,longest,preview

" rope-vim
Bundle 'klen/rope-vim'
map <leader>j :RopeGotoDefinition<CR>
map <leader>r :RopeRename<CR>
let ropevim_extended_complete=1

" virtualenv support
Bundle 'jmcantrell/vim-virtualenv'

" ultisnips
Bundle 'SirVer/ultisnips'
let g:UltiSnipsSnippetDirectories=["UltiSnips", "snippets"]

" git wrapper
Bundle 'tpope/vim-fugitive'
Bundle 'int3/vim-extradite'

" RoR support
Bundle 'tpope/vim-rails'

" Laravel's Blade templating syntax support
Bundle 'johnhamelink/blade.vim'

" better(?) markdown support
Bundle 'tpope/vim-markdown'
au FileType markdown set tw=80

" RST tables generation
Bundle 'nvie/vim-rst-tables'

" tags support
Bundle 'xolox/vim-misc'
Bundle 'xolox/vim-easytags'
let g:easytags_updatetime_autodisable=1
Bundle 'majutsushi/tagbar'
let g:tagbar_compact=1
nmap <F8> :TagbarOpen fj<CR>

" vim-powerline
set laststatus=2
Bundle 'Lokaltog/vim-powerline'
let g:Powerline_symbols='fancy'
call Pl#Theme#RemoveSegment('fileformat')
call Pl#Theme#RemoveSegment('fileencoding')
call Pl#Theme#InsertSegment('ws_marker', 'after', 'lineinfo')

" indexed search
Bundle 'IndexedSearch'

" sytax plugins
Bundle 'kchmck/vim-coffee-script'
Bundle 'groenewege/vim-less'
Bundle 'Jinja'
Bundle 'pangloss/vim-javascript'
Bundle 'ap/vim-css-color'

" solarized theme
syntax enable
Bundle 'altercation/vim-colors-solarized'
let g:solarized_termcolors=256
set background=light
colorscheme solarized
