call plug#begin('~/.config/nvim')

" Plugin for Flutter and Dart
Plug 'dart-lang/dart-vim-plugin'
Plug 'thosakwe/vim-flutter'
Plug 'natebosch/vim-lsc'
Plug 'natebosch/vim-lsc-dart'

" Plugin for NERDTree and its extendsions
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'

" Plugin for fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Plugin for auto pairs
Plug 'jiangmiao/auto-pairs'

" Plugin to display git status
Plug 'airblade/vim-gitgutter'


call plug#end()

" Show line number
set number

" Set syntax on
syntax on

" Config for tab, same size with Intellij
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent
set copyindent

" Config for encoding
set encoding=UTF-8

" Clipboard buffer for NeoVim
set clipboard+=unnamedplus " Clipboard


" Start NERDTree when open NeoVim
autocmd VimEnter * NERDTree
:let g:NERDTreeWinSize=40
