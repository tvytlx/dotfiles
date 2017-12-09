set encoding=utf-8
set termguicolors

call plug#begin('~/.vim/plugged')
    Plug 'Valloric/YouCompleteMe'
    Plug 'airblade/vim-gitgutter'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'scrooloose/nerdtree'

    Plug 'ctrlpvim/ctrlp.vim'
    let g:ctrlp_by_filename = 0

    Plug 'nvie/vim-flake8'
    Plug 'ruanyl/vim-gh-line'
call plug#end()
filetype plugin indent on

let g:ctrlp_user_command = 'rg %s'
let mapleader = "\<space>"
nmap <leader>g  :YcmCompleter GoTo<CR>
let g:ycm_python_binary_path = 'python'
map <C-b> :NERDTreeToggle<CR>
nnoremap <D-c> "+y<CR>

set number relativenumber        " 行号
set tabstop=4                    " tab 的大小
set expandtab                    " tab 转化为空格
set showmatch                    " 显示括号匹配，更容易知道代码块的大小
set matchtime=2                  " 括号匹配显示的事件
set shiftwidth=4                 " tab 对应的退格键大小
set softtabstop=4                " 保证tab风格(我们设置为空格)一致

set incsearch                    " 在查找过程中就开始跳转到查询的词
set ignorecase                   " 搜索时忽略大小写
set history=1000                 " 历史记录数量
set selection=inclusive          " 光标位置选中ps:可视模式选择时包含光标位置
set hlsearch

syntax enable                    " 打开语法检测

set cursorline                   " 突出显示当前行
set autoread                     " 文件修改后自动重载


set nobackup
set noswapfile
set wildignore=*.swp,*.bak,*.pyc,*.class,.svn

if has('mouse')
    set mouse=a
endif

inoremap jj <Esc>


" theme主题
colo molokai
let g:airline_theme='bubblegum'

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let python_highlight_all=1
