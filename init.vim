
:set number
:set relativenumber
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a
" Enable plugin system
call plug#begin('~/.local/share/nvim/plugged')

" Plugin: NERDTree (File Explorer)
Plug 'preservim/nerdtree'

" Plugin: Airline (Status Line)
Plug 'vim-airline/vim-airline':

" Plugin: Lightline (Alternative Status Line)
Plug 'itchyny/lightline.vim'

" Plugin: Devicons (Icons for filetypes)
Plug 'ryanoasis/vim-devicons'

" Plugin: gruvbox (Color scheme)
Plug 'catppuccin/nvim', {'as' : 'catppuccin'}

Plug 'sainnhe/everforest' 

" Plugin: multiplexed terminal:
Plug 'kassio/neoterm'

" Plugin: NERDTree Git Plugin
Plug 'Xuyuanp/nerdtree-git-plugin'

" Plugin: prettier 
Plug 'prettier/vim-prettier'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

"wakatime 
Plug 'wakatime/vim-wakatime'

let g:wakatimeApiKey = 'waka_7f047dbe-5fd6-4107-bbf7-3debd8977442'

call plug#end()

" Set up plugins
syntax enable
filetype plugin indent on

" Color scheme
colorscheme everforest

" Airline configuration
let g:airline_theme='everforest'

" Lightline configuration

 let g:lightline = {
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ], [ 'filename', 'modified' ] ],
  \   'right': [ [ 'lineinfo' ], [ 'percent' ], [ 'filetype' ], [ 'fileformat' ] ]
  \ },
  \ 'component_function': {
  \   'filename': 'lightline#buffer#name'
  \ },
  \ 'component': {
  \   'filename': '%t'
  \ },
  \ 'subseparator': { 'left': '', 'right': '' },
  \ 'separator': { 'left': '', 'right': '' }
  \ }


" NERDTree configuration
let g:NERDTreeIgnore = ['\~$', '\.pyc$', '__pycache__']
let g:NERDTreeWinPos = "left"
let g:NERDTreeShowHidden = 1
let g:NERDTreeGitStatusConceal = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeGitStatusUseNerdFonts = 1
let g:NERDTreeQuitOnOpen = 0


" Set NERDTree as the default explorer
autocmd VimEnter * NERDTree

" Key mappings
nnoremap <C-n> :NERDTreeToggle<CR>

" Devicons configuration
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1

" NERDTree auto open when there's no other file open
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd StdinReadPre * let s:std_in=1

nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-l> :call CocActionAsync('jumpDefinition')<CR>

nmap <F8> :TagbarToggle<CR>

:set completeopt-=preview " For No Previews

let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" Open a new terminal split
nnoremap <leader>t :Tnew<CR>

" Toggle terminal window
nnoremap <leader>T :Ttoggle<CR>

" Switch to the next terminal windokkw
nnoremap <leader>tn :Tnext<CR>

" Switch to the previous terminal window
nnoremap <leader>tp :Tprev<CR>

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:python3_host_prog = 'Users/admin/opt/anaconda3/bin/python

inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"
