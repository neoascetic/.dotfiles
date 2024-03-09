set tabstop=4       " The width of a TAB is set to 4.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 4.
set shiftwidth=4    " Indents will have a width of 4
set softtabstop=4   " Sets the number of columns for a TAB
set expandtab       " Expand TABs to spaces
set number

highlight FoldColumn ctermfg=white ctermbg=white
highlight EndOfBuffer ctermfg=white

" format/justify paragraphs with Ctrl+j
set formatprg=par\ -j1\ -P="\ "
nnoremap <C-j> {gq}

let s:_writer_mode=0
function WriterMode()
  if s:_writer_mode
    setlocal number
    setlocal foldcolumn=1
  else
    setlocal nonumber
    setlocal foldcolumn=12
  endif
  let s:_writer_mode=s:_writer_mode ? 0 : 1
endfunction
:command! WriterMode :call WriterMode()
