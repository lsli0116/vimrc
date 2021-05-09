" System
" <LEADER> = <SPACE>
let mapleader=" "
syntax on
set number
set relativenumber
set noswapfile

set cursorline
set wrap
set showcmd
set wildmenu
set nobackup

set ruler
set hlsearch
exec "nohlsearch"
set incsearch
set ignorecase
set smartcase

set nocompatible
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
set mouse=a
set encoding=utf-8
let &t_ut=''
set clipboard=unnamed
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set list
set listchars=tab:▸\ ,trail:▫
set scrolloff=5
set tw=0
set indentexpr=
set backspace=indent,eol,start
set foldmethod=indent
set foldlevel=99
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
set laststatus=2
set autochdir
set completeopt=preview,menu
setlocal spell
set spelllang=en_gb
set guifont=Meslo\ LG\ M\ Regular\ For\ Powerline:h18
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" ===
" === Basic Mappings
" ===

" Set <LEADER> as <SPACE>
let mapleader=" "

" Column (:) mods
map ; :
map q; q:
map <LEADER>/ :!
map <LEADER>r :r !
map <LEADER>sr :%s/

" Save & quit
map Q :q<CR>
map S :w<CR>

" Open the vimrc file anytime
map <LEADER>rc :e ~/.vim/vimrc<CR>

" Undo operations
noremap l u
" Undo in Insert mode
inoremap <C-l> <C-u>

" Insert Key
noremap k i
noremap K I

" Copy to system clipboard
vnoremap Y :w !xclip -i -sel c<CR>

" Search
map <LEADER><CR> :nohlsearch<CR>
noremap = nzz
noremap - Nzz

" Duplicate words
map <LEADER>fd /\(\<\w\+\>\)\_s*\1

" Others
map <LEADER>o o<Esc>u


" ===
" === Cursor Movement
" ===
"
" New cursor movement (the default arrow keys are used for resizing windows)
"     ^
"     u
" < n   i >
"     e
"     v
noremap u k
noremap n h
noremap e j
noremap i l
" U/E keys for 5 times u/e (faster navigation)
noremap U 5k
noremap E 5j
" N key: go to the start of the line
noremap N 0
" I key: go to the end of the line
noremap I $

" Faster in-line navigation
noremap W 5w
noremap B 5b
" set h (same as n, cursor left) to 'end of word'
noremap h e

" Ctrl + U or E will move up/down the view port without moving the cursor
noremap <C-U> 5<C-y>
noremap <C-E> 5<C-e>
inoremap <C-U> <Esc>5<C-y>a
inoremap <C-E> <Esc>5<C-e>a


" ===
" === Window management
" ===
" Use <space> + new arrow keys for moving the cursor around windows
map <LEADER>w <C-w>w
map <LEADER>u <C-w>k
map <LEADER>e <C-w>j
map <LEADER>n <C-w>h
map <LEADER>i <C-w>l
"map <LEADER>r <C-w>r

" Disabling the default s key
noremap s <nop>

" split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)
map su :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
map se :set splitbelow<CR>:split<CR>
map sn :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
map si :set splitright<CR>:vsplit<CR>

" Resize splits with arrow keys
map <up> :res +5<CR>
map <down> :res -5<CR>
map <left> :vertical resize-5<CR>
map <right> :vertical resize+5<CR>

" Place the two screens up and down
noremap sh <C-w>t<C-w>K
" Place the two screens side by side
noremap sv <C-w>t<C-w>H

" Rotate screens
noremap srh <C-w>b<C-w>K
noremap srv <C-w>b<C-w>H


" ===
" === Tab management
" ===
" Create a new tab with tu
map tu :tabe<CR>
" Move around tabs with tn and ti
map tn :-tabnext<CR>
map ti :+tabnext<CR>
" Move the tabs with tmn and tmi
map tmn :-tabmove<CR>
map tmi :+tabmove<CR>


" ===
" === Other useful stuff
" ===

" Press space twice to jump to the next '' and edit it
map <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4i

" Spelling Check with <space>sc
map <LEADER>sc :set spell!<CR>
noremap <C-x> ea<C-x>s
inoremap <C-x> <Esc>ea<C-x>s

