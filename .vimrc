set nocompatible " be iMproved

filetype off " required!

set rtp+=~/.vim/bundle/vundle/

call vundle#rc()

"插件

Bundle 'gmarik/vundle'

Bundle 'AutoComplPop'

Bundle 'The-NERD-tree'

Bundle 'Tagbar'

"Bundle 'minibufexpl.vim'

Bundle 'ZenCoding.vim'

Bundle 'L9'

Bundle 'FuzzyFinder'
"快速浏览文件，FuzzyFinder 也能快速浏览文件， 但是如果项目文件多会很慢
Bundle 'Command-T' 

Bundle 'WebAPI.vim'

Bundle 'Gist.vim'

Bundle 'molokai'

Bundle 'PDV--phpDocumentor-for-Vim'

Bundle 'https://github.com/luofei614/html5css3.git'

"Bundle 'JavaScript-syntax'
Bundle "pangloss/vim-javascript"

" jquery , angularjs 等语法
Bundle "https://github.com/othree/javascript-libraries-syntax.vim.git"

"折叠的扩展
Bundle 'phpfolding.vim'

Bundle 'Mark'
"css私有前缀
Bundle 'prefixer.vim'
"能缩减HTML代码
Bundle 'xml.vim'
"安装此插件解决macvim下没有加号寄存器的问题。
Bundle 'https://github.com/kana/vim-fakeclip.git'

Bundle 'https://github.com/terryma/vim-multiple-cursors.git'

"snippets
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "garbas/vim-snipmate"
Bundle 'https://github.com/bonsaiben/bootstrap-snippets.git'

"bookmark  mm 添加书签,  mn 移动书签  mp 移动到前一个书签  ma 删除所有书签
Bundle "https://github.com/vim-scripts/Vim-bookmark.git"

Bundle "phpunit"

"快速跳转到字符
Bundle "EasyMotion"

Bundle "https://github.com/bling/vim-airline.git" 

Bundle "https://github.com/luofei614/vim-golang.git"

Bundle "https://github.com/burnettk/vim-angular.git"

"检查程序语法错误
Bundle "https://github.com/scrooloose/syntastic.git"



filetype plugin indent on " required!


"vimgrep 查询时排除composer的vendor目录
set wildignore=vendor/**

let g:used_javascript_libs = 'jQuery,AngularJS,AngularUI,RequireJS'

"let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
"php只做语法检查
let g:syntastic_php_checkers = ['php']

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
autocmd FileType html set dictionary=~/.vim/html.dict

"查找手册

autocmd FileType php set keywordprg=~/.vim/phpman

autocmd FileType javascript,html set keywordprg=~/.vim/man

autocmd FileType css set keywordprg=~/.vim/cssman

inoremap <C-D> <ESC>:call PhpDocSingle()<CR>i 
nnoremap <C-D> :call PhpDocSingle()<CR> 
vnoremap <C-D> :call PhpDocRange()<CR> 

map <F2> <S-K><CR>

map! <F2> <C-O><S-K><CR>


map <F6> :! tab vim<CR><CR>
map! <F6> <Esc>:! tab vim<CR><CR>

"删除不剪切, rd

nnoremap r "_d
vnoremap r "_d

"快速生成tag文件

map <F3> :! ctags -R<CR>

map! <F3> <Esc>:! ctags -R<CR>

"快捷键设置

map <F11> :NERDTreeToggle<CR>

map! <F11> <Esc>:NERDTreeToggle<CR>

map <F12> :TagbarToggle<CR>

map! <F12> <Esc>:TagbarToggle<CR>

"快速查找文件

map <C-P> :CommandT<CR>
map! <C-P> <Esc>:w<CR>:CommandT<CR>

"文件新tab页打开
let g:CommandTAcceptSelectionMap = '<space>'
let g:CommandTAcceptSelectionTabMap = '<CR>'


"快速查找文函数

map <C-F> :FufTag<CR>

map! <C-F> <Esc>:w<CR>:FufTag<CR>

"快速关闭

map <S-Q> :qa<CR>

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
inoremap <C-S> <C-O>:w<CR>

"ctrl+z撤销

map <C-Z> :u<CR>

map! <C-Z> <C-O>:u<CR>

"双击时高亮

map <2-leftmouse> \m
inoremap <2-leftmouse> <Esc>\m

"ctrl+鼠标左键跳转

"--------------------
" Function: Open tag under cursor in new tab
" Source:   http://stackoverflow.com/questions/563616/vimctags-tips-and-tricks
"--------------------
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
"--------------------
" Function: Remap keys to make it more similar to firefox tab functionality
" Purpose:  Because I am familiar with firefox tab functionality
" 切换tab页 用gt
"--------------------
map     <C-T>       :tabnew<CR>

map <A-LeftMouse> <C-]>

map! <A-LeftMouse> <Esc><C-]>

 

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
"shift+tab 展开代码片段
imap <S-TAB> <Plug>snipMateNextOrTrigger

"在mac下iterm终端标题中中显示文件名称
autocmd BufEnter *.* exe 'silent ! echo -ne "\033];%:t\007"'

"支持鼠标

set mouse=a


" 多行缩进

vnoremap <Tab> >

vnoremap <S-Tab> <

"语法高亮
syntax enable
syntax on
set autoindent
set number
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
"加快速度
"set synmaxcol=200
set ttyfast " u got a fast terminal
set ttyscroll=3
set lazyredraw " to avoid scrolling problems
"删除键
set backspace=eol,start,indent

"基本设置

set encoding=utf-8

set fileencoding=utf-8

set fileencodings=ucs-bom,utf-8,chinese

set ambiwidth=double

set wrap "自动换行

"设置无备份

set nobackup

set nowritebackup
