call plug#begin('~/.config/nvim/autoload/plugged')
" Intellisense
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Initialize plugin system
Plug 'tpope/vim-commentary' "comments
Plug 'jiangmiao/auto-pairs' "auto pairs
Plug 'tpope/vim-surround'   "surround with pair
" auto set indent settings
Plug 'tpope/vim-sleuth'
" colorscheme
Plug 'gruvbox-community/gruvbox'
" fzf buffer search
Plug 'junegunn/fzf', {'dir': '~/.fzf','do': './install --all'}
Plug 'junegunn/fzf.vim' " needed for previews
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'antoinemadec/coc-fzf'



call plug#end()
