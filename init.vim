filetype plugin indent on
" au BufNewFile,BufRead *.py set tabstop=4 shiftwidth=4 textwidth=79 softtabstop=4
au BufNewFile,BufRead *.R set tabstop=2 shiftwidth=2 softtabstop=2
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
au BufRead,BufNewFile *.tf set filetype=terraform

set expandtab
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

"NLKNguyen/papercolor-theme
"kassio/neoterm
"Shougo/deoplete.nvim
"deoplete-plugins/deoplete-jedi
"dense-analysis/ale

" enable deoplete on startup
let g:deoplete#enable_at_startup = 1

" configure neoterm
let g:neoterm_autoscroll=1 " scroll to the bottom when running a command
let g:neoterm_default_mod='belowright' " open terminal in bottom split
nnoremap <leader><cr> :TREPLSendLine<cr><esc>j
vnoremap <leader><cr> :TREPLSendSelection<cr><esc>j
nnoremap <leader>f :TREPLSendFile<cr><esc>
noremap <leader>c :Tclear<cr>

" let g:ale_completion_enabled = 1
let g:ale_linters = {'python': ['flake8'], 'R': ['lintr'], 'dockerfile_line': ['hadolint'], 'terraform': ['tflint']}

let g:ale_fixers = {'terraform': ['terraform']}

" configure jed
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | silent! pclose | endif " remove jedi help

" colors
set termguicolors
colorscheme PaperColor

" set python path
let g:python3_host_prog = '/home/alexander/.venv/bin/python3' 
let g:ale_python_flake8_executable = '/home/alexander/.venv/bin/flake8'
