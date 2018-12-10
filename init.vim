
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=700

" Enable filetype plugins
filetype plugin on
filetype indent on
syntax on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>
" jk for ESC
inoremap jk <ESC>

" Toggle Paster Mode <F10>
set pastetoggle=<F10>
set nohlsearch

set number

" command Copy execute "w !xclip -selection c -i" 
vnoremap <S-c> :w !xclip -selection c -i<CR><CR>
" using this script: https://gist.github.com/yiransheng/4c8afc79bcdc797d1be9030e4b231fda
vnoremap <leader>cf !textfmt.py --width=80<CR>

map <F11> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
			\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
			\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

nnoremap <silent> `<Right> <C-w>l
nnoremap <silent> `<Left> <C-w>h
nnoremap <silent> `<Up> <C-w>k
nnoremap <silent> `<Down> <C-w>j

map! `1 <C-R>"

nnoremap <C-j> :tabn<CR>
nnoremap <C-h> :tabp<CR> 
nnoremap <leader>e :tabe<CR>:FZF<CR>
nnoremap <leader>ee :tabe<CR>
nnoremap <leader><Enter> <S-$>i<CR><ESC>O
" http://vim.wikia.com/wiki/Replace_a_word_with_yanked_text
xnoremap p "_dP

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

"Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Group dependencies, vim-snippets depends on ultisnips
" Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-master branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Swap things
Plug 'tommcdo/vim-exchange'

Plug 'https://github.com/kassio/neoterm.git'

Plug 'https://github.com/freeo/vim-kalisi.git'

Plug 'https://github.com/heavenshell/vim-jsdoc.git'

Plug 'https://github.com/vim-airline/vim-airline.git'

Plug 'https://github.com/embear/vim-foldsearch.git'

Plug 'https://github.com/vim-scripts/BufOnly.vim.git'

Plug 'yssl/QFEnter'

Plug 'rust-lang/rust.vim'

Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }

Plug 'scrooloose/nerdcommenter'

Plug 'mxw/vim-jsx'

Plug 'derekwyatt/vim-scala'

" Plug 'brooth/far.vim'

Plug 'eugen0329/vim-esearch'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Plug 'carlitux/deoplete-ternjs'

" Plug 'ternjs/tern_for_vim'

" (Optional) Multi-entry selection UI.
" Plug 'Shougo/denite.nvim'
"

Plug 'posva/vim-vue'

Plug 'flowtype/vim-flow'

Plug 'w0rp/ale'

Plug 'jeetsukumaran/vim-buffergator'


" Add plugins to &runtimepath
call plug#end()


set background=dark
colorscheme kalisi
syntax on
" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
" set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 2 spaces
set tabstop=2 shiftwidth=2 expandtab

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines


""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?

" Disable highlight when <leader><cr> is pressed
" map <silent> <leader><cr> :noh<cr>
nnoremap <F3> :noh<return><F3>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :1,1000 bd!<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers 
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%


""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
" set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
map 0 ^

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vimgrep searching and cope displaying
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" When you press gv you vimgrep after the selected text
vnoremap <silent> gv :call VisualSelection('gv')<CR>

" Open vimgrep and put the cursor in the right position
map <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>

" Vimgreps in the current file
map <leader><space> :vimgrep // <C-R>%<C-A><right><right><right><right><right><right><right><right><right>

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace')<CR>

" Do :help cope if you are unsure what cope is. It's super useful!
"
" When you search with vimgrep, display your results in cope by doing:
"   <leader>cc
"
" To go to the next search result do:
"   <leader>n
"
" To go to the previous search results do:
"   <leader>p
"
map <leader>cc :botright cope<cr>
map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
map <leader>n :cn<cr>
map <leader>p :cp<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

let g:NERDSpaceDelims = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

map <C-f> :FZF<CR>

command! -nargs=+ Jsf execute 'silent lgrep! -rnw --exclude-dir={node_modules,dist,bower_components} --includ=*.{js,jsx} <args> ./' | lopen 30
command! -nargs=+ Js execute 'new | r ! grep -rnw -h --exclude-dir={node_modules,dist,bower_components} --includ=*.{js,jsx} <args> ./'
command! -nargs=+ Less execute 'silent lgrep! -rnw --exclude-dir={node_modules,dist,bower_components} --includ=*.{less,css} <args> ./' | lopen 30

inoremap {<cr> {<cr>}<c-o>O
inoremap [<cr> [<cr>]<c-o>O
inoremap (<cr> (<cr>)<c-o>O

" Delete All but current buffer
nnoremap dbb :BufOnly<CR>
nnoremap dsp :on<CR>
nnoremap <Leader>lc :lclose<CR>:cclose<CR>

tnoremap <Esc> <C-\><C-n>

autocmd FileType javascript setlocal formatprg=prettier\ --stdin
autocmd FileType json setlocal formatprg=jsonpp5\ --stdin
autocmd FileType rust setlocal formatprg=rustfmt
autocmd FileType vue setlocal formatprg=prettier\ --stdin
autocmd FileType css setlocal formatprg=postcss\ --no-map\ -u\ postcss-prettify


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Deoplete
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:deoplete#enable_at_startup = 1
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
set completeopt-=preview

" Use deoplete.
let g:tern_request_timeout = 1
let g:tern_show_signature_in_pum = '0'  " This do disable full signature type on autocomplete

" Use tern_for_vim.
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]

"Add extra filetypes
let g:tern#filetypes = [
                \ 'jsx',
                \ 'javascript.jsx',
                \ 'vue',
                \ ]





"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Flow
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:flow#showquickfix = 0
let g:flow#enable = 0
let g:flow#timeout = 5

let g:ale_linters = {
\   'javascript': ['flow'],
\}

let g:ale_completion_enabled = 0
let g:ale_lint_on_text_changed = 'never'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Rust
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:rustfmt_autosave = 1

autocmd BufReadPost *.rs setlocal filetype=rust

" Required for operations modifying multiple buffers like rename.
set hidden

" \ 'javascript': ['flow-language-server', '--stdio', '--try-flow-bin'],
" \ 'javascript.jsx': ['flow-language-server', '--stdio', '--try-flow-bin']
"
let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'nightly', 'rls']
    \ }

" Automatically start language servers.
let g:LanguageClient_autoStart = 1

" Maps K to hover, gd to goto definition, F2 to rename
nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <leader>gd :call LanguageClient_textDocument_references()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()

" Auto complete
autocmd FileType rust setlocal completefunc=LanguageClient#complete

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim esearch
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:esearch = {
  \ 'adapter':    'rg',
  \ 'backend':    'nvim',
  \ 'out':        'win',
  \ 'batch_size': 1000,
  \ 'use':        ['visual', 'hlsearch', 'last', 'word_under_cursor'],
  \}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => neoterm
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:neoterm_size = 15
