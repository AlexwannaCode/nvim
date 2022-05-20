" ===
" === key binding
" ===
let mapleader = "\<space>" " set leader key to spacebar
noremap <nowait><leader>q :q<cr>
map <leader>w :w<cr>
map <leader>r :source $MYVIMRC<cr>
map <leader>x :q!<cr>

map <leader>h <c-w>h
map <leader>l <c-w>l
nnoremap <s-k> :BufferLineCycleNext<cr>
nnoremap <s-j> :BufferLineCyclePrev<cr>

" dashboard
nnoremap <silent> <leader>ff :DashboardFindFile<cr>
nnoremap <silent> <leader>fh :DashboardFindHistory<cr>

" tagbar
nmap <leader>t :TagbarToggle<cr>

" lazygit
nnoremap <silent> <leader>gg :LazyGit<cr>

nnoremap gf <c-w>gf
vnoremap gf <c-w>gf

" === wildfire
vmap <leader>n <plug>(wildfire-fuel)
vmap <leader>b <plug>(wildfire-water)

" === undotree
nnoremap <f5> :undotreetoggle<cr>

" === fzf
map <c-p> :Files <cr>

" === far.vim
nnoremap <leader>f :f %<left><left>
