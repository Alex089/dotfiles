" ctr-t and ctr-d for shifting
" replace the lines with filetype plugin indent on ?
" replace neoterm with nvim-repl
filetype plugin indent on
" au BufNewFile,BufRead *.py set tabstop=4 shiftwidth=4 textwidth=79 softtabstop=4
au BufNewFile,BufRead *.R set tabstop=2 shiftwidth=2 softtabstop=2
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
set expandtab
" set autoindent, default is on
set backspace=2
set foldmethod=indent
set number
set noswapfile nobackup
set cursorline
let mapleader = ' '

" easier moving between windows
tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l
inoremap <A-h> <C-\><C-N><C-w>h
inoremap <A-j> <C-\><C-N><C-w>j
inoremap <A-k> <C-\><C-N><C-w>k
inoremap <A-l> <C-\><C-N><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" leave insert mode
inoremap jk <esc>
tnoremap hh <C-\><C-n>

" plugins, install using minpac#add and remove using minpac#clean
packadd minpac
call minpac#init()
call minpac#add('k-takata/minpac', {'type': 'opt'})
call minpac#add('NLKNguyen/papercolor-theme')
call minpac#add('kassio/neoterm')
call minpac#add('Shougo/deoplete.nvim')
call minpac#add('deoplete-plugins/deoplete-jedi')
call minpac#add('dense-analysis/ale')

" enable deoplete on startup
let g:deoplete#enable_at_startup = 1

" configure neoterm
let g:neoterm_autoscroll=1 " scroll to the bottom when running a command
let g:neoterm_default_mod='belowright' " open terminal in bottom split
nnoremap <leader><cr> :TREPLSendLine<cr>j " send current line and move down
vnoremap <leader><cr> :TREPLSendSelection<cr> " send current selection
nnoremap <leader>f :TREPLSendFile<cr>
noremap <leader>c :Tclear<cr>" clear current terminal

" configure ale
let g:ale_linters = {'python': ['flake8'], 'R': ['lintr']}

" configure jed
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | silent! pclose | endif " remove jedi help

" colors
if has('termguicolors')
    set termguicolors
endif
colorscheme PaperColor

" set python path
let g:python3_host_prog = '/home/alexander/.venv/bin/python3' 
let g:ale_python_flake8_executable = '/home/alexander/.venv/bin/flake8'
