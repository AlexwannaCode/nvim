" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin()

" Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw)
" Plug 'JoosepAlviste/nvim-ts-context-commentstring'
"Plug 'machakann/vim-sandwich'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
" Plug 'RRethy/vim-hexokinase'
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
Plug 'https://github.com/neoclide/coc.nvim'  " Auto Completion
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Plug 'ryanoasis/vim-devicons'
Plug 'morhetz/gruvbox'
Plug 'psliwka/vim-smoothie'
Plug 'justinmk/vim-sneak'
Plug 'AndrewRadev/switch.vim'
Plug 'godlygeek/tabular'
" Plug 'tmhedberg/SimpylFold'
Plug 'mbbill/undotree'
" Plug 'mhinz/vim-startify'
Plug 'brooth/far.vim'
Plug 'mattn/emmet-vim'
Plug 'wfxr/minimap.vim'
Plug 'michaelb/sniprun', {'do': 'bash install.sh'}
Plug 'neoclide/jsonc.vim'
Plug 'rcarriga/nvim-notify'
Plug 'turbio/bracey.vim', {'do': 'npm install --prefix server'}
Plug 'honza/vim-snippets'
" Plug 'mg979/vim-xtabline'
Plug 'mg979/vim-visual-multi'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'rhysd/clever-f.vim'
Plug 'tpope/vim-repeat'
Plug 'glepnir/dashboard-nvim'
" Plug 'christoomey/vim-tmux-navigator'
Plug 'kyazdani42/nvim-web-devicons'
" Plug 'edkolev/tmuxline.vim'
" Plug 'gcmt/wildfire.vim'
" Plug 'luochen1990/rainbow'
Plug 'posva/vim-vue'
Plug 'tyru/caw.vim' " work with context_filetype to comment HTML in js
Plug 'Shougo/context_filetype.vim'
Plug 'Yggdroot/indentLine' " :IndentLinesToggle to toggle
Plug 'bkad/CamelCaseMotion'
" Plug 'iloginow/vim-stylus'
" Plug 'APZelos/blamer.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'sindrets/diffview.nvim'
Plug 'kdheepak/lazygit.nvim'
" Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'roxma/vim-tmux-clipboard'
Plug 'nanotee/zoxide.vim'
Plug 'romainl/vim-cool'
" Plug 'junegunn/rainbow_parentheses.vim'
Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*', 'require': 'kyazdani42/nvim-web-devicons'}
Plug 'p00f/nvim-ts-rainbow'

call plug#end()

" ===
" === Plugin Config
" ===
let g:Hexokinase_highlighters                = ['virtual']
let g:minimap_width                          = 10
" let g:rainbow_active                       = 1 "set to 0 if you want to enable it later via :RainbowToggle
" let g:rainbow#pairs                          = [['(', ')'], ['[', ']'],['{', '}']] 
let g:minimap_auto_start                     = 1
let g:blamer_relative_time                   = 1 " set git blamer relative time
let g:minimap_auto_start_win_enter           = 1
let g:minimap_block_buftypes                 = ['nofile', 'nowrite', 'quickfix', 'terminal', 'prompt', 'help']
let g:airline_powerline_fonts                = 1
let g:smoothie_experimental_mappings         = 1 " experimental gg/G smoothie
let g:fzf_preview_window                     = ['right:50%']
let g:sneak#s_next                           = 1 " Plug sneak clever-s on
let g:SimpylFold_docstring_preview           = 1 " enable docstring preview for SimplyFold
let g:airline#extensions#coc#enabled         = 1 " Enable coc intergration
let g:minimap_block_filetypes                = ['fugitive', 'nerdtree', 'tagbar', 'fzf' , 'coc-explorer']
let g:minimap_highlight_range	               = 1
let g:minimap_highlight_search	             = 1
" let g:minimap_git_colors                     = 1
let g:airline#extensions#coc#show_coc_status = 1 " enable coc status display
" let g:airline#extensions#tabline#enabled   = 1
let g:indentLine_char = '│'
let g:dashboard_default_executive            = 'fzf'
let g:dashboard_custom_header                = [
\'    _    _           _____ _____ _____ _____',
\'   / \  | | _____  _|___  |___  |___  |___  |',
\'  / _ \ | |/ _ \ \/ /  / /   / /   / /   / /',
\' / ___ \| |  __/>  <  / /   / /   / /   / /',
\'/_/   \_\_|\___/_/\_\/_/   /_/   /_/   /_/',
\]

" ==================== nvim-treesitter ====================
lua <<EOF
require('nvim-treesitter.configs').setup {
-- one of "all", "language", or a list of languages
	ensure_installed = {"typescript", "dart", "java", "c", "prisma", "bash", "lua"},
	highlight = {
		enable = true,              -- false will disable the whole extension
		disable = { "rust" },  -- list of language that will be disabled
	},
  rainbow = {
    enable = true,
    extended_mode = true, -- highlight non-bracket delimiters like html tags
    }
}

require('bufferline').setup {
  options = {
   mode= "tabs",
   numbers = "buffer_id",
   diagnostics = "coc",
   show_buffer_close_icons = false,
   show_close_icon = false,
   color_icons = true,
   offsets= {
     filetype= "coc-explorer",
     text= "File Explorer",
     highlight= "Directory",
     separator_style = "slant",
     text_align= "left"
     }
    }
  }

vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
-- 默认不要折叠
-- https://stackoverflow.com/questions/8316139/how-to-set-the-default-to-unfolded-when-you-open-a-file
vim.wo.foldlevel = 99

EOF

" custom FZF status line
function! s:fzf_statusline()
  " Override statusline as you like
  highlight fzf1 ctermfg=161 ctermbg=251
  highlight fzf2 ctermfg=23 ctermbg=251
  highlight fzf3 ctermfg=237 ctermbg=251
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction

autocmd! User FzfStatusLine call <SID>fzf_statusline()

" fzf preview
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, {'options': ['--layout=reverse', '--info=inline', '--preview', '~/.config/zsh/preview.sh {}']}, <bang>0)

