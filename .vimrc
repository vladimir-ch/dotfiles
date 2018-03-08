" Plugins "{{{
" Download vim-plug if missing.
if empty(glob("~/.vim/autoload/plug.vim"))
	silent! execute '!curl -fsSLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	autocmd VimEnter * silent! PlugInstall
endif

call plug#begin()

Plug 'airblade/vim-gitgutter'
Plug 'altercation/vim-colors-solarized'
Plug 'dag/vim-fish'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'itchyny/lightline.vim'
Plug 'majutsushi/tagbar'
Plug 'rhysd/vim-clang-format'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'wincent/command-t', { 'do': 'cd ruby/command-t/ext/command-t && ruby extconf.rb && make' }

Plug 'inkarkat/vim-ingo-library'
Plug 'inkarkat/vim-mark'

" Plug 'elzr/vim-json', {'for' : 'json'}
" Plug 'corylanou/vim-present', {'for' : 'present'}
" Plug 'Shougo/neocomplete.vim'
" Plug 'sourcegraph/sourcegraph-vim', {'for': ['go']}
" Plug 'kana/vim-operator-user'
" Plug 'tpope/vim-git'
" Plug 'tpope/vim-repeat'
" Plug 'tpope/vim-scriptease'
" Plug 'tpope/vim-sleuth'
" Plug 'tpope/vim-surround'
" Plug 'tpope/vim-vinegar'
" Plug 'MarcWeber/vim-addon-mw-utils'
" Plug 'tomtom/tlib_vim'
" Plug 'garbas/vim-snipmate'
" Plug 'honza/vim-snippets'
" Plug 'shemerey/vim-project'
" Plug 'DoxygenToolkit.vim'
" Plug 'JuliaLang/julia-vim'
" Plug 'scrooloose/syntastic'
" Plug 'msanders/snipmate.vim' # triggers completion even after whitespace
" Plug 'Lokaltog/vim-easymotion'

call plug#end()

set rtp+=$GOPATH/src/github.com/golang/lint/misc/vim
"}}}
" Settings "{{{
set shell=/bin/bash
set autowrite
set cursorline
set encoding=utf-8
set fileformats=unix,dos,mac
set nojoinspaces
set nowrap
set scrolloff=5
set showcmd
set spelllang=en_us
set synmaxcol=400
set textwidth=80
set ttyfast
set ttymouse=xterm2
set whichwrap=b,s,<,>,[,]

set autoindent
set noexpandtab

set ignorecase
set smartcase
set hlsearch

set splitbelow
set splitright

set foldcolumn=4
set number
set relativenumber

set completeopt=longest,menuone,preview
" set completeopt=menu,menuone
" set completeopt=menu,menuone,longest

set wildignore=*.dll,*.o,*.obj,*.bak,*.exe,*.pyc,*.swp,*.jpg,*.gif,*.png,*.pdf
set wildignorecase
set wildmode=longest,list:longest,full

set formatoptions+=j " Delete comment character when joining commented lines.
set formatoptions+=c " Auto-wrap comments using textwidth.
set formatoptions-=o " Don't insert comment leader after hitting 'o'.
set formatoptions-=r " Don't insert comment leader after hitting 'o'.
set formatoptions+=q " Allow formatting of comments with "gq".
"}}}
" Keybindings "{{{
let mapleader=';'
let g:mapleader=';'

" Use jk in insert mode to escape to normal mode.
inoremap jk <Esc>

" Fast saving.
map <Leader>w :w!<CR>
map <Leader>W :wq!<CR>

" Go to start of line
noremap H ^
" Go to end of line
noremap L $

" Quit the current window
map <Leader>q :q!<CR>
" Quit all windows
map <Leader>Q :qa!<CR>

" Edit alternate file
nmap <C-e> :e#<CR>

" Go to next buffer
nmap <C-n> :bnext<CR>
" Go to previous buffer
nmap <C-p> :bprev<CR>

" Open a closed fold or close an open fold
nmap <space> za

nmap <F3> :TagbarToggle<CR>

nmap <F4> :NERDTreeToggle<CR>

" Toggle syntax highlighting.
nmap <F5> :if exists("g:syntax_on") <Bar>
	\   syntax off <Bar>
	\ else <Bar>
	\   syntax enable <Bar>
	\ endif <CR>

" Toggle display of unprintable characters.
nmap <F6> :set list!<CR>

" Toggle spell checking on and off with ';s'.
nmap <silent> <leader>s :set spell!<CR>
"}}}
" Go {{{
let g:go_fmt_fail_silently = 0
let g:go_fmt_command = "goimports"

au FileType go nmap <Leader>s  <Plug>(go-def-split)
au FileType go nmap <Leader>v  <Plug>(go-def-vertical)
au FileType go nmap <Leader>i  <Plug>(go-info)
au FileType go nmap <Leader>l  <Plug>(go-metalinter)
au FileType go nmap <Leader>r  <Plug>(go-run)
au FileType go nmap <Leader>b  <Plug>(go-build)
au FileType go nmap <Leader>T  <Plug>(go-test)
au FileType go nmap <Leader>dt <Plug>(go-test-compile)
au FileType go nmap <Leader>d  <Plug>(go-doc)
au FileType go nmap <Leader>dv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>db <Plug>(go-doc-browser)
au FileType go nmap gd         <Plug>(go-def)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
"}}}
" C "{{{
augroup ClangFormatSettings
    autocmd!
    autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
    autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
augroup END
let c_space_errors=1
"}}}
" Lightline "{{{
let g:lightline = {
\	'active': {
\		'left': [ [ 'mode', 'paste' ], [ 'readonly', 'filename', 'fugitive', 'modified' ] ],
\	},
\	'component_function': {
\		'fugitive': 'LightLineFugitive',
\	},
\ }
function! LightLineFugitive()
	return exists('*fugitive#head') ? fugitive#head() : ''
endfunction
"}}}
" Fugitive "{{{
" Display the git status.
map <Leader>gst :Gstatus<CR>
" Display the git log list.
map <Leader>glog :Glog<CR>
" Display the diff.
map <Leader>gd :Gdiff<CR>
" Gitv.
map <Leader>gv :Gitv!<CR>
map <Leader>gV :Gitv<CR>
" Use spell correction and start in insert mode when editing commit messages.
if has('autocmd')
	if has('spell')
		au BufNewFile,BufRead COMMIT_EDITMSG setlocal spell
	endif
	au BufNewFile,BufRead COMMIT_EDITMSG call feedkeys('ggi', 't')
endif
"}}}
" Temporary files "{{{
if !isdirectory($HOME.'/.local/vim/backup')
	:silent !mkdir -p ~/.local/vim/backup >/dev/null 2>&1
endif
set backupdir=~/.local/vim/backup/
set backup
if !isdirectory($HOME.'/.local/vim/swap')
	:silent !mkdir -p ~/.local/vim/swap >/dev/null 2>&1
endif
set directory=~/.local/vim/swap/
if exists('+undodir')
	if !isdirectory($HOME.'/.local/vim/undo')
		:silent !mkdir -p ~/.local/vim/undo >/dev/null 2>&1
	endif
	set undodir=~/.local/vim/undo/
endif
if exists('+undofile')
	set undofile
endif
"}}}
" Colorscheme "{{{
set background=dark
colorscheme solarized
"}}}
" GUI {{{
if has("gui_running")
	" set guifont=Monospace\ 9
	" set guifont=Ubuntu\ Mono\ 11
	if has("gui_macvim")
		set guifont=Go\ Mono:h12
	else
		set guifont=Go\ Mono\ 10
	endif
	" autoselect, simple dialogs, add tab pages, grey menu items
	set guioptions+=aAceg
	set guioptions+=tTrlLm
	set guioptions-=tTrlLm
endif
"}}}
" Ag "{{{
if executable('ag')
       set grepprg=ag\ --vimgrep\ --nocolor
       set grepformat=%f:%l:%c:%m
       nnoremap <Leader>g :grep<SPACE>"<LEFT>"
       " Bind K to grep word under cursor.
       nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
       command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
       nnoremap \ :Ag<SPACE>
endif
"}}}
" Command-T "{{{
let g:CommandTMaxFiles=160000
let g:CommandTFileScanner='find'
"}}}
" NERDTree "{{{
" Every time we change directories in NERDTree, use the new directory as
" the current working directory for Vim
let NERDTreeChDirMode=2
" Show hidden files by default
let NERDTreeShowHidden=1
" Don't show line numbers in the NERDTree window
let NERDTreeShowLineNumbers=0
" Use arrows rather than pipes and +/~ chars
let NERDTreeDirArrows=1
let NERDTreeWinSize=50
"}}}
" YCM "{{{
let g:ycm_confirm_extra_conf=0
map <Leader>gt :YcmCompleter GoTo<CR>
"}}}

" vim:foldmethod=marker:foldlevel=0
