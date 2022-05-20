" Python-Provider Config
let g:python3_host_prog = '/opt/homebrew/bin/python3'

" ===================================================
" =      _    _           _____ _____ _____ _____   =
" =     / \  | | _____  _|___  |___  |___  |___  |  =
" =    / _ \ | |/ _ \ \/ /  / /   / /   / /   / /   =
" =   / ___ \| |  __/>  <  / /   / /   / /   / /    =
" =  /_/   \_\_|\___/_/\_\/_/   /_/   /_/   /_/     =
" =                                                 =
" ===================================================
 " Alex7777 Personal Config start
set encoding=UTF-8
colorscheme gruvbox
set guifont=DroidSansMono\ Nerd\ Font:h11 " set vim font to nerd font
set smarttab
set smartindent
set cursorline
set tabstop=2
set shiftwidth=2
set scrolloff=999 " cursor stay in the middle
set expandtab
set ignorecase
set smartcase
set relativenumber
set clipboard=unnamed
set number
set wrap
set hidden
set updatetime=300
set splitright
set splitbelow
set formatoptions-=cro " disable auto comment insertion
set termguicolors
set nrformats+=alpha
setlocal omnifunc=syntaxcomplete#Complete

"=== Save User's Undo History
  silent !mkdir -p $HOME/.config/nvim/tmp/backup
  silent !mkdir -p $HOME/.config/nvim/tmp/undo
  "silent !mkdir -p $HOME/.config/nvim/tmp/sessions
  set backupdir=$HOME/.config/nvim/tmp/backup,.
  set directory=$HOME/.config/nvim/tmp/backup,.
  if has('persistent_undo')
    set undofile
    set undodir=$HOME/.config/nvim/tmp/undo,.
  endif

" auto indent with block new line or html new line
inoremap <expr> <CR> InsertMapForEnter()
function! InsertMapForEnter()
    if pumvisible()
        return "\<C-y>"
    elseif strcharpart(getline('.'),getpos('.')[2]-1,1) == '}'
        return "\<CR>\<Esc>O"
    elseif strcharpart(getline('.'),getpos('.')[2]-1,1) == ']'
        return "\<CR>\<Esc>O"
    elseif strcharpart(getline('.'),getpos('.')[2]-1,2) == '</'
        return "\<CR>\<Esc>O"
    else
        return "\<CR>"
    endif
endfunction

" Have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif
