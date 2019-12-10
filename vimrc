" Environment {
        " Must be first line, be IMproved
        set nocompatible 
" }

" Vundle config for plugins { 
        filetype off                  " required

        " set the runtime path to include Vundle and initialize
        set rtp+=~/.vim/bundle/Vundle.vim
        set rtp+=~/.fzf

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
        Plugin 'Xuyuanp/nerdtree-git-plugin'
        " syntax checker
        Plugin 'scrooloose/syntastic'
        Plugin 'easymotion/vim-easymotion'
        Plugin 'powerline/powerline'
        " open buffer and execute shell
        Plugin 'vim-scripts/Conque-Shell'
        " status/tabline
        Plugin 'vim-airline/vim-airline'
        Plugin 'vim-airline/vim-airline-themes'
        " git indicator
        Plugin 'airblade/vim-gitgutter'
        " various color schemes
        Plugin 'flazz/vim-colorschemes'
        " grammar checker, must install LanguageTool first
        Plugin 'vim-scripts/LanguageTool'
        " execute buffer
        Plugin 'fboender/bexec'
        " call tree/call graph, require cscope and ccglue
        " FIXME: install and config ccglue
        Plugin 'hari-rangarajan/CCTree'
        " tag and browse
        Plugin 'vim-scripts/taglist.vim'
        " syntax highlight, match, map for Markdown
        Plugin 'godlygeek/tabular'
        Plugin 'plasticboy/vim-markdown'
        " fuzzy finder
        Plugin 'ctrlpvim/ctrlp.vim'
        " undo brances in Vim 7.0
        Plugin 'mbbill/undotree'
        " dash, exclusively for Mac
        Plugin 'rizzatti/dash.vim'
        " pymode
        Plugin 'klen/python-mode'
        " auto code completion
        "Plugin 'Valloric/YouCompleteMe'

        " plugin from http://vim-scripts.org/vim/scripts.html
        " Plugin 'L9'

        " Git plugin not hosted on GitHub
        Plugin 'git://git.wincent.com/command-t.git'
        
        " Rust lang
        Plugin 'rust-lang/rust.vim'

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
" }

let g:NERDTreeQuitOnOpen=0
let g:NERDTreeWinPos='right'
let g:syntastic_always_populate_loc_list=0
let g:syntastic_auto_loc_list=0
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=1
" disable syntastic for python files
let g:syntastic_mode_map={'passive_filetypes': ['python']}
" let syntastic use c++11 std
let g:syntastic_cpp_compiler_options=' -std=c++11 '

" Gitgutter line threshold
let g:gitgutter_max_signs=5000

" boost up pymode by disable rope
let g:pymode_rope=0
let g:pymode_python='python3.7'

" General {
        " For MacBookPro: syntax is not on
        syntax on
        
        " Copy from outside vim
        if has('clipboard')
                if has ('unnamedplus')
                        set clipboard=unnamed,unnamedplus "when possible use + register for copy-paste
                else
                        set clipboard=unnamed "on Mac and Windows, use * register for copy-paste
                endif
        endif

        " Set spell check for tex, md and txt files
        " Don't do spell check for c, cpp, python etc.
        " Set spell spelllang=en_us
        autocmd FileType tex setlocal spell
        autocmd BufRead,BufNewFile *.md setlocal spell
        autocmd BufRead,BufNewFile *.txt setlocal spell
        " Word completion with ctrl-N or ctrl-P
        set complete+=kspell
        
        " Use 4 spaces tab for tex files
        autocmd Filetype tex setlocal ts=4 sw=4 sts=0 expandtab
        autocmd Filetype bib setlocal ts=4 sw=4 sts=0 expandtab
        autocmd Filetype c setlocal ts=8 sw=8 sts=0 expandtab
        autocmd Filetype cpp setlocal ts=4 sw=4 sts=0 expandtab
        autocmd BufRead,BufNewFile *.cpp set colorcolumn=81
        autocmd BufRead,BufNewFile *.md set colorcolumn=81
        autocmd BufRead,BufNewFile *.txt set colorcolumn=81
        autocmd BufRead,BufNewFile *.tex set colorcolumn=81

        " Save tons of history
        set history=1000
        " Tell vim to remember certain things when exit
        set viminfo='10,\"100,:50,%,n~/.viminfo
        
        " Resume to the last editing position
        if has("autocmd")
                au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
                        \| exe "normal! g'\"" | endif
        endif

        " Backup are nice but must be neatly grouped, see
        " InitializeDirectory()
        set backup
        if has('persistent_undo')
                set undofile
                " Max #changes that can be undo
                set undolevels=1000
                " Max #lines to save for undo on a buffer reload
                set undoreload=10000
        endif
