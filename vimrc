set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" git wrapper for vim
Plugin 'tpope/vim-fugitive'
" function/variable summary
Plugin 'majutsushi/tagbar'
" file tree viewer
Plugin 'scrooloose/nerdtree'
" comment multiple lines
Plugin 'scrooloose/nerdcommenter'
" syntax checker
Plugin 'scrooloose/syntastic'
Plugin 'easymotion/vim-easymotion'
Plugin 'powerline/powerline'
" open buffer and execute shell
Plugin 'vim-scripts/Conque-Shell'
" status/tabline
Plugin 'bling/vim-airline'
" git indicator
Plugin 'airblade/vim-gitgutter'
" various color schemes
Plugin 'flazz/vim-colorschemes'
" grammar checker, must install LanguageTool first
Plugin 'vim-scripts/LanguageTool'
" execute buffer
Plugin 'fboender/bexec'

" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'

" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'

" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
" Bundle "myusuf3/numbers.vim"
" Bundle "klen/python-mode"
" Bundle "pythoncomplete"
Bundle "tpope/vim-markdown"
Bundle "spf13/vim-preview"
Bundle "kien/ctrlp.vim"

" Show line numbers
set number
" Highlight search
set hlsearch
" Set tab width
set tabstop=8
set expandtab
set shiftwidth=8
set softtabstop=8
set autoindent
set smartindent
set cindent
" Enable mouse mode
set mouse=a
" Fold/unfold code with z+c/z+o
set foldmethod=indent
set foldlevelstart=20

" Set spell check for tex, md and txt files
" Set spell spelllang=en_us
autocmd FileType tex setlocal spell
autocmd BufRead,BufNewFile *.md setlocal spell
autocmd BufRead,BufNewFile *.txt setlocal spell
" Word completion with ctrl-N or ctrl-P
set complete+=kspell

let mapleader = ","

nmap <F8> :TagbarToggle<CR>
nmap <C-e> <plug>NERDTreeTabsToggle<CR>
nmap <leader>e :NERDTreeFind<CR>

filetype plugin on

" Tell vim to remember certain things when exit
set viminfo='10,\"100,:50,%,n~/.viminfo

" Resume to the last editing position
if has("autocmd")
        au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
                \| exe "normal! g'\"" | endif
endif

"function! ResCur()
        "if line("'\"") <= line($)
                "normal! g`"
                "return 1
        "endif
"endfunction

"augroup resCur
        "autocmd!
        "autocmd BufWinEnter * call ResCur()
"augroup END

" Copy from outside vim
if has('clipboard')
        if has ('unnamedplus')
                set clipboard=unnamed,unnamedplus "when possible use + register for copy-paste
        else
                set clipboard=unnamed "on Mac and Windows, use * register for copy-paste
        endif
endif

" recommended settings for syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list=0
let g:syntastic_auto_loc_list=0
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=1 

" let syntastic use c++11 std
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'


