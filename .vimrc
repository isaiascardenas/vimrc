
"___Vim-Plug List___

call plug#begin('~/.vim/plugged')

Plug 'altercation/vim-colors-solarized'
Plug 'bling/vim-airline'
Plug 'chriskempson/base16-vim'
Plug 'dart-lang/dart-vim-plugin'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'jwalton512/vim-blade'
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'
Plug 'leafgarland/typescript-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'peitalin/vim-jsx-typescript'
Plug 'posva/vim-vue'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline-themes'

call plug#end()




" ___Vim General Configuration___

set nocompatible                                             " don't bother with vi compatibility
set autoindent
set hidden                                                   " enable switch buffer without saving
set autoread                                                 " reload files when changed on disk, i.e. via `git checkout`
set backspace=2                                              " Fix broken backspace in some setups
set backupcopy=yes                                           " see :help crontab
set clipboard=unnamed                                        " yank and paste with the system clipboard
set directory-=.                                             " don't store swapfiles in the current directory
set encoding=utf-8
set ignorecase                                               " case-insensitive search
set incsearch                                                " search as you type
set laststatus=2                                             " always show statusline
set list                                                     " show trailing whitespace
set listchars=tab:▸\ ,trail:▫
set number                                                   " show line numbers
set ruler                                                    " show where you are
set scrolloff=3                                              " show context above/below cursorline
set showcmd
set smartcase                                                " case-sensitive search if any caps
set tabstop=4                                                " actual tabs occupy 8 characters
set shiftwidth=2                                             " normal mode indentation commands use 4 spaces
set softtabstop=0                                            " insert mode tab and backspace use 2 spaces
set expandtab                                                " expand tabs to spaces
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc
set wildmenu                                                 " show a navigable menu for tab completion
set wildmode=longest,list,full
set hlsearch
set incsearch
set mouse=a                                                  " Enable basic mouse behavior such as resizing buffers.
set nocursorline                                             " don't highlight current line




" ___Visuals___

if (has("termguicolors"))
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

colorscheme palenight
set linespace=15
set t_Co=256
syntax on
set background=dark
hi vertsplit ctermfg=238 ctermbg=235
hi LineNr ctermfg=237
hi StatusLine ctermfg=235 ctermbg=245
hi StatusLineNC ctermfg=235 ctermbg=237
hi Search ctermbg=58 ctermfg=15
hi Default ctermfg=1
hi clear SignColumn
hi SignColumn ctermbg=235
hi GitGutterAdd ctermbg=235 ctermfg=245
hi GitGutterChange ctermbg=235 ctermfg=245
hi GitGutterDelete ctermbg=235 ctermfg=245
hi GitGutterChangeDelete ctermbg=235 ctermfg=245
hi EndOfBuffer ctermfg=237 ctermbg=235
set statusline=%=&P\ %f\ %m
set fillchars=vert:\ ,stl:\ ,stlnc:\ 
set laststatus=2
set noshowmode





" ___Keyboard Mappings____

let mapleader = ','
cabbrev q <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'close' : 'q')<CR>
cabbrev qa<c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'close' : 'qa')<CR>
noremap ,ev :tabedit $MYVIMRC<cr>
noremap <leader><space> :nohlsearch<cr>
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
inoremap jj <ESC>
noremap <D-s> :w
noremap <leader>n :bnext<CR>
noremap <leader>p :bprevious<CR>
noremap <leader>l :Align
nnoremap <leader>a :Ag<space>
nnoremap <leader>d :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>f :NvimTreeFindFile<CR>
nnoremap <leader>] :TagbarToggle<CR>
nnoremap <leader>g :GitGutterToggle<CR>
noremap <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>
nnoremap <Left> :vertical resize -5<CR>
nnoremap <Right> :vertical resize +5<CR>
nnoremap <Up> :resize -5<CR>
nnoremap <Down> :resize +5<CR>
cnoremap w!! %!sudo tee > /dev/null %
nmap  :setlocal spell spelllang=es_es<cr>
nmap  :setlocal spell spelllang=en_en<cr>




