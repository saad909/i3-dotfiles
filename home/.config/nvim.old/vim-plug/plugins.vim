" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')





let g:vim_pbcopy_escape_backslashes = 0
    " Using plug
    " Plug 'dylanaraps/wal.vim'    

    " Plug 'https://github.com/kiteco/vim-plugin/'
    Plug 'marciomazza/vim-brogrammer-theme'
    Plug 'romgrk/doom-one.vim'
    Plug 'dylanaraps/wal.vim'
    Plug 'tell-k/vim-autopep8'
    Plug 'lervag/vimtex'
    Plug 'https://github.com/dbeniamine/cheat.sh-vim'
    Plug 'https://github.com/ahw/vim-pbcopy'
    Plug 'gruvbox-community/gruvbox'
    Plug 'sainnhe/gruvbox-material'
    Plug 'https://github.com/ying17zi/vim-live-latex-preview.git'
    Plug 'https://github.com/dracula/vim'
    " Better Comments
    Plug 'tpope/vim-commentary'
    " Change dates fast
     Plug 'tpope/vim-speeddating'
    " Convert binary, hex, etc..
     Plug 'glts/vim-radical'
    " Repeat stuff
     Plug 'tpope/vim-repeat'
    " Text Navigation
     Plug 'unblevable/quick-scope'
    " Useful for React Commenting 
     Plug 'suy/vim-context-commentstring'
    " highlight all matches under cursor
     Plug 'RRethy/vim-illuminate'

  if exists('g:vscode')
    " Easy motion for VSCode
     Plug 'asvetliakov/vim-easymotion'
    Plug 'ChristianChiarulli/vscode-easymotion'
    Plug 'machakann/vim-highlightedyank'
  else

    Plug 'https://github.com/arcticicestudio/nord-vim'
    " Easymotion
    Plug 'easymotion/vim-easymotion'
    " Surround
    Plug 'tpope/vim-surround'
    " Have the file system follow you around
     Plug 'airblade/vim-rooter'
    " auto set indent settings
    Plug 'tpope/vim-sleuth'
    " Better Syntax Support
     Plug 'sheerun/vim-polyglot'
    " Treesitter
    " Plug 'nvim-treesitter/nvim-treesitter'
    " Plug 'nvim-treesitter/playground'
    " Cool Icons
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'ryanoasis/vim-devicons'
    " Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'
    " Closetags
    Plug 'alvan/vim-closetag'
    " Themes
    Plug 'christianchiarulli/nvcode-color-schemes.vim'
    " Intellisense
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " Status Line
    Plug 'glepnir/galaxyline.nvim'
    Plug 'kevinhwang91/rnvimr'
    " FZF
    Plug 'junegunn/fzf', {'dir': '~/.fzf','do': './install --all'}
    Plug 'junegunn/fzf.vim' " needed for previews
    Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
    Plug 'antoinemadec/coc-fzf'
    " Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    " Plug 'yuki-ycino/fzf-preview.vim', { 'branch': 'release', 'do': ':UpdateRemotePlugins' }
    " Plug 'junegunn/fzf.vim'
    " Git
    Plug 'airblade/vim-gitgutter'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-rhubarb'
    Plug 'junegunn/gv.vim'
    Plug 'rhysd/git-messenger.vim'
    " Terminal
    Plug 'voldikss/vim-floaterm'
    " Start Screen
     Plug 'mhinz/vim-startify'
    " Vista
     Plug 'liuchengxu/vista.vim'
    " See what keys do like in emacs
    Plug 'liuchengxu/vim-which-key'
    " Zen mode
    Plug 'junegunn/goyo.vim'
    " Snippets
    Plug 'honza/vim-snippets'
    Plug 'mattn/emmet-vim'
    " Interactive code
     Plug 'metakirby5/codi.vim'
    " Better tabline
     Plug 'romgrk/barbar.nvim'
    " undo time travel
     Plug 'mbbill/undotree'
    " Find and replace
     Plug 'ChristianChiarulli/far.vim'
    " Auto change html tags
     Plug 'AndrewRadev/tagalong.vim'
    " live server
     Plug 'turbio/bracey.vim'
    " Smooth scroll
    Plug 'psliwka/vim-smoothie'
    " " async tasks
     Plug 'skywind3000/asynctasks.vim'
     Plug 'skywind3000/asyncrun.vim'
    " Swap windows
     Plug 'wesQ3/vim-windowswap'
    " Markdown Preview
     Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & npm install'  }
    " Easily Create Gists
     Plug 'mattn/vim-gist'
     Plug 'mattn/webapi-vim'
    " Colorizer
    Plug 'norcalli/nvim-colorizer.lua'
    " Intuitive buffer closing
    Plug 'moll/vim-bbye'
    " Debugging
    Plug 'puremourning/vimspector'
    Plug 'szw/vim-maximizer'
    " Neovim in Browser
     Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
  endif

call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
