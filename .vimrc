call plug#begin('~/.vim/plugged')

    Plug 'tpope/vim-sensible'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-vinegar'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-obsession'

    Plug 'Raimondi/delimitMate'

    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'edkolev/tmuxline.vim'
    Plug 'tmux-plugins/vim-tmux'
    Plug 'christoomey/vim-tmux-navigator'
    
    " Vim HardTime
    "Plug 'takac/vim-hardtime'
        autocmd! User vim-hardtime.vim HT()
    
    Plug 'junegunn/fzf'
    Plug 'junegunn/fzf.vim'


    Plug 'lambdalisue/suda.vim'

    Plug 'scrooloose/nerdtree'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'ryanoasis/vim-devicons'

    Plug 'airblade/vim-gitgutter'
    
    "Plug 'ycm-core/YouCompleteMe'
        autocmd! User youcompleteme.vim YCM()
    Plug 'neoclide/coc.nvim',  {'tag': '*', 'branch': 'release'}
        autocmd! User coc.nvim CocStart()

    Plug 'derekwyatt/vim-scala', {'for': ['scala','sbt', 'java']}
    Plug 'mpollmeier/vim-scalaConceal', {'for': ['scala','sbt', 'java']}

    
    Plug 'keith/swift.vim'
    Plug 'darfink/vim-plist'

    Plug 'arnoudbuzing/wolfram-vim'
    
    Plug 'hotoo/jsgf.vim'

    Plug 'justinmk/vim-syntax-extra'
    
    Plug 'nvie/vim-flake8'
    Plug 'Vimjas/vim-python-pep8-indent'
    "Plug 'jupyter-vim/jupyter-vim', {'for': ['python'] }
    Plug 'vim-python/python-syntax'
    Plug 'ehamberg/vim-cute-python'
    
    Plug 'google/vim-maktaba'
    Plug 'google/vim-codefmt'
    Plug 'google/vim-glaive'

" All of your Plugs must be added before the following line
call plug#end()
call glaive#Install()
Glaive codefmt plugin[mappings]

"NeoVim api stuff
let g:python_host_prog="/usr/local/bin/python"
let g:python3_host_prog="/usr/local/bin/python3"

"Netrw stuff
let g:netrw_liststyle=3
let g:netrw_banner = 0
let g:netrw_altv = 1
let g:netrw_winsize = 25


"Search stuff
set incsearch
set hlsearch
nnoremap n nzz
nnoremap N Nzz

"Tab stuff
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent

"Number stuff
set nu
set relativenumber

"""Autoclosing stuff
""inoremap " ""<left>
""inoremap ' ''<left>
""inoremap ( ()<left>
""inoremap [ []<left>
""inoremap { {}<left>
""inoremap {<CR> {<CR>}<ESC>O
""inoremap <expr> ) strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"noremap {;<CR> {<CR>};<ESC>O

nnoremap o o<Esc>==
nnoremap O O<Esc>==

set scrolloff=1
set showbreak=↪
set listchars=tab:→\ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨

set foldmethod=indent
set foldlevelstart=18

set conceallevel=1
"Cursor Mode stuff

let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)

"Cursor settings:

"  1 -> blinking block
"  2 -> solid block
"  3 -> blinking underscore
"  4 -> solid underscore
"  5 -> blinking vertical bar
"  6 -> solid vertical bar

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

"WINDOW CONFIG
set laststatus=2
set showcmd
color desert
set wildmenu
set wildmode=list:longest

"   Fast window movement
let i = 1
while i <= 9
    execute 'nnoremap <Leader>' . i . ' :' . i . 'wincmd w<CR>'
    let i = i + 1
endwhile

"   Airline window numbers
function! WindowNumber(...)
        let builder = a:1
        let context = a:2
        call builder.add_section('airline_b', '%{tabpagewinnr(tabpagenr())}')
        return 0
endfunction

call airline#add_statusline_func('WindowNumber')
call airline#add_inactive_statusline_func('WindowNumber')
let g:airline_powerline_fonts = 1
let g:airline_theme='random'
silent! call airline#extensions#whitespace#disable()
"let g:tmuxline_preset = {'z'    : '#track'}
let g:airline#extensions#tmuxline#enabled = 1
"Window end

"YouCompleteMe
function YCM()
        "let g:ycm_always_populate_location_list = 1
        let g:airline#extensions#ycm#enabled = 1
        let g:ycm_clangd_binary_path = '/usr/local/Cellar/llvm/9.0.0/bin/clangd'
        let g:ycm_clangd_args = ['-log=verbose', '-pretty']
        let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
        nmap <c-]> :YcmCompleter GoTo<CR>
endfunction
"coc
function CocStart()
        so ~/.cocrc.vim
endfunction
if has_key(plugs, 'YouCompleteMe')
        call YCM()
endif
if has_key(plugs, "coc.nvim")
        call CocStart()
endif

"Open to last position when reopening file
 if has("autocmd")
   au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

function HT()
    "make things difficult
    let g:hardtime_default_on = 1
    let g:list_of_disabled_keys = ["<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]
    let g:hardtime_showmsg = 1
    let g:hardtime_allow_different_key = 1
    let g:hardtime_maxcount = 2
    let g:hardtime_ignore_buffer_patterns = [  "NERD.*" ]
    let g:list_of_resetting_keys  = ['2', '3', '4', '5', '6', '7', '8', '9', '0']
endfunction

if has_key(plugs, "vim-hardtime")
    call HT()
endif


"Formatter stuff
augroup autoformat_settings
  autocmd FileType c,cpp,proto,javascript AutoFormatBuffer clang-format
  autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer js-beautify
  autocmd FileType java AutoFormatBuffer google-java-format
  autocmd FileType python AutoFormatBuffer autopep8
augroup END

"autocmd FileType text set spell


"   PEP 8 indentation standards
au BufNewFile,BufRead *.py
            \ set softtabstop=4 |
            \ set textwidth=79 |
            \ set autoindent |
            \ set fileformat=unix

"   Pylint
let python_highlight_all=1
let g:python_highlight_all = 1
set background=dark
syntax on


au BufRead,BufNewFile bash-fc-* set filetype=sh
au BufRead,BufNewFile zsh* set filetype=zsh
au BufRead,BufNewFile README,INSTALL,CREDITS set filetype=markdown
au BufRead,BufRead * if &syntax == '' | set syntax=sh | endif

"Formatting end

"Nerdy things
autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>


source ~/.vimFunctions.vim

set title
set clipboard=unnamed,unnamedplus
set timeoutlen=1000 ttimeoutlen=10