" Press ` to change case (instead of ~)
map ` ~

imap <C-c> <Esc>zza
nmap <C-c> zz

" Auto change directory to current dir
autocmd BufEnter * silent! lcd %:p:h

" Call figlet
map tx :r !figlet 

" Compile function
map r :call CompileRunGcc()<CR>
func! CompileRunGcc()
  exec "w"
  if &filetype == 'c'
    exec "!g++ % -o %<"
    exec "!time ./%<"
  elseif &filetype == 'cpp'
    exec "!g++ % -o %<"
    exec "!time ./%<"
  elseif &filetype == 'java'
    exec "!javac %"
    exec "!time java %<"
  elseif &filetype == 'sh'
    :!time bash %
  elseif &filetype == 'python'
    silent! exec "!clear"
    exec "!time python3 %"
  elseif &filetype == 'html'
    exec "!firefox % &"
  elseif &filetype == 'markdown'
    exec "MarkdownPreview"
  elseif &filetype == 'vimwiki'
    exec "MarkdownPreview"
  endif
endfunc

map R :call CompileBuildrrr()<CR>
func! CompileBuildrrr()
  exec "w"
  if &filetype == 'vim'
    exec "source $MYVIMRC"
  elseif &filetype == 'markdown'
    exec "echo"
  endif
endfunc



call plug#begin()

Plug 'connorholyday/vim-snazzy'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" File navigation
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'

"Markdown
Plug 'iamcco/markdown-preview.vim',{ 'do': { -> mkdp#util#install_sync() }, 'for' :['markdown', 'vim-plug'] }
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }
Plug 'iamcco/mathjax-support-for-mkdp'

Plug 'majutsushi/tagbar'
Plug 'iamcco/markdown-preview.vim'
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }
Plug 'vim-python/python-syntax', { 'for' :['python', 'vim-plug'] }

Plug 'Valloric/YouCompleteMe'
Plug 'dense-analysis/ale'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'lervag/vimtex'
Plug 'rizzatti/dash.vim'
call plug#end()

colorscheme snazzy
let g:SnazzyTransparent = 1
set background=dark
let g:airline_theme='dark'
let g:airline#extensions#tabline#enabled = 1

" nerdtree config
map tt :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let NERDTreeMapOpenExpl = ""
let NERDTreeMapUpdir = ""
let NERDTreeMapUpdirKeepOpen = "l"
let NERDTreeMapOpenSplit = ""
let NERDTreeOpenVSplit = ""
let NERDTreeMapActivateNode = "i"
let NERDTreeMapOpenInTab = "o"
let NERDTreeMapPreview = ""
let NERDTreeMapCloseDir = "n"
let NERDTreeMapChangeRoot = "y"



"" Tagbar settings
nmap <F8> :TagbarToggle<CR>
let g:tagbar_ctags_bin = '/usr/local/bin/ctags'


" nerdtree-git-plugin
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

" ===
" === You Complete ME
" ===
nnoremap gd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap g/ :YcmCompleter GetDoc<CR>
nnoremap gt :YcmCompleter GetType<CR>
nnoremap gr :YcmCompleter GoToReferences<CR>
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_autoclose_preview_window_after_insertion=1
let g:ycm_use_clangd = 0
let g:ycm_python_interpreter_path = "/Users/lsli/anaconda3/bin/python"
let g:ycm_python_binary_path = "/Users/lsli/anaconda3/bin/python"
let g:ycm_key_list_select_completion = ['<c-k>', '<Down>']  " 映射按键, 没有这个会拦截掉tab, 导致其他插件的tab不能用.
let g:ycm_key_list_previous_completion = ['<c-i>', '<Up>']

let g:ycm_server_log_level = 'info'
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_strings=1
let g:ycm_key_invoke_completion = '<C-z>'
let g:ycm_collect_identifiers_from_tag_files = 1

noremap <C-z> <NOP>

let g:ycm_semantic_triggers =  {
			\ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
			\ 'cs,lua,javascript': ['re!\w{2}'],
			\ }
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'

" ===
" === MarkdownPreview
" ===
let g:mkdp_path_to_chrome = "open -a Safari"
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_echo_preview_url = 0
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1
    \ }
let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''
let g:mkdp_page_title = '「${name}」'


let g:table_mode_corner='|'
source ~/.vim/snippits.vim
" ===
" === Python-syntax
" ===
let g:python_highlight_all = 1

" ===
" === vim-table-mode
" ===
map <LEADER>tm :TableModeToggle<CR>


""" vimtex
let g:tex_flavor='latex'
let g:vimtex_quickfix_mode=1
au VimEnter * let g:ycm_semantic_triggers.tex=g:vimtex#re#youcompleteme
set conceallevel=1
let g:tex_conceal='abdmg'
let g:vimtex_compiler_latexmk_engines ={
    \ 'context(xetex)'   : '-pdf -pdflatex=''texexec --xtx''',
    \}

let g:vimtex_compiler_latexrun_engines = {
    \ 'xelatex'           : 'xelatex'
    \}

"""Ultisnips
let g:UltiSnipsExpandTrigger="<C-e>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-tab>"
let g:UltiSnipsSnippetDirectories=["UltiSnips","mysnippets"]


" ===
" === ale
" ===
let b:ale_linters = ['pylint']
let b:ale_fixers = ['autopep8', 'yapf']

" ===
" === fzf
" ===
set rtp+=/usr/local/opt/fzf
