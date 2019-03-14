" This script is compatible with vim8, earlier version not supported
" add-apt-repository ppa:jonathonf/vim
" this repo contains the newest vim, you can also compile by your self
"
" Please install vundle before install other plugins
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
"
"

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'flazz/vim-colorschemes'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'jreybert/vimagit'
Plugin 'w0rp/ale'
Plugin 'edkolev/tmuxline.vim'
Plugin 'lervag/vimtex'
Plugin 'Valloric/YouCompleteMe'
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'jiangmiao/auto-pairs'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'vim-scripts/taglist.vim'
Plugin 'romainl/vim-qf'
Plugin 'rhysd/vim-grammarous'
Plugin 'vim-scripts/BufOnly.vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'iamcco/markdown-preview.vim'
Plugin 'kristijanhusak/vim-carbon-now-sh'
" Plugin 'lyokha/vim-xkbswitch'
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
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
" Add or remove your Bundles here:

" airline configuration
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#ale#enabled = 1
colo PaperColor
let g:airline_theme = "tomorrow"

let g:ale_echo_msg_error_str = 'E'
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_linters = {
\   'python': ['flake8'],
\   'tex': ['lacheck'],
\   'php': ['php']
\}
let g:ale_set_loclist = 1
let g:ale_set_quickfix = 0
let g:ale_open_list = 1

" browser config
" let g:netrw_banner = 0
" let g:netrw_liststyle = 3
" let g:netrw_browse_split = 4
" let g:netrw_altv = 1
" let g:netrw_winsize = 20
" augroup ProjectDrawer
"     autocmd!
"     autocmd VimEnter * :Vexplore
" augroup END

" source /etc/vim/vimrc
set tabstop=4
set shiftwidth=4
set expandtab
set nu
set background=dark
set wildmenu
set wildmode=longest,list,full
set backspace=indent,eol,start
syntax on
" nnoremap <C-n> :tabnew<CR>
nnoremap <C-c> :bp\|bd #<CR>
nnoremap <C-x> :BufOnly<CR>
nnoremap <C-h> :bprevious<CR>
nnoremap <C-l> :bnext<CR>
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap ;; A;<ESC>

" highlight column
set colorcolumn=80

set noswapfile

" youcompleteme configs
let g:ycm_autoclose_preview_window_after_insertion = 1

" NERDTree configrations
" autocmd vimenter * NERDTree

" taglist configuration
let Tlist_Use_Right_Window = 1
let Tlist_Compact_Format = 1
let g:tlist_tex_settings='latex;s:sections;l:labels;c:cites'
let g:tlist_bib_settings='bibtex;e:entries;t:titles'
let g:tlist_markdown_settings='markdown;h:Headlins'

" vimtex configurations
let g:vimtex_view_method='skim'
let g:vimtex_view_automatic=1

" grammar check
" let g:grammarous#show_first_error=1

nmap vv <Plug>(grammarous-open-info-window)

" IM switch
" let g:XkbSwitchEnabled = 0
" let g:XkbSwitchNLayout = '0'
" let g:XkbSwitchILayout = '1'
" let g:XkbSwitchLib = '/usr/local/lib/libxkbswitch.dylib'
" let g:XkbSwitchSkipFt = [ 'nerdtree', 'vim', 'cpp' ]

" function SetUsLayout()
"     :!xkbswitch -s 0
" endfunction
" function SetABCLayout()
"     :!xkbswitch -s 1
" endfunction
"
" autocmd InsertLeave * call SetUsLayout()
" autocmd InsertEnter * call SetABCLayout()

" nmap cc :%s/[\u4E00-\u9FCC]//n
function! ChineseCount() range
    " let save = @z
    " silent exec 'normal! gv"zy'
    " let text = @z
    " let @z = save
    " silent exec 'normal! gv'
    let buff = getline(1, '$')

    let cc = 0
    for line in buff
        for char in split(line, '\zs')
            if char == '%'
                break
            endif
            "if char2nr(char) >= 0x2000 4E00
            if char2nr(char) >= 0x2000 && char2nr(char) <= 0x9FCC
                let cc += 1
            endif
        endfor
    endfor
    echo "Count of Chinese charasters is: " . cc
endfunc

nmap cc :call ChineseCount()<cr>

" snipet configuration
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger = "<c-l>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
let g:jedi#use_splits_not_buffers = "top"

set foldmethod=indent
