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
Plugin 'tpope/vim-fugitive'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'easymotion/vim-easymotion'
Plugin 'powerline/powerline'
Plugin 'vim-scripts/Conque-Shell'
Plugin 'bling/vim-airline'

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


set number
set hlsearch
set tabstop=8
set expandtab
set shiftwidth=8
set softtabstop=8
set autoindent
set smartindent
set cindent
set mouse=a
set foldmethod=indent
set foldlevelstart=20

let mapleader = ","

nmap <F8> :TagbarToggle<CR>
nmap <C-e> <plug>NERDTreeTabsToggle<CR>
nmap <leader>e :NERDTreeFind<CR>

filetype plugin on

if has("autocmd")
        au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") 
                \| exe "normal! g'\"" | endif
endif

if has('clipboard')
        if has ('unnamedplus')
                set clipboard=unnamed,unnamedplus "when possible use + register for copy-paste
        else
                set clipboard=unnamed "on Mac and Windows, use * register for copy-paste
        endif
endif