" ___Plugins Settings___

"__Nvim-Tree
let g:nvim_tree_width = 40 "30 by default
let g:nvim_tree_ignore = [] "empty by default
let g:nvim_tree_auto_open = 1 "0 by default, opens the tree when typing `vim $DIR` or `vim`
let g:nvim_tree_auto_close = 0 "0 by default, closes the tree when it's the last window
let g:nvim_tree_quit_on_open = 0 "0 by default, closes the tree when you open a file
let g:nvim_tree_follow = 0 "0 by default, this option allows the cursor to be updated when entering a buffer
let g:nvim_tree_indent_markers = 1 "0 by default, this option shows indent markers when folders are open
let g:nvim_tree_hide_dotfiles = 0 "0 by default, this option hides files and folders starting with a dot `.`
let g:nvim_tree_git_hl = 9 "0 by default, will enable file highlight for git attributes (can be used without the icons).
let g:nvim_tree_root_folder_modifier = ':~' "This is the default. See :help filename-modifiers for more options
let g:nvim_tree_tab_open = 0 "0 by default, will open the tree when entering a new tab and the tree was previously open
let g:nvim_tree_width_allow_resize  = 0 "0 by default, will not resize the tree when opening a file

" a list of groups can be found at `:help nvim_tree_highlight`
"highlight NvimTreeFolderIcon guibg=blue

"__Airline

let g:airline_theme = "palenight"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail'

"__Vim-Vue

autocmd FileType vue syntax sync fromstart
autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css

"__NerdCommenter

let g:ft = ''
function! NERDCommenter_before()
  if &ft == 'vue'
    let g:ft = 'vue'
    let stack = synstack(line('.'), col('.'))
    if len(stack) > 0
      let syn = synIDattr((stack)[0], 'name')
      if len(syn) > 0
        exe 'setf ' . substitute(tolower(syn), '^vue_', '', '')
      endif
    endif
  endif
endfunction
function! NERDCommenter_after()
  if g:ft == 'vue'
    setf vue
    let g:ft = ''
  endif
endfunction

 "__Vim-Prettier__
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

" autocmd FileType javascript set formatprg=prettier-eslint\ --stdin
" autocmd BufNewFile,BufReadPost *.vue setfiletype vue

"__Vim-Blade__

" Define some single Blade directives. This variable is used for highlighting only.
let g:blade_custom_directives = ['datetime', 'javascript']

" Define pairs of Blade directives. This variable is used for highlighting and indentation.
let g:blade_custom_directives_pairs = {
      \   'markdown': 'endmarkdown',
      \   'cache': 'endcache',
      \ }

"__Vim-Html-Tidy__

let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute " ,"trimming empty <", "unescaped &" , "lacks \"action", "is not recognized!", "discarding unexpected"]

"__Vim-Coc__

autocmd FileType json syntax match Comment +\/\/.\+$+

" __Vim-jsx__
" set filetypes as typescript.tsx
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx
" dark red
hi tsxTagName guifg=#E06C75
hi tsxComponentName guifg=#E06C75
hi tsxCloseComponentName guifg=#E06C75

" orange
hi tsxCloseString guifg=#F99575
hi tsxCloseTag guifg=#F99575
hi tsxCloseTagName guifg=#F99575
hi tsxAttributeBraces guifg=#F99575
hi tsxEqual guifg=#F99575

" yellow
hi tsxAttrib guifg=#F8BD7F cterm=italic
" light-grey
hi tsxTypeBraces guifg=#999999
" dark-grey
hi tsxTypes guifg=#666666

hi ReactState guifg=#C176A7
hi ReactProps guifg=#D19A66
hi ApolloGraphQL guifg=#CB886B
hi Events ctermfg=204 guifg=#56B6C2
hi ReduxKeywords ctermfg=204 guifg=#C678DD
hi ReduxHooksKeywords ctermfg=204 guifg=#C176A7
hi WebBrowser ctermfg=204 guifg=#56B6C2
hi ReactLifeCycleMethods ctermfg=204 guifg=#D19A66
