"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
set background=dark
set backspace=indent,eol,start	" more powerful backspacing


" a.vim: Alternate plugin for header/source switching
let g:alternateSearchPath = 'sfr:../Source,sfr:../Include'
let g:alternateNoDefaultAlternate = 1
map <Leader>a :A<CR>

" Command-T
map <Leader>y :CommandT C_Application<CR>
set makeprg=make\ -j23\ -l999

" NERD_tree.vim

" /autohighlight.vim: Current word auto highlight 
" (the key is <Leader>z/)

" bufExplorer plugin
let g:bufExplorerShowRelativePath=1
map <leader>o :BufExplorer<cr>


" Have Vim jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Sets how many lines of history VIM has to remember
set history=700

" Enable filetype plugin
filetype plugin on
filetype indent on
syntax on

" Set visual mode indent
vnoremap < <gv
vnoremap > >gv

" Buffers
set hidden

set ruler

" Map forward/backward buffer navigation.
map <C-right> <ESC>:bn<CR>
map <C-left> <ESC>:bp<CR>

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

" Maps Alt-[s.v] to horizontal and vertical split respectively
map s :split<CR>
map u :vsplit<CR>

" Maps Alt-[n,p] for moving next and previous window respectively
map <silent> n <C-w><C-w>
map <silent> p <C-w><S-w>

" Map Tab/Shift-tab to moving between windows
nnoremap <silent> <Tab> <C-w>w
nnoremap <silent> <S-Tab> <C-w>W


" Set to auto read when a file is changed from the outside
" set autoread

" Always display filename-statusline
set laststatus=2

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = "\\"
let g:mapleader = "\\"

" Fast saving
nmap <leader>w :w!<cr>

" Fast editing of the .vimrc
map <leader>e :e! ~/.vim/vimrc<cr>

" When vimrc is edited, reload it
autocmd! bufwritepost vimrc source ~/.vim/vimrc

" Tabs
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
set smarttab
set autoindent

" Show invisible characters: tabs, nbsps and trailing spaces
set list
set listchars=tab:»·,trail:·,nbsp:‥

" Line number display toggle
map <leader>n :set number!<CR>

" Paste mode toggle
map <leader>p :set paste!<CR>

" Rm trailing newlines
map <F8> :%s/\s*$//g<CR>

" Searching
set ignorecase
set smartcase
set incsearch
set hlsearch
map <leader>- :set nohls<cr>

" Set off the other paren
highlight MatchParen ctermbg=4

" C++ tags
autocmd FileType h,c,hpp,cpp :set tags+=~/.tags/*/tags

" K3 tags
autocmd FileType ttcn :set tags+=~/.tags/K3/*/tags

" Abbreviations
iab DUPA DEBUG_AAAA
iab CHUJ DEBUG_BBBB

