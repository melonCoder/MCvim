set nocompatible                             "close compatible mode to avoid previous bugs
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set number                                   "show row number
set ruler                                    "display current cursor
set guifont=Courier_New:h10:cANSI            "set font
set nobackup                                 "no auto backup
color molokai                                
set tabstop=4
set shiftwidth=2
set expandtab                                "tab --> space
"set noexpandtab                             "space --> tab
":%retab!                                    "formatting
syntax on                                
set backspace=indent,eol,start
set autoindent
set smartindent

set tw=73
set fo+=tcja "check h:fo-table for more details
"Mark ideal text width settings
if v:version >= 703
    set colorcolumn=+1
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""VUNDLE SETTING""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
"
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
"
" Install your plugin here
Plugin 'scrooloose/nerdtree'
Plugin 'vim-scripts/taglist.vim'
"
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}
"
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" To ignore plugin indent changes, instead use:
" filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""END OF VUNDLE SETTING"""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""keyword searching""""""""""""""
set ignorecase smartcase   " not case sensetive, 
                           " case sensetive for uppercase keyword
set nowrapscan             " stop search at both end of file
set incsearch              " incremental
set hlsearch               " highlight

"""""""""""""""""""bracket"""""""""""""""""""
set showmatch                                "show matched bracket
set matchtime=2                              

:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
:inoremap { {}<ESC>i
:inoremap } <c-r>=ClosePair('}')<CR>
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
:inoremap " ""<ESC>i
:inoremap ' ''<ESC>i
function! ClosePair(char)                   "remove duplicated bracket
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endfunction


""""""""""""""""""""tag""""""""""""""""""""""
set tags=tags;
set autochdir
map<C-n> :tnext<CR>
"extra: +f(add file name as tags), +q(emphasize class for java and C++)
map<C-F12> :!ctags -R                        
  \--extra=+fq                               
  \--fields=+Saim 
  \--c++-kinds=+lpx 
  \--c-kinds=+lpx .<CR><CR>
map<F12> :!ctags -R 
  \--java-kinds=+l 
  \--extra=+fq .<CR><CR>                             
"""""""""""""""""""""Tlist""""""""""""""""""""
map<F3> :silent! Tlist<CR>
let Tlist_Ctags_Cmd='ctags'
let Tlist_Use_Right_Window=1                  "tags in right side
let Tlist_Sort_Type="name"                    "sort by name
let Tlist_Exit_OnlyWindow=1                   "auto-close 
let Tlist_Show_One_File=1                     "only show current file tag
if &diff
  let Tlist_Auto_Open=0 "turn off auto-open in diff mode
else
  let Tlist_Auto_Open=1 "auto pen Tlist when open a file
endif
let Tlist_Auto_Update=1

""""""""""""""""""NerdTree""""""""""""""""""""
map<F2> :silent! NERDTree<CR>
let NERDTreeDirArrows=1                       "use arrow instead of plus
let NERDTreeShowBookmarks=1                   "show bookmard

autocmd!   BufNewFile,BufRead *               "disable auto-fold
setlocal nofoldenable
