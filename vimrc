" To ignore plugin indent changes, instead use:
filetype plugin indent on

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
set softtabstop=4 noexpandtab
set shiftwidth=4
set wildmenu
set showmatch
set incsearch
set hlsearch
set list
colorscheme peachpuff
let g:airline_theme='term'

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
set foldmethod=syntax
set foldnestmax=1
set foldlevel=1
set foldopen-=block  " Skip over folds when using { or }
set nofoldenable
map <space> za

augroup vimrc
	autocmd!

	" Python folding setting
	autocmd FileType python setlocal foldenable foldmethod=indent

	" Automatically reload vimrc when it's saved
	au BufWritePost .vimrc so ~/.vimrc
	" Automatically trim extra whitespace before saving
	autocmd BufWritePre * %s/\s\+$//e
augroup END

" Add Vim runtime plugins
runtime ftplugin/man.vim
