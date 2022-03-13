call plug#begin('~/.config/nvim')

" Plugin for theme
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

" Plugin for Java debugging
Plug 'mfussenegger/nvim-dap'

" Coc vim plugin
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Plugin for Flutter and Dart
Plug 'dart-lang/dart-vim-plugin'
Plug 'thosakwe/vim-flutter'
Plug 'natebosch/vim-lsc'
Plug 'natebosch/vim-lsc-dart'
Plug 'dart-lang/dart-vim-plugin'

" Plugin for NERDTree and its extendsions
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'

" Plugin for fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Plugin for auto pairs
Plug 'jiangmiao/auto-pairs'

" Plugin for Git fugitive
Plug 'tpope/vim-fugitive'

" Plugin for telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

call plug#end()

" Set encoding
set encoding=utf-8

" Show line number
set number

" Set syntax on
syntax on

" Display cursor highlight
set cursorline
set cursorlineopt=number

" Config for tab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent
set copyindent

" Clipboard buffer for NeoVim
set clipboard+=unnamedplus " Clipboard

" Start NERDTree when open NeoVim
autocmd VimEnter * NERDTree
:let g:NERDTreeWinSize=30

" CONFIG FOR COC-VIM
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" END CONFIG FOR COC-VIM
