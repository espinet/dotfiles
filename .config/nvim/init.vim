set nocompatible " don't bother with vi compatibility

" colorscheme molokai

call plug#begin('~/.vim/plugged')

Plug 'mileszs/ack.vim' " text search
let g:ackprg = 'ag --nogroup --nocolor --column' " use ag instead of ack

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
let g:deoplete#enable_at_startup = 1
" tab completion for deoplete
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' } "asyncronous javascript autocomplete

Plug 'myusuf3/numbers.vim'
let g:enable_numbers = 1
let g:numbers_exclude = ['tagbar','nerdtree']

Plug 'Lokaltog/vim-easymotion'
map  <leader>f <Plug>(easymotion-bd-f)
nmap <leader>f <Plug>(easymotion-overwin-f)

Plug 'airblade/vim-gitgutter'
let g:gitgutter_eager = 0
let g:gitgutter_enabled = 1
let g:gitgutter_highlight_lines = 0
let g:gitgutter_map_keys = 0 " don't let gitgutter set any mappings
let g:gitgutter_realtime = 1
let g:gitgutter_signs = 1

Plug 'plasticboy/vim-markdown'

Plug 'tpope/vim-sensible' " some sane defaults for vim
Plug 'tpope/vim-sleuth' " autodetect and follow files indentation standard

" Seemless navigation between vim and tmux panes
Plug 'christoomey/vim-tmux-navigator'
nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
let g:tmux_navigator_disable_when_zoomed = 1 " disable tmux navigator when zooming the Vim pane
let g:tmux_navigator_no_mappings = 1
let g:tmux_navigator_save_on_switch = 2 " write all buffers before navigating from Vim to tmux pane

" Add the following to the first line of *.sql file
" -- -h localhost -U postgres -d my_database
" or
" -- db:mysql -D my_database -u root
Plug 'ivalkeen/vim-simpledb'

Plug 'tpope/vim-surround'
" Plug 'scrooloose/syntastic'

" Relearn these
" Plug 'xolox/vim-easytags'

" Plug 'majutsushi/tagbar'
" nmap <F1> :TagbarToggle<CR>

" Plug 'Shougo/unite.vim'
" Plug 'tpope/vim-fugitive'
" Plug 'gregsexton/gitv'

" Remove or replace these
" Plug 'xolox/vim-misc'
" Plug 'tomasr/molokai'

call plug#end()

set autoread " reload files when changed on disk, i.e. via `git checkout`
set backupcopy=yes " see :help crontab
set backspace=2 " make backspace work normally in insert mode
set colorcolumn=100
set clipboard=unnamed " yank and paste with the system clipboard
set directory-=. " don't store swapfiles in the current directory
set encoding=utf-8
set expandtab
" set foldmethod=syntax " kind of folding applies in the current window
set foldlevelstart=1000
set guifont=Meslo\ LG\ S\ DZ\ Regular\ for\ Powerline
set hidden " keep the changes to the buffer without writing them to the file
set history=1000
set hlsearch " highlight search terms
set ignorecase " case-insensitive search
set laststatus=2 " always show statusline
set list " show trailing whitespace
set listchars=tab:▸\ ,eol:¬ " replace tab with arrow and eol with not
set mouse=a " enable basic mouse behavior such as resizing buffers.
set noerrorbells " no beep occurs when an error message is displayed
set noswapfile
set nowrap " turn of word-wrap
set number " display line numbers
set ruler " show where you are
set scrolloff=3 " show context above/below cursorline
set scrolljump=5 " lines to scroll when cursor leaves screen
set showmatch
set shiftwidth=2 " show context above/below cursorline
set showcmd
set smartcase " ignore case if search is lower-case
set softtabstop=2 " insert mode tab and backspace use 2 spaces
set splitbelow " Puts new split windows to the bottom of the current
set splitright " puts new vsplit windows to the right of the current
set t_Co=256
set tabstop=8 " actual tabs occupy 8 characters
set timeoutlen=1000 ttimeoutlen=10
set title " make xterm inherit the title from Vim
set undolevels=1000
set visualbell " use visual bell instead of beeping when doing something wrong
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc
set wildmenu " show a navigable menu for tab completion
set wildmode=longest,list,full

let mapleader = " "

if exists('$TMUX') " fix cursor in TMUX
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else " fix cursor in term
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" Operator Mono font setup
hi Comment gui=italic cterm=italic
hi htmlArg gui=italic cterm=italic

" File type management
autocmd BufRead,BufNewFile *.fdoc set filetype=yaml " set fdoc as yaml file
autocmd BufRead,BufNewFile *.md set filetype=markdown " md as markdown file
autocmd BufRead,BufNewFile *.md set spell " add spell correction to markdown

function! StripTrailingWhitespace()
  let lineNumber = line(".")
  %s/\ *$//g "\<CR>"
  let @/ = "" "\<CR>"
  exe ":" lineNumber
endfunction
autocmd BufWritePre <buffer> call StripTrailingWhitespace()

autocmd VimResized * :wincmd = " automatically rebalance windows on vim resize

" shortcuts
nmap <silent><leader>cp :let @* = expand("%:p")<CR>
nmap <leader>l :bnext<CR>
nmap <leader>h :bprev<CR>
imap jk <Esc>
imap kj <Esc>

" tagbar
" let g:tabular_loaded = 1
" let g:tagbar_width = 34