" }

" Vim UI {
        set showmode
        set cursorline
        colorscheme xemacs
        highlight clear SignColumn
        highlight clear LineNr

        if has('cmdline_info')
                set ruler
                set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
                set showcmd
        endif

        if has('statusline')
                set laststatus=2
                set statusline=%<%f\
                set statusline+=%w%h%m%r
        
                " Git Hotness
                set statusline+=%{fugitive#statusline()}
                
                " Filetype
                set statusline+=\ [%{&ff}/%Y]
                
                " Current dir
                set statusline+=\ [%{getcwd()}]
                
                " Right aligned file nav info
                "set statusline+=%=%-14.(%l,%c%V)\ %p%%
                
                " recommended settings for syntastic
                set statusline+=%#warningmsg#
                set statusline+=%{SyntasticStatuslineFlag()}
                set statusline+=%*
        endif
        
        " for MacBookPro: backspace
        " won't delete over line breaks, 
        " or automatically-inserted indentation, 
        " or the place where insert mode started 
        set backspace=indent,eol,start
        
        " Show line numbers
        set number
        
        " Highlight search
        set hlsearch
        
        " Show matching brackets/parenthesis
        set showmatch
        set incsearch
        
        " Case insensitive search
        set ignorecase
        set smartcase
        
        " Enable mouse mode
        set mouse=a
        
        " Fold/unfold code with z+c/z+o
        set foldmethod=indent
        set foldlevelstart=20

        " Put new splited window right/below to the current one
        set splitright
        set splitbelow

        " Disable doc window in pymode
        set completeopt=menu
" }

" Formatting {
        " Prefer wrap line
        set wrap
        " Set tab width for C
        " Turn on filetype
        filetype plugin on
        set tabstop=4
        set expandtab
        set shiftwidth=4
        set softtabstop=4
        set autoindent
        set smartindent
        set cindent
        autocmd FileType c setlocal ts=8 sw=8 sts=8 expandtab
" }

" Key Mappings {
        let mapleader = ","
        " Yank from the cursor to the end of the line
        nnoremap Y y$
        " Toggle search highlight
        nmap <slient> <leader>/ :nohlsearch<CR>
        " Find merge conflict markers
        map <leader>fc /\v^[<\|=>]{7}( .*\|$)<CR>
        
        " NERDTree {
                map <C-e> <plug>NERDTreeTabsToggle<CR>
                map <leader>e :NERDTreeFind<CR>
                nmap <leader>nt :NERDTreeFind<CR>
                let NERDTreeShowBookmarks=1
                let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
                let NERDTreeChDirMode=0
                let NERDTreeQuitOnOpen=1
                let NERDTreeMouseMode=2
                let NERDTreeShowHidden=1
                let NERDTreeKeepTreeInNewTab=1
                let g:nerdtree_tabs_open_on_gui_startup=0
        " }
        
        " TagBar {
                nmap <F8> :TagbarToggle<CR>                
        " }

        " Fugitive {
                if isdirectory(expand("~/.vim/bundle/vim-fugitive/"))
                        nnoremap <silent> <leader>gs :Gstatus<CR>
                        nnoremap <silent> <leader>gd :Gdiff<CR>
                        nnoremap <silent> <leader>gc :Gcommit<CR>
                        nnoremap <silent> <leader>gb :Gblame<CR>
                        nnoremap <silent> <leader>gl :Glog<CR>
                        nnoremap <silent> <leader>gp :Git push<CR>
                        nnoremap <silent> <leader>gr :Gread<CR>
                        nnoremap <silent> <leader>gw :Gwrite<CR>
                        nnoremap <silent> <leader>ge :Gedit<CR>
                        " Mnemonic _i_nteractive
                        nnoremap <silent> <leader>gi :Git add -p %<CR>
                        nnoremap <silent> <leader>gg :SignifyToggle<CR>
                endif
        "}
        
        " UndoTree {
                nnoremap <leader>u :UndotreeToggle<CR>
                let g:undotree_SetFocusWhenToggle=1
        " }

" }

" CSCOPE {
        """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        " CSCOPE settings for vim           
        """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        "
        " This file contains some boilerplate settings for vim's cscope interface,
        " plus some keyboard mappings that I've found useful.
        "
        " USAGE: 
        " -- vim 6:     Stick this file in your ~/.vim/plugin directory (or in a
        "               'plugin' directory in some other directory that is in your
        "               'runtimepath'.
        "
        " -- vim 5:     Stick this file somewhere and 'source cscope.vim' it from
        "               your ~/.vimrc file (or cut and paste it into your .vimrc).
        "
        " NOTE: 
        " These key maps use multiple keystrokes (2 or 3 keys).  If you find that vim
        " keeps timing you out before you can complete them, try changing your timeout
        " settings, as explained below.
        "
        " Happy cscoping,
        "
        " Jason Duell       jduell@alumni.princeton.edu     2002/3/7
        """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

        " This tests to see if vim was configured with the '--enable-cscope' option
        " when it was compiled.  If it wasn't, time to recompile vim... 
        if has("cscope")

                """"""""""""" Standard cscope/vim boilerplate

                " use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
                set cscopetag

                " check cscope for definition of a symbol before checking ctags: set to 1
                " if you want the reverse search order.
                set csto=0

                " add any cscope database in current directory
                if filereadable("cscope.out")
                        cs add cscope.out  
                        " else add the database pointed to by environment variable 
                        elseif $CSCOPE_DB != ""
                        cs add $CSCOPE_DB
                endif

                " show msg when any other cscope db added
                set cscopeverbose  


                """"""""""""" My cscope/vim key mappings
                "
                " The following maps all invoke one of the following cscope search types:
                "
                "   's'   symbol: find all references to the token under cursor
                "   'g'   global: find global definition(s) of the token under cursor
                "   'c'   calls:  find all calls to the function name under cursor
                "   't'   text:   find all instances of the text under cursor
                "   'e'   egrep:  egrep search for the word under cursor
                "   'f'   file:   open the filename under cursor
                "   'i'   includes: find files that include the filename under cursor
                "   'd'   called: find functions that function under cursor calls
                "
                " Below are three sets of the maps: one set that just jumps to your
                " search result, one that splits the existing vim window horizontally and
                " diplays your search result in the new window, and one that does the same
                " thing, but does a vertical split instead (vim 6 only).
                "
                " I've used CTRL-\ and CTRL-@ as the starting keys for these maps, as it's
                " unlikely that you need their default mappings (CTRL-\'s default use is
                " as part of CTRL-\ CTRL-N typemap, which basically just does the same
                " thing as hitting 'escape': CTRL-@ doesn't seem to have any default use).
                " If you don't like using 'CTRL-@' or CTRL-\, , you can change some or all
                " of these maps to use other keys.  One likely candidate is 'CTRL-_'
                " (which also maps to CTRL-/, which is easier to type).  By default it is
                " used to switch between Hebrew and English keyboard mode.
                "
                " All of the maps involving the <cfile> macro use '^<cfile>$': this is so
                " that searches over '#include <time.h>" return only references to
                " 'time.h', and not 'sys/time.h', etc. (by default cscope will return all
                " files that contain 'time.h' as part of their name).


                " To do the first type of search, hit 'CTRL-\', followed by one of the
                " cscope search types above (s,g,c,t,e,f,i,d).  The result of your cscope
                " search will be displayed in the current window.  You can use CTRL-T to
                " go back to where you were before the search.  
                "

                nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>	
                nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>	
                nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>	
                nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>	
                nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>	
                nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>	
                nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
                nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>	


                " Using 'CTRL-spacebar' (intepreted as CTRL-@ by vim) then a search type
                " makes the vim window split horizontally, with search result displayed in
                " the new window.
                "
                " (Note: earlier versions of vim may not have the :scs command, but it
                " can be simulated roughly via:
                "    nmap <C-@>s <C-W><C-S> :cs find s <C-R>=expand("<cword>")<CR><CR>	

                nmap <C-@>s :scs find s <C-R>=expand("<cword>")<CR><CR>	
                nmap <C-@>g :scs find g <C-R>=expand("<cword>")<CR><CR>	
                nmap <C-@>c :scs find c <C-R>=expand("<cword>")<CR><CR>	
                nmap <C-@>t :scs find t <C-R>=expand("<cword>")<CR><CR>	
                nmap <C-@>e :scs find e <C-R>=expand("<cword>")<CR><CR>	
                nmap <C-@>f :scs find f <C-R>=expand("<cfile>")<CR><CR>	
                nmap <C-@>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>	
                nmap <C-@>d :scs find d <C-R>=expand("<cword>")<CR><CR>	


                " Hitting CTRL-space *twice* before the search type does a vertical 
                " split instead of a horizontal one (vim 6 and up only)
                "
                " (Note: you may wish to put a 'set splitright' in your .vimrc
                " if you prefer the new window on the right instead of the left

                nmap <C-@><C-@>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
                nmap <C-@><C-@>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
                nmap <C-@><C-@>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
                nmap <C-@><C-@>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
                nmap <C-@><C-@>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
                nmap <C-@><C-@>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>	
                nmap <C-@><C-@>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>	
                nmap <C-@><C-@>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>


                """"""""""""" key map timeouts
                "
                " By default Vim will only wait 1 second for each keystroke in a mapping.
                " You may find that too short with the above typemaps.  If so, you should
                " either turn off mapping timeouts via 'notimeout'.
                "
                "set notimeout 
                "
                " Or, you can keep timeouts, by uncommenting the timeoutlen line below,
                " with your own personal favorite value (in milliseconds):
                "
                "set timeoutlen=4000
                "
                " Either way, since mapping timeout settings by default also set the
                " timeouts for multicharacter 'keys codes' (like <F1>), you should also
                " set ttimeout and ttimeoutlen: otherwise, you will experience strange
                " delays as vim waits for a keystroke after you hit ESC (it will be
                " waiting to see if the ESC is actually part of a key code like <F1>).
                "
                "set ttimeout 
                "
                " personally, I find a tenth of a second to work well for key code
                " timeouts. If you experience problems and have a slow terminal or network
                " connection, set it higher.  If you don't set ttimeoutlen, the value for
                " timeoutlent (default: 1000 = 1 second, which is sluggish) is used.
                "
                "set ttimeoutlen=100

        endif
" }


" Initialize directories for ~ and swp files {
        function! InitializeDirectories()
                let parent = $HOME
                let prefix = 'vim'
                let dir_list = {
                            \ 'backup': 'backupdir',
                            \ 'views': 'viewdir',
                            \ 'swap': 'directory' }

                if has('persistent_undo')
                        let dir_list['undo'] = 'undodir'
                endif

                " To specify a different directory in which to place the vimbackup,
                " vimviews, vimundo, and vimswap files/directories, add the following to
                " your .vimrc.before.local file:
                "   let g:spf13_consolidated_directory = <full path to desired directory>
                "   eg: let g:spf13_consolidated_directory = $HOME . '/.vim/'
                if exists('g:spf13_consolidated_directory')
                        let common_dir = g:spf13_consolidated_directory . prefix
                else
                        let common_dir = parent . '/.' . prefix
                endif

                for [dirname, settingname] in items(dir_list)
                        let directory = common_dir . dirname . '/'
                        if exists("*mkdir")
                                if !isdirectory(directory)
                                        call mkdir(directory)
                                endif
                        endif
                        if !isdirectory(directory)
                                echo "Warning: Unable to create backup directory: " . directory
                                echo "Try: mkdir -p " . directory
                        else
                                let directory = substitute(directory, " ", "\\\\ ", "g")
                                exec "set " . settingname . "=" . directory
                        endif
                endfor
                endfunction
        call InitializeDirectories()
" }


