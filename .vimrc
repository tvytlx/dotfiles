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

syntax on                        " 打开语法检测
filetype on                      " 检测文件类型
filetype plugin on               " 自动导入对应文件类型相关的插件
filetype indent on               " 使用对应文件类型的对齐

set cursorline                   " 突出显示当前行
set autoread                     " 文件修改后自动重载

set nobackup
set noswapfile
set wildignore=*.swp,*.bak,*.pyc,*.class,.svn


inoremap jj <Esc>

call plug#begin('~/.vim/plugged')
Plug 'Valloric/YouCompleteMe'
call plug#end()

let g:ycm_python_binary_path = '/usr/bin/python'
