set exrc
set guicursor
set relativenumber
set nu
set nohlsearch
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set smartindent
set smartcase
set noswapfile
"set undodir=~/.config/nvim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
set noshowmode
set completeopt=menuone,noinsert,noselect
set colorcolumn=80
set signcolumn=yes

call plug#begin()

Plug 'nvim-telescope/telescope-github.nvim'
Plug 'gruvbox-community/gruvbox'
call plug#end()

colorscheme gruvbox
"highlight Normal guibg=None
set background=dark

let mapleader = " "
nnoremap <leader>ps :lua require('telescope.builtin').grep_string({search = vim.fn.input("Grep For > ")})<CR>
