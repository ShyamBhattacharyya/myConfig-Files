call plug#begin("~/.vim/plugged")
" Plugin Section
Plug 'dracula/vim'
Plug 'SirVer/ultisnips'
"Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
"Plug 'https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/conque/conque_2.3.zip'  " Manually installed
Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw)
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation press F8
Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdtree'	" CTRL + t to toggle
Plug 'preservim/nerdcommenter'   " Leader i.e. / + cc = comment; / + ci = inverter comment status; / + cu = uncomment
Plug 'mhinz/vim-startify'
Plug 'neoclide/coc.nvim', {'branch': 'release'}	  " install snippets using CocInstall coc-... commands; CocUninstall coc-... to uninstall
Plug 'https://github.com/vim-airline/vim-airline' " Custom status bar
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
set encoding=UTF-8
call plug#end()

" color schemes
if (has("termguicolors"))
:set termguicolors
endif
syntax enable
" colorscheme evening
:colorscheme dracula " open new split panes to right and below
:set splitright
:set splitbelow

:set nocompatible            " disable compatibility to old-time vi
:set showmatch               " show matching 
:set ignorecase              " case insensitive 
:set mouse=v                 " middle-click paste with 
:set shiftwidth=4
:set wrap
:set paste
:set hlsearch                " highlight search 
:set incsearch               " incremental search
:set tabstop=4               " number of columns occupied by a tab 
:set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
:set smarttab
:set expandtab               " converts tabs to white space
:set shiftwidth=4            " width for autoindents
:set autoindent              " indent a new line the same amount as the line just typed
:set number                  " add line numbers
:set relativenumber          " add relative number
:set wildmode=longest,list   " get bash-like tab completions
:set cc=80                  " set an 80 column border for good coding style
:filetype plugin indent on   "allow auto-indenting depending on file type
:syntax on                   " syntax highlighting
:set mouse=a                 " enable mouse click
:set clipboard=unnamedplus   " using system clipboard
:filetype plugin on
:set cursorline              " highlight current cursorline
:set ttyfast                 " Speed up scrolling in Vim
" :set spell                 " enable spell check (may need to download language package)
" :set noswapfile            " disable creating swap file
" :set backupdir=~/.cache/vim " Directory to store backup files.

nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-l> :call CocActionAsync('jumpDefinition')<CR>

nmap <F8> :TagbarToggle<CR>

:set completeopt-=preview " For No Previews


let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

" --- Just Some Notes ---
" :PlugClean :PlugInstall :UpdateRemotePlugins
"
" :CocInstall coc-python
" :CocInstall coc-clangd
" :CocInstall coc-snippets
" :CocCommand snippets.edit... FOR EACH FILE TYPE

" air-line
let g:airline_powerline_fonts = 1

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

let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:WebDevIconsUnicodeDecorateFolderNodeDefaultSymbol = ''

let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {}
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['nerdtree'] = ''
inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"

"Terminal script
" Terminal Function
let g:term_buf = 0
let g:term_win = 0
function! TermToggle(height)
    if win_gotoid(g:term_win)
        hide
    else
        botright new
        exec "resize " . a:height
        try
            exec "buffer " . g:term_buf
        catch
            call termopen($SHELL, {"detach": 0})
            let g:term_buf = bufnr("")
            set nonumber
            set norelativenumber
            set signcolumn=no
        endtry
        startinsert!
        let g:term_win = win_getid()
    endif
endfunction

" Toggle terminal on/off (neovim)
nnoremap <A-t> :call TermToggle(12)<CR>
inoremap <A-t> <Esc>:call TermToggle(12)<CR>
tnoremap <A-t> <C-\><C-n>:call TermToggle(12)<CR>

" Terminal go back to normal mode
tnoremap <Esc> <C-\><C-n>
tnoremap :q! <C-\><C-n>:q!<CR>
