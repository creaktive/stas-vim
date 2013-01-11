set nocompatible
set backspace=indent,eol,start

set number
set mouse=a
set vb
set t_Co=256
set guifont=ProFont
set guioptions-=T
"colorscheme zenburn
"let g:solarized_termcolors=256
colorscheme solarized
set background=dark

syntax on
set hlsearch

set wildmenu
set cursorline
"set statusline=%t%Y%R\ <%{&ff}
"set statusline+=%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\"}
"set statusline+=>\ {%4c,%4l}\ 0x\%02.2B\ %p%%\ (%L)
"set statusline+=%{fugitive#statusline()}
set laststatus=2

set spell spelllang=pt,en

set history=10000
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set linebreak

set foldenable
set foldmethod=syntax
set foldlevel=10

set autoindent
set smartindent

set showmatch
set incsearch
set ignorecase

filetype plugin indent on

" let g:perl_compiler_force_warnings = 0
let perl_fold=1
let perl_extended_vars=1
let perl_include_pod=1
autocmd FileType perl :call SetupPerl()
function! SetupPerl()
    compiler perl
    setlocal makeprg=perl\ -I.\ -I..\ -I../..\ -I../../..\ -Ilib\ -Mstrict\ -wc\ %
    setlocal iskeyword=48-57,_,A-Z,a-z,192-255,:
    setlocal path+=.,..,../..,../../..,lib

    map <F6> :%!perltidy<CR>
    vmap <F6> :!perltidy<CR>
endfunction

set backup
set backupdir=/tmp
set dir=/tmp

"set grepprg=ack\ -a

" dont use Q for Ex mode
map Q :q

" edit/write/quit alias
cnoreabbrev E e
cnoreabbrev W w
cnoreabbrev Q w

" kill'em all!!!
" noremap     <Up> ""
" noremap!    <Up> <NOP>
" noremap     <Down> ""
" noremap!    <Down> <NOP>
" noremap     <Left> ""
" noremap!    <Left> <NOP>
" noremap     <Right> ""
" noremap!    <Right> <NOP>
noremap     <Insert> ""
noremap!    <Insert> <NOP>
noremap     <Delete> ""
noremap!    <Delete> <NOP>
noremap     <Home> ""
noremap!    <Home> <NOP>
noremap     <End> ""
noremap!    <End> <NOP>
noremap     <PageUp> ""
noremap!    <PageUp> <NOP>
noremap     <PageDown> ""
noremap!    <PageDown> <NOP>

" now all operations work with the OS clipboard
"set clipboard=unnamed

" make tab in v mode ident code
vmap <Tab> >gv
vmap <S-Tab> <gv

" make tab in normal mode ident code
"nmap <Tab> I<tab><esc>
"nmap <S-Tab> ^i<bs><esc>

let g:SuperTabDefaultCompletionType = "context"
let g:manpageview_multimanpage = 0

" Ctrl-r searches for selected text
vnoremap <C-r> "zy:%s/<C-r>z

" eregex
nnoremap / :M/
nnoremap ? :M?
nnoremap ,/ /
nnoremap ,? /

map <F5> :make<CR>
nnoremap <silent> <F7> :NERDTreeToggle<CR>
nnoremap <silent> <F8> :TagbarToggle<CR>
"let Tlist_Auto_Open=1
let Tlist_Use_Right_Window=1

set autochdir
set tags=tags,./tags,./../tags,./../../tags,./../../../tags,./../../../../tags,./../../../../../tags

"nnoremap <C-down> :BufExplorer<CR>
"noremap <C-left> :bprev<CR>
"noremap <C-right> :bnext<CR>
"let g:buftabs_only_basename=1

highlight clear SpellBad
highlight SpellBad gui=undercurl guisp=#bc6c4c
highlight clear SpellCap
highlight SpellCap gui=undercurl guisp=#bc6c4c
highlight clear SpellLocal
highlight SpellLocal gui=undercurl guisp=#bc6c4c
highlight clear SpellRare
highlight SpellRare gui=undercurl guisp=#bc6c4c

autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
