set nocompatible " be iMproved

filetype off " required!

set rtp+=~/.vim/bundle/vundle/

call vundle#rc()

"插件

Bundle 'gmarik/vundle'

Bundle 'AutoComplPop'

Bundle 'The-NERD-tree'

Bundle 'Tagbar'

Bundle 'minibufexpl.vim'

Bundle 'ZenCoding.vim'

Bundle 'L9'

Bundle 'FuzzyFinder'

Bundle 'WebAPI.vim'

Bundle 'Gist.vim'

Bundle 'molokai'

Bundle 'PDV--phpDocumentor-for-Vim'

Bundle 'https://github.com/luofei614/html5css3.git'

Bundle 'JavaScript-syntax'

Bundle 'phpfolding.vim'

Bundle 'Mark'





filetype plugin indent on " required!

"autocomplpop 设置

let g:AutoComplPop_IgnoreCaseOption=1

set ignorecase

let g:acp_behaviorKeywordCommand="\<C-n>"

"搜索高亮

set hlsearch

"设置NERDTreetagbar的宽度

let g:NERDTreeWinSize = 20
let g:tagbar_width=20

"颜色主题设置

set t_Co=256

colorscheme molokai

"zencoding 设置

let g:user_zen_expandabbr_key='<C-Y>' 

let g:use_zen_complete_tag = 1

"Gist设置

let g:gist_detect_filetype = 1

let g:gist_clip_command = 'xclip -selection clipboard'
"javascript
let b:javascript_fold=1
let javascript_enable_domhtmlcss=1

"php函数自动提示

autocmd FileType php set complete+=k | set dictionary=~/.vim/phpclist.txt

"javascript自动提示，包括了jquery
autocmd FileType javascript set dictionary=~/.vim/javascript.dict

"查找手册

autocmd FileType php set keywordprg=~/.vim/phpman

autocmd FileType js,css,html set keywordprg=~/.vim/man

inoremap <C-D> <ESC>:call PhpDocSingle()<CR>i 
nnoremap <C-D> :call PhpDocSingle()<CR> 
vnoremap <C-D> :call PhpDocRange()<CR> 

map <F2> <S-K><CR>

map! <F2> <C-O><S-K><CR>

"检查php语法错误（如何用php_check_snytax插件的话，会和minibuf有冲突，也会导致也没乱层现象）

map <F5> :! php -l %<CR>

map! <F5> <Esc>:! php-l %<CR>

"快速生成tag文件

map <F3> :! ctags -R<CR>

map! <F3> <Esc>:! ctags -R<CR>

"快捷键设置

map <F11> :NERDTreeToggle<CR>

map! <F11> <Esc>:NERDTreeToggle<CR>

map <F12> :TagbarToggle<CR>

map! <F12> <Esc>:TagbarToggle<CR>

"快速查找文件

map <C-P> :FufCoverageFile<CR>

map! <C-P> <Esc>:w<CR>:FufCoverageFile<CR>

"快速关闭

map <S-Q> :q<CR>:q<CR>:q<CR>:q<CR>

nnoremap <c-]> g<c-]>

vnoremap <c-]> g<c-]>

"映射复制、粘贴、剪贴ctrl+c ctrl+v ctrl+x

"map <C-V> "+pa<Esc>

map! <C-V> <Esc>"+pa

map <C-C> "+y

map <C-X> "+x

" 映射全选 ctrl+a

map <C-A> ggVG

map! <C-A> <Esc>ggVG

"ctrl+s为保存

map <C-S> :w<CR>

map! <C-S> <C-O>:w<CR>

"ctrl+z撤销

map <C-Z> :u<CR>

map! <C-Z> <C-O>:u<CR>

"双击时高亮

"map <2-LeftMouse> *

"map! <2-LeftMouse> <c-o>*

map <2-leftmouse> \m
inoremap <2-leftmouse> <Esc>\m
map <.> \/

"ctrl+鼠标左键跳转

map <C-LeftMouse> <C-]>

map! <C-LeftMouse> <Esc><C-]>

 

function! InsertTabWrapper()

let col=col('.')-1

if !col || getline('.')[col-1] !~ '\k'

return "\<TAB>"

else

return "\<C-x>\<C-o>"

endif

endfunction

"按tab键，全能提示，

"注意要用inoremap，不能用map！，如果用map！在命令模式下tab键没有提示功能。

inoremap <TAB> <C-R>=InsertTabWrapper()<CR>



"支持鼠标

set mouse=a

"显示行数

set nu

" 多行缩进

map <Tab> >

map <S-Tab> <

"语法高亮
syntax enable
syntax on

"删除键
set backspace=eol,start,indent

"基本设置

set encoding=utf-8

set fileencoding=chinese

set fileencodings=ucs-bom,utf-8,chinese

set ambiwidth=double

set ts=4

set sw=4

set wrap "自动换行

"设置无备份

set nobackup

set nowritebackup
