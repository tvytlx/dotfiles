set encoding=utf-8
set termguicolors

call plug#begin('~/.vim/plugged')
    Plug 'Valloric/YouCompleteMe'
    Plug 'airblade/vim-gitgutter'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'nvie/vim-flake8'
    Plug 'ruanyl/vim-gh-line'
    Plug 'gabrielelana/vim-markdown'
call plug#end()
filetype plugin indent on

let mapleader = "\<space>"
nmap <leader>g  :YcmCompleter GoTo<CR>
let g:ycm_python_binary_path = 'python'
set clipboard=unnamed
" theme主题
colo molokai
let g:airline_theme='bubblegum'
" 自动补全弹出面板的颜色
highlight Pmenu guibg=black gui=bold

" 相对行号: 行号变成相对，可以用 nj/nk 进行跳转
set relativenumber number
au FocusLost * :set norelativenumber number
au FocusGained * :set relativenumber
" 插入模式下用绝对行号, 普通模式下用相对
autocmd InsertEnter * :set norelativenumber number
autocmd InsertLeave * :set relativenumber
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber number
  else
    set relativenumber
  endif
endfunc
nnoremap <C-n> :call NumberToggle()<cr>
" tab相关变更
" 设置Tab键的宽度        [等同的空格个数]
set tabstop=4
" 每一次缩进对应的空格数
set shiftwidth=4
" 按退格键时可以一次删掉 4 个空格
set softtabstop=4
" insert tabs on the start of a line according to shiftwidth, not tabstop 按退格键时可以一次删掉 4 个空格
set smarttab
" 将Tab自动转化成空格[需要输入真正的Tab键时，使用 Ctrl+V + Tab]
set expandtab
" 缩进时，取整 use multiple of shiftwidth when indenting with '<' and '>'
set shiftround
" vimrc文件修改之后自动加载, linux
autocmd! bufwritepost .vimrc source %
" 自动补全配置
" 让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
set completeopt=longest,menu
" 保存python文件时删除多余空格
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd FileType c,cpp,java,go,php,javascript,puppet,python,rust,twig,xml,yml,perl autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()


set incsearch                    " 在查找过程中就开始跳转到查询的词
set ignorecase                   " 搜索时忽略大小写
set history=1000                 " 历史记录数量
set selection=inclusive          " 光标位置选中ps:可视模式选择时包含光标位置
set hlsearch

syntax enable                    " 打开语法检测

set cursorline                   " 突出显示当前行
set cursorcolumn
set autoread                     " 文件修改后自动重载
set showmode


set nobackup
set noswapfile
set wildignore=*.swp,*.bak,*.pyc,*.class,.svn

if has('mouse')
    set mouse=a
endif

inoremap jj <Esc>

" 打开自动定位到最后编辑的位置, 需要确认 .viminfo 当前用户可写
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" 分屏窗口移动, Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" 滚动Speed up scrolling of the viewport slightly
nnoremap <C-e> 2<C-e>
nnoremap <C-y> 2<C-y>

" Map ; to : and save a million keystrokes 用于快速进入命令行
nnoremap ; :

