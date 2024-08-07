"  .vimrc
"
"


" This must be first, because it changes other options as a side effect.
  set   nocompatible

" Color
  set  background=dark

" Tabs and spacing
  set  expandtab
  set  tabstop=4
  set  shiftwidth=4
  set  softtabstop=4

" Markup
  set  cursorline
  set  hlsearch

  if has("syntax")
      syntax on
      "color evening
  endif

" Window
  set  laststatus=2
  " Show the cursor all the time.
  set  ruler
  set  statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)
  set  visualbell t_vb=

"  set   autowrite
  set  nobackup
  set  backspace=2
  set  directory=$TMP,/tmp
  set  noerrorbells
  set  esckeys
  set  hidden
  set  joinspaces
  set  modelines=1
  set  scrolloff=3
  set  showcmd
  
  set  showmatch
  set  showmode
  set  nostartofline
  set  textwidth=79
  set  nowrapscan
  set  nowritebackup
  " Works with tab-mode completion to display more files that match.
  set  wildmenu
  " Make searches case-sensitive only if they contain upper-case characters
  set  ignorecase
  set  smartcase

  " set wildmode=longest,list

if has("autocmd")
    "filetype plugin on
    filetype plugin indent on


    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim).
      autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal g`\"" |
        \ endif

    autocmd FileType c,cpp,java,perl,awk,javascript,php,html set formatoptions=crql
    "autocmd FileType c,cpp,java set cindent
    autocmd FileType javascript,php,html,json,jproperties set shiftwidth=2 tabstop=2
    ""autocmd FileType cpp set shiftwidth=3 tabstop=4

    autocmd FileType mail set textwidth=64 wrapmargin=16 autoindent
    autocmd FileType make set list noexpandtab softtabstop=0

else
  set   autoindent
endif

function! MapCR()
    nnoremap <cr> :nohlsearch<cr>
endfunction
call MapCR()

" Remap the tab key to do autocompletion or indentation depending on the
" context (from http://www.vim.org/tips/tip.php?tip_id=102)
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>


command! InsertTime :normal a<c-r>=strftime('%F %H:%M:%S %z')<cr>

"  For a mix-formatted file 
map <F2> :%s/$//g

" eliminates the bottommost quoted sig.  does ^> --\n *and* ^> -- \n !!!
nmap <F9> mbgg/^>\s\=--\s\= <CR>maG?^-- <CR>kv`ad <CR>`b
map _d G?^><CR>?^> -- $<CR>d}
map _e G?^><CR>?^-- $<CR>d}
