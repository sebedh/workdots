let mapleader =" "

set noshowmode
highlight LineNr ctermfg=blue ctermbg=black term=bold cterm=bold
set number relativenumber
set nu rnu
set modeline
set encoding=utf-8
set tabstop=4 shiftwidth=4 expandtab
@set termguicolors
set autowrite
syntax on

call plug#begin('~/.config/nvim/plugged')
if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'deoplete-plugins/deoplete-go', { 'do': 'make' }
endif
Plug 'christoomey/vim-tmux-navigator'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sunaku/vim-dasht'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'fatih/vim-go', { 'do': 'GoUpdateBinaries' }
Plug 'scrooloose/nerdtree'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'jreybert/vimagit'
Plug 'sainnhe/vim-color-forest-night'
Plug 'sheerun/vim-polyglot'
Plug 'kassio/neoterm'
Plug 'neomake/neomake'
Plug 'nvie/vim-flake8'
call plug#end()

let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

autocmd FileType go nmap <leader>r <Plug>(go-run)

" autocmd FileType go nmap <leader>b <Plug>(go-build)
autocmd FileType go nmap <leader>t <Plug>(go-test)
nnoremap <leader>a :cclose<CR>
set completeopt=noinsert
set completeopt+=noselect

set go=a
set mouse=a
set nohlsearch
set clipboard=unnamedplus
set splitbelow splitright

" colorscheme inkpot

" Shortcutting split navigation, saving a keypress:
	map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k
    map <C-l> <C-w>l
" tab shortcuts
    map <leader>h :bp<CR>
    map <leader>l :bn<CR>
    map <leader>q :bd<CR>
"" Nerd tree
	map <leader>n :NERDTreeToggle<CR>
	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Copy selected text to system clipboard (requires gvim/nvim/vim-x11 installed):
	vnoremap <C-c> "+y
	map <C-p> "+P<Paste>

" goimports instead of fmt
let g:go_fmt_command = "goimports"

" Some go syntax settings
let g:go_highlight_structs = 1
let g:go_highlight_methods = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_operators = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1
let g:go_highlight_format_strings = 1
let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1

" YAML settings
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" HTML settings
au BufRead,BufNewFile *.gohtml set filetype=gohtmltmpl
autocmd FileType gohtmltmpl setlocal ts=2 sw=2 expandtab

" Go helper functions
"function! s:build_go_files()
"    let l:file  = expand('%')
"    f l:file =~# ''

" tab line
"colorscheme 
let g:airline_theme='minimalist'
let g:airline#extensions#tabline#enabled = 1
" air-line
let g:airline_powerline_fonts = 1

let g:tmux_navigator_disable_when_zoomed = 1


if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif


" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'


" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

function! MyOnBattery()
  if has('unix')
    return readfile('/sys/class/power_supply/AC/online') == ['0']
  endif
  return 0
endfunction

if MyOnBattery()
  call neomake#configure#automake('w')
else
  call neomake#configure#automake('nw', 1000)
endif
