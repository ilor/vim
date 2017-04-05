set nocompatible

call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'chriskempson/base16-vim'
Plug 'lifepillar/vim-solarized8'
Plug 'vim-scripts/xoria256.vim'
Plug 'vim-scripts/a.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'rhysd/vim-clang-format'
Plug 'kana/vim-operator-user'
Plug 'scrooloose/nerdtree'
Plug 'ajh17/VimCompletesMe'
Plug 'bogado/file-line'
Plug 'w0rp/ale'
Plug 'jwhitley/vim-preserve'
" Plug 'tpope/vim-sleuth'
" Plug 'lygaret/autohighlight.vim'  # broken
call plug#end()

if match($TERM, '256color$') != -1
  colorscheme xoria256
endif

" Enable the list of buffers
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'
let g:airline_symbols_branch = '⎇'

let g:airline_theme = "badwolf"
" open a NERDTree automatically when vim starts up if no files were specified
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" With a map leader it's possible to do extra key combinations
let mapleader = "\\"
let g:mapleader = "\\"

" Fast saving
nmap <leader>w :w!<cr>

" Fast editing of the .vimrc, .bashrc
map <leader>e :e! ~/.vimrc<cr>
map <leader>r :e! ~/.bashrc<cr>

" When vimrc is edited, reload it
autocmd! bufwritepost .vimrc source ~/.vimrc

" Maps Alt-[s.v] to horizontal and vertical split
map s :split<CR>
map v :vsplit<CR>

" Maps Alt-[n,p] for moving next and previous buffer
map <silent> n :bnext<CR>
map <silent> p :bprevious<CR>

" Map Tab/Shift-tab to moving between windows
nnoremap <silent> <Tab> <C-w>w
nnoremap <silent> <S-Tab> <C-w>W

" Convenience
nnoremap ; :
command! Wq wq
command! WQ wq
command! Q q
command! W w
command! Mru MRU
ab mru CtrlPMRU
ab Mru CtrlPMRU

" Set visual mode indent
vnoremap < <gv
vnoremap > >gv

" Have Vim jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
" Searching

set ignorecase
set smartcase
set incsearch
set hlsearch
nnoremap - :noh<cr>
map <leader>- :set hlsearch!<cr>

" Map shift-up/down to wrap-abiding up/down
nnoremap <S-up> gk
vnoremap <S-up> gk
inoremap <S-up> <ESC>gki
nnoremap <S-down> gj
vnoremap <S-down> gj
inoremap <S-up> <ESC>gji

" Maps Alt-[h,j,k,l] to resizing a window split
map <silent> h <C-w><
map <silent> j <C-W>-
map <silent> k <C-W>+
map <silent> l <C-w>>

" Map Ctrl-[hjkl] to moving between windows
map <silent> <C-h> <C-w>h
map <silent> <C-j> <C-w>j
map <silent> <C-k> <C-w>k
map <silent> <C-l> <C-w>l

" Always display filename-statusline
set laststatus=2

" Tabs
set expandtab
set smarttab
set autoindent
set tabstop=4
let my_tab=2
execute "set shiftwidth=".my_tab
execute "set softtabstop=".my_tab

" Allow toggling between normal and real tab mode with <Leader><TAB>
function! TabToggle()
  if &expandtab
    set shiftwidth=4
    set softtabstop=0
    set noexpandtab
    redraw
    echomsg "Tabs now NOT expanded"
  else
    execute "set shiftwidth=".g:my_tab
    execute "set softtabstop=".g:my_tab
    set expandtab
    redraw
    echomsg "Tabs now expanded"
 endif
endfunction

nmap <Leader><Tab> :call pr#preserve(TabToggle())<CR>

" git commit message
function! StartCommitMsg ()
    :1
    if getline(".") !~ "^$"
        return
    endif
    :0read !bts_task
    " expand folds so commit summary is not folded
    :normal zR
    :normal A: 
    :startinsert!
endfunction
autocmd BufReadPost COMMIT_EDITMSG :call StartCommitMsg()

"====[ Make the 81st column stand out ]====================
" just the 81st column of wide lines... magenta?
highlight ColorColumn ctermbg=red
let g:match80=0

function! Toggle80()
  if g:match80 == 0
    let g:match80=matchadd('ColorColumn', '\%81v', 100)
  else
    call matchdelete(g:match80)
    let g:match80=0
  endif
endfunction

map <Leader>8 :call pr#preserve(Toggle80())<CR>
call pr#preserve(Toggle80())

" Show invisible characters: tabs, nbsps and trailing spaces
set list
set listchars=tab:»·,trail:·,nbsp:‥
