" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.vim/bundle/neobundle.vim/

"=================================
" VIM 自身配置
"=================================
" 编码设置
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1
set enc=utf8
set fencs=utf8,gbk,gb2312,gb18030

" 启用插件
set nocompatible
filetype on
filetype plugin indent on

" Tab 转空格
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" 列高亮
" set cursorcolumn

" 记录上次光标位置
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" 分屏设置
" 向右分屏并把光标移动向右边
map td :set splitright<CR>:vsplit<CR>
" 向右分屏并把光标移动向左边
map ta :set nosplitright<CR>:vsplit<CR>
" 向下分屏并把光标移动向上边
map ts :set nosplitbelow<CR>:split<CR>
" 向下分屏并把光标移动向下边
map tw :set splitbelow<CR>:split<CR>

" 替换方向键为调节分屏大小
map <up> :res -5<CR>
map <down> :res +5<CR>
map <left> :vertical resize+5<CR>
map <right> :vertical resize-5<CR>

" 按键映射
map W :w<CR>
map WQ :wq<CR>
map fq :q!<CR>
map te :terminal<CR>

" 设置 buff、空白字符的视觉提示
set list listchars=extends:❯,precedes:❮,tab:▸\
" 这个提示在复制的时候是个问题
" set list listchars=extends:❯,precedes:❮,tab:▸\,trail:˽

" 其他的一些配置
syntax on   " 语法高亮
set number      " 显示行号
"set relativenumber    " 相对行号
set wildmenu    "  让vim命令可用Tab补全
set hlsearch      " 变输入搜索词边高亮
set incsearch      " 光标自动跳转到搜索结果上
set t_ut=  "防止vim背景颜色错误

" 复制系统到 vim
vnoremap <C-y> "+y
nnoremap <C-p> "*p

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'neoclide/coc.nvim'
NeoBundle 'vim-airline/vim-airline'
NeoBundle 'jiangmiao/auto-pairs'
NeoBundle 'junegunn/fzf'
NeoBundle 'w0rp/ale'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'mhinz/vim-startify'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

map <silent> <C-e> :NERDTreeToggle<CR>
syntax enable
filetype plugin indent on

" 光标变成线
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"
" reset the cursor on start (for older versions of vim, usually not required)
augroup myCmds
au!
autocmd VimEnter * silent !echo -ne "\e[2 q"
augroup END

nnoremap gd :YcmCompleter GoTo<CR>
nnoremap gd :call CocActionAsync('jumpDefinition')<CR>
nnoremap gh :YcmCompleter GetDoc<CR>
nnoremap gh :call CocActionAsync('doHover')<CR>

" Create default mappings
let g:NERDCreateDefaultMappings = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1
