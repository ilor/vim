"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
set background=dark
set backspace=indent,eol,start	" more powerful backspacing
set foldmethod=syntax

inoremap <F9> <C-O>za
nnoremap <F9> za
onoremap <F9> <C-C>za
" set foldlevel=1
" au BufWinLeave * mkview
" au BufWinEnter * silent loadview

:nnoremap <Leader>d "=strftime("%A, %d %b %Y, %H:%M:%S")<CR>P
:inoremap <Leader>d <C-R>=strftime("%A, %d %b %Y, %H:%M:%S")<CR>

" A wrapper function to restore the cursor position, window position,
" and last search after running a command.
" Source: https://docwhat.org/vim-preserve-your-cursor-and-window-state/
" Source: http://technotales.wordpress.com/2010/03/31/preserve-a-vim-function-that-keeps-your-state/
function! Preserve(command)
	" Save the last search
	let last_search=@/
	" Save the current cursor position
	let save_cursor = getpos(".")
	" Save the window position
	normal H
	let save_window = getpos(".")
	call setpos('.', save_cursor)

	" Do the business:
	execute a:command

	" Restore the last_search
	let @/=last_search
	" Restore the window position
	call setpos('.', save_window)
	normal zt
	" Restore the cursor position
	call setpos('.', save_cursor)
endfunction

" a.vim: Alternate plugin for header/source switching
let g:alternateSearchPath = 'sfr:../Source,sfr:../Include,sfr:../,sfr:src/'
let g:alternateNoDefaultAlternate = 1
map <Leader>a :A<CR>

" Convenience
nnoremap ; :
command! Wq wq
command! WQ wq
command! Q q
command! W w
command! Mru MRU
ab mru MRU

" Command-T
map <Leader>y :CommandT C_Application<CR>
set makeprg=make\ -j23\ -l999

" NERD_tree.vim

" /autohighlight.vim: Current word auto highlight
" (the key is <Leader>z/)


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

map <Leader>8 :call Preserve(Toggle80())<CR>
call Preserve(Toggle80())
" OR ELSE on April Fools day...
"highlight ColorColumn ctermbg=red ctermfg=blue
"exec 'set colorcolumn=' . join(range(2,80,3), ',')

"=====[ Highlight matches when jumping to next ]=============
" This rewires n and N to do the highlighing...
"nnoremap <silent> n   n:call HLNext(0.4)<cr>
"nnoremap <silent> N   N:call HLNext(0.4)<cr>
"highlight WhiteOnRed guibg=white ctermbg=red
"
"" just highlight the match in red...
"function! HLNext (blinktime)
"    let [bufnum, lnum, col, off] = getpos('.')
"    let matchlen = strlen(matchstr(strpart(getline('.'),col-1),@/))
"    let target_pat = '\c\%#'.@/
"    let ring = matchadd('WhiteOnRed', target_pat, 101)
"    redraw
"    exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
"    call matchdelete(ring)
"    redraw
"endfunction

"====[ Open any file with a pre-existing swapfile in readonly mode "]=========
augroup NoSimultaneousEdits
    autocmd!
    autocmd SwapExists * let v:swapchoice = 'o'
    autocmd SwapExists * echohl ErrorMsg
    autocmd SwapExists * echo 'Duplicate edit session (readonly)'
    autocmd SwapExists * echohl None
    autocmd SwapExists * sleep 2
augroup END

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

" Map ctrl-forward/backward to buffer navigation.
map <C-right> <ESC>:bn<CR>
map <C-left> <ESC>:bp<CR>

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

" Maps Alt-[s.v] to horizontal and vertical split respectively
map s :split<CR>
map u :vsplit<CR>

" Maps Alt-[n,p] for moving next and previous window respectively
map <silent> n <C-w><C-w>
map <silent> p <C-w><S-w>

" Map Tab/Shift-tab to moving between windows
nnoremap <silent> <Tab> <C-w>w
nnoremap <silent> <S-Tab> <C-w>W

if match($TERM, '256color$') != -1
  colorscheme 256_xoria
endif

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

" Fast editing of the .vimrc, .bashrc
map <leader>e :e! ~/.vim/vimrc<cr>
map <leader>r :e! ~/.bashrc<cr>

" When vimrc is edited, reload it
autocmd! bufwritepost vimrc source ~/.vim/vimrc

" (try to) copy and paste to and from the X clipboard
" (requires xclip/xsel??)
set clipboard=unnamedplus

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

nmap <Leader><Tab> :call Preserve(TabToggle())<CR>

" Show invisible characters: tabs, nbsps and trailing spaces
set list
set listchars=tab:»·,trail:·,nbsp:‥

" Line number display toggle
map <leader>n :set number!<CR>
" Paste mode toggle
"map <leader>p :set paste!<CR>
inoremap <leader>p <C-R>=system('xclip -o')<C-m>

" Rm trailing newlines
map <F8> :call Preserve("%s/\\s\\+$//e")<CR>

" Searching
set ignorecase
set smartcase
set incsearch
set hlsearch
nnoremap - :noh<cr>
map <leader>- :set hlsearch!<cr>

" Set off the other paren
highlight MatchParen ctermbg=4

" C++ tags
autocmd FileType h,c,hpp,cpp :set tags+=~/.tags/*/tags

" clang-format magic
map <C-K> :pyf /usr/share/vim/addons/syntax/clang-format-3.4.py<CR>
imap <C-K> <ESC>:pyf /usr/share/vim/addons/syntax/clang-format-3.4.py<CR>i

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

" Abbreviations
iab DUPA DEBUG_AAAA
iab CHUJ DEBUG_BBBB

