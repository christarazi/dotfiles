" Mandatory for Vundle
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
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
"Plugin 'ascenator/L9', {'name': 'newL9'}

" Install tComment plugin
Plugin 'tComment'

" Install additional C++ highlighting
Plugin 'octol/vim-cpp-enhanced-highlight'

" Install vim-autoformat plugin
Plugin 'Chiel92/vim-autoformat'

" Install sessible plugin
Plugin 'tpope/vim-sensible'

" Install NERD Tree plugin
Plugin 'scrooloose/nerdtree'

" Install my fork of Smart Tabs plugin
Plugin 'christarazi/Smart-Tabs'

" Install SuperTab
Plugin 'ervandew/supertab'

" Install ControlP
Plugin 'kien/ctrlp.vim'

" Install obsession
Plugin 'tpope/obsession'

" Install vim-airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Airline customizations
let g:airline#extensions#obsession#enabled = 1
let g:airline#extensions#obsession#indicator_text = '$'

" All of your Plugins must be added before the following line
call vundle#end()            " required

" To ignore plugin indent changes, instead use:
filetype plugin indent on

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
""" END OF VUNDLE CONFIG

" Powerline installation
let s:POWERLINE = system('which powerline')
if !empty(s:POWERLINE) && !v:shell_error
    if has('python3')
        let s:python = 'python3'
    else
        let s:python = 'python'
    endif

    exec(s:python . ' from powerline.vim import setup as powerline_setup')
    exec(s:python . ' powerline_setup()')
    exec(s:python . ' del powerline_setup')
else
    " echoerr 'Powerline not installed.'
endif

" Powerline specific settings
set laststatus=2  " Always display the statusline in all windows
set showtabline=2 " Always display the tabline, even if there is only one tab
set noshowmode    " Hide the default mode text (e.g. -- INSERT -- below the statusline)

" Display line numbers and turn on syntax highlighting
set number
set relativenumber
set synmaxcol=200
syntax on

" Show commands in lower right hand corner
set showcmd

" Define leader key to be comma
let mapleader = ','

" Define leader key + c to command/uncomment using tComment
map <leader>c <c-_><c-_>

set tabstop=4
set softtabstop=4 expandtab
set shiftwidth=4
set wildmenu
set showmatch
set incsearch
set hlsearch
set list

""" colorscheme specific settings
" src: https://superuser.com/a/562423
set t_ut=
let base16colorspace=256  " Access colors present in 256 colorspace
colorscheme base16-tomorrow-night
""" End of colorscheme specific settings

" allows cursor change in tmux mode
" if exists('$TMUX')
" 	let &t_SI = '\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\'
" 	let &t_EI = '\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\'
" else
" 	let &t_SI = '\<Esc>]50;CursorShape=1\x7'
" 	let &t_EI = '\<Esc>]50;CursorShape=0\x7'
" endif

" Tab navigation like Firefox.
nnorema <leader><tab>       :tabprevious<CR>
nnoremap <leader><tab>      :tabnext<CR>
nnoremap <leader>t          :tabnew<CR>
nnoremap <leader><Delete>   :tabclose<CR>
inoremap <leader><S><tab>   <Esc>:tabprevious<CR>i
inoremap <leader><tab>      <Esc>:tabnext<CR>i
inoremap <leader>t          <Esc>:tabnew<CR>

" Map Ctrl-n to open NERD Tree
map <C-n> :NERDTreeToggle<CR>

" Map save and quit shortcuts
map <C-z> :write<CR>
map <C-x> :quit<CR>

" Pressing <Enter> in normal mode will enter insert mode
nnoremap <Enter> i

" Open tag in new tab <leader><C-]>
nnoremap <leader><C-]> <C-w><C-]><C-w>T

" Toggle spell check mapped to <leader>s
nnoremap <leader>s :set spell!<CR>

" Toggle paste mode mapped to <leader>p
nnoremap <leader>p :set paste!<CR>

" Remove search highlight
nnoremap <leader>/ :noh<CR>

" Map j, k to gj, gk for long wrapped lines
nnoremap j gj
nnoremap k gk

" Code folding
autocmd FileType python setlocal foldenable foldmethod=indent
set foldmethod=syntax
set foldnestmax=1
set foldlevel=1
set foldopen-=block  " Skip over folds when using { or }
set nofoldenable
map <space> za

" automatically reload vimrc when it's saved
au BufWritePost .vimrc so ~/.vimrc

" automatically trim extra whitespace before saving
" autocmd BufWritePre * %s/\s\+$//e

" Mapping to save/remove session
nnoremap <leader>S :Obsession<CR>
nnoremap <leader>R :Obsession!<CR>

" Add Vim runtime plugins
runtime ftplugin/man.vim
