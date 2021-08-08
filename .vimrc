""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" settings for vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" This file contains some boilerplate settings for vim's cscope interface,
" plus some keyboard mappings that I've found useful.
"
" USAGE:
" -- vim 6:     Stick this file in your ~/.vim/plugin directory (or in a
"               'plugin' directory in some other directory that is in your "
"               'runtimepath'.  "
" Jason Duell   'yuwenqi8199429@163.com     2016/3/13
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""multi-encodingi setting多语言编码转换""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("multi_byte")
"set bomb
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,gb2312,gbk,big5,euc-jp,euc-kr
set encoding=utf8
" CJK environment detection and corresponding setting
if v:lang =~ "^zh_CN"
" Use cp936 to support GBK, euc-cn == gb2312
set encoding=cp936
set termencoding=cp936
set fileencoding=cp936
elseif v:lang =~ "^zh_TW"
" cp950, big5 or euc-tw
" Are they equal to each other?
set encoding=big5
set termencoding=big5
set fileencoding=big5
elseif v:lang =~ "^ko"
" Copied from someone's dotfile, untested
set encoding=euc-kr
set termencoding=euc-kr
set fileencoding=euc-kr
elseif v:lang =~ "^ja_JP"
" Copied from someone's dotfile, untested
set encoding=euc-jp
set termencoding=euc-jp
set fileencoding=euc-jp
endif
" Detect UTF-8 locale, and replace CJK setting if needed
if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
endif
else
echoerr "Sorry, this version of (g)vim was not compiled with multi_byte"
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""" Initial Plugin 加载插件""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" install Vundle bundles
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""vim 样式配置""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 基础配置设置
filetype on                  								"检测文件类型
filetype indent on           								"针对不同的文件类型采用不同的缩进格式
filetype plugin on           								"允许插件
filetype plugin indent on    								"启动自动补全

"autocmd! bufwritepost _vimrc source %     					"vimrc文件修改之后自动加载。 windows。
autocmd! bufwritepost .vimrc source %     					"vimrc文件修改之后自动加载。 linux。
syntax enable				 								"开启代码高亮
syntax on					 								"打开高亮
set completeopt=longest,menu 								"自动补全配置,让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
"set relativenumber number   								 "相对行号，可用Ctrl+n在相对/绝对行号间切换
set cursorcolumn             								"突出显示当前列，可用Ctrl+m切换是否显示
set cursorline              								"突出显示当前行，可用Ctrl+m切换是否显示
set history=3000             								"history存储长度
set nocompatible             								"非兼容vi模式,避免以前版本的一些bug和局限
set nu						 								"显示行数 
set shiftwidth=4             								"换行时行间交错使用4空格
set cindent shiftwidth=4     								"自动缩进4空格
set tabstop=4                								"让一个tab等于4个空格
set vb t_vb=
set showmatch                								"显示括号配对情况
set autoread                 								"当文件在外部被改变时，Vim自动更新载入
set nowrap                   								"设置不自动换行
set writebackup              								"设置无备份文件
set nobackup				 								"取消备份。 视情况自己改
set noswapfile				 								"关闭交换文件
set showmode				 								"开启模式显示  
set cmdheight=1              								"命令部分高度为1 
set shortmess=atI            								"启动的时候不显示那个援助索马里儿童的提示
set t_ti= t_te=              								"退出vim后，内容显示在终端屏幕 设置 退出vim后，内容显示在终端屏幕, 可以用于查看和复制好处：误删什么的，如果以前屏幕打开，可以找回
" 去掉输入错误的提示声音
set title                    								"change the terminal's title
set novisualbell             								"don't beep
set noerrorbells             								"don't beep
set t_vb=
set tm=500
"set backup                  								"备份
"set backupext=.bak
"set backupdir=/tmp/vimbk/
set mat=4                    								"Blink times every second when matching brackets
set hidden                   								"A buffer becomes hidden when it is abandoned
set wildmode=list:longest
set ttyfast

set wildignore=*.swp,*.bak,*.pyc,*.class
set scrolloff=3              								"至少有3行在光标所在行上下

set selection=old
set selectmode=mouse,key
set viminfo^=%                  							"Remember info about open buffers on close
set viminfo+=!												" 保存全局变量
set magic                       							"正则表达式匹配形式
set backspace=eol,start,indent  							"Configure backspace so it acts as it should act
"set backspace=indent,eol,start whichwrap+=<,>,[,] 			"允许退格键的使用
"set iskeyword+=_,$,@,%,#,-   								"带有如下符号的单词不要被换行分割 
set iskeyword+=_,$,@,%,#   									"带有如下符号的单词不要被换行分割 
" 字符间插入的像素行数目
au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn}   set filetype=mkd   "markdown配置

"set go=             		 								"不要图形按钮  
set cul             		 								"高亮光标所在行
autocmd InsertEnter * se cul 								"用浅色高亮当前行  
set ruler           		 								"显示标尺  
set showcmd         										"输入的命令显示出来，看的清楚些  
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle


"设置标记一列的背景颜色和数字一行颜色一致
hi! link SignColumn   LineNr
hi! link ShowMarksHLl DiffAdd
hi! link ShowMarksHLu DiffChange
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}  "状态行显示的内容
set statusline+=%f       									"不显示工具条
set laststatus=5    										"启动显示状态行(1),总是显示状态行(2)  

"set ignorecase				 								"搜索时忽略大小写 
set hlsearch                 								"高亮显示结果
"set nohlsearch				 								"关闭搜索高亮  
set incsearch                								"在输入要搜索的文字时，vim会实时匹配
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" F1 - F6 设置
" F1 废弃这个键,防止调出系统帮助
" F2 行号开关，用于鼠标复制代码用
" F3 换行开关
" F4 调出listbar函数列表
" F5 粘贴模式paste_mode开关,用于有格式的代码粘贴
" F6 语法开关，关闭语法可以加快大文件的展示
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" I can type :help on my own, thanks.  Protect your fat fingers from the evils of <F1>
noremap <F1> <Esc>"
nnoremap <F2> :set nonumber! number?<CR>
nnoremap <F3> :set wrap! wrap?<CR>
nmap <silent> <F4> :TagbarToggle<CR> "按下F4就可以呼出文件的函数列表及变量
set pastetoggle=<F5>            							"when in insert mode, press <F5> to go to
                                							"paste mode, where you can paste mass data
                                							"that won't be autoindented
au InsertLeave * set nopaste
nnoremap <F6> :exec exists('syntax_on') ? 'syn off' : 'syn on'<CR>
nnoremap <F8> :Ack 

" disbale paste mode when leaving insert mode

"Smart way to move between windows 分屏窗口移动
"则可以用<C-h,j,k,l>切换到上下左右的窗口中去,就像:
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

"Treat long lines as break lines (useful when moving around in them)
"se swap之后，同物理行上线直接跳
nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j
" Go to home and end using capitalized directions
noremap H ^
noremap L $

" 命令行模式增强，ctrl - a到行首， -e 到行尾
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

" 去掉搜索高亮
noremap <silent><leader>/ :nohls<CR>

"共享剪贴板  
set clipboard+=unnamed 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin indent on   							"根据文件进行缩进	
autocmd FileType c,cpp,java,html set shiftwidth=4 | set expandtab "每次在编辑c文件时，它的自动缩进为4个空格；当你在插入模式下使用CTRL-D、CTRL-T缩进时，它也会调整4个空格的缩进；当你按TAB键时，它将会插入8个空格
"set cinoptions={0,1s,t0,n,p2s,(03s,=.5s,>1s,=1s,:1s
"智能缩进，相应的有cindent，官方说autoindent可以支持各种文件的缩进，但是效果会比只支持C/C++的cindent效果会差一点，但笔者并没有看出来
set ai!                     							"设置自动缩进
set smartindent             							"智能自动缩进
set noautoindent            							"自动对齐 设置自动缩进：即每行的缩进值与上一行相等；使用 noautoindent 取消设置

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""设置cscope ctags"配置""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("cscope") 
    """"""""""""" Standard cscope/vim boilerplate 
	if filereadable("GTAGS")
		set csprg=gtags-cscope
		" use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t' 
		" check cscope for definition of a symbol before checking ctags: set to 1 
		" if you want the reverse search order. 
		set csto=0 
		set cst  
		set nocsverb 
		"cs reset
		"let Gtags_Auto_Map = 1
		cs add GTAGS
		"cs add GTAGS $PWD
	endif	

"    " add any cscope database in current directory 
    if filereadable("cscope.out") 
		set csprg=cscope
		set csto=0 
		set cst  
		set nocsverb 
        cs add cscope.out   
    " else add the database pointed to by environment variable  
    "elseif $CSCOPE_DB != "" 
    "    cs add $CSCOPE_DB 
    endif 

	set csverb   
"    " show msg when any other cscope db added 
    set cscopeverbose
endif

nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-_>i :cs find i <C-R>=expand("<cfile>")<CR><CR>
nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR>

au BufWritePost * call UpdateGtags(expand('<afile>')) 
function! UpdateGtags(f) 
	if filereadable("GTAGS")
		"let dir = fnamemodify(a:f, '*') 
		execute "!global -u &> /dev/null &"
	endif
endfunction 

map <F9> :call Do_CsGTag()<CR>
function Do_CsGTag()
    let dir = getcwd()
	if filereadable("filenametags")
            let csoutdeleted=delete("./"."filenametags")
        if(csoutdeleted!=0)
            echohl WarningMsg | echo "Fail to do cscope! I cannot delete the filenametags" | echohl None
            return
        endif
	endif

		"silent! execute	"!find `pwd` -name '*.h' -o -name '*.c++' -o -name '*.cc' -o -name '*.cp' -o -name '*.cpp' -o -name '*.cxx' -o -name '*.h++' -o -name '*.hh' -o -name '*.hp' -o -name '*.hpp' -o -name '*.hxx' -o -name '*.C' -o -name '*.H' -o -name '*.ipp' -o -name '*.c' -o -name '*.js' -o -name '*.java' -o -name '*.idl' -o -name '*.mak' -o -name '*.mk' -o -name '[Mm]akefile' -o -name 'GNUmakefile' -o -name '*.pl' -o -name '*.pm' -o -name '*.plx' -o -name '*.perl' -o -name '*.cmake' -o -name '*.y' -o -name '*.sh' -o -name 'CMakeList*.txt'> gtags.files"
		"silent! execute "!gtags -qv -f `pwd`/gtags.files"
		"silent! execute "!ctags -R --languages=+c,c++,java,javascript,make,perl,yacc,sh --langmap=c:+.x,c++:+.inl,make:+.mk.cmake --c-kinds=+px --c++-kinds=+px --fields=+afmikKlnsStz --extra=+q --exclude=lex.yy.cc --exclude=copy_lex.yy.cc"
		"silent! execute "!cscope -Rbkq -i cscope.files"
		silent! execute "!find `pwd` -type f > gtags.files"
		silent! execute "!gtags"
		silent! execute "!ctags -R"	

		if filereadable("GTAGS")
			set csprg=gtags-cscope
			set csto=0 
			set cst  
			set nocsverb 
			execute "cs add GTAGS"
            let csoutdeleted=delete("./"."gtags.files")
			call system("echo -e '!_TAG_FILE_SORTED\t2\t/2=foldcase/' > filenametags")
			call system("find `pwd` -not -regex '.*\.\(png\|gif\)' -type f -printf '%f\t%p\t1\n' | sort -f >> filenametags")
		endif
endfunction

map <F12> :call Do_CsTag()<CR>
function Do_CsTag()
    let dir = getcwd()

    if filereadable("tags")
		let tagsdeleted=delete("./"."tags")
        if(tagsdeleted!=0)
            echohl WarningMsg | echo "Fail to do tags! I cannot delete the tags" | echohl None
            return
        endif
    endif

    if has("cscope")
        silent! execute "cs kill -1"
    endif
    if filereadable("cscope.files")
		let csfilesdeleted=delete("./"."cscope.in.out")
		let csfilesdeleted=delete("./"."cscope.po.out")
		let csfilesdeleted=delete("./"."cscope.files")
		
		if(csfilesdeleted!=0)
			echohl WarningMsg | echo "Fail to do cscope! I cannot delete the cscope.files" | echohl None
			return
		endif
    endif
    if filereadable("cscope.out")
		let csoutdeleted=delete("./"."cscope.out")
        
		if(csoutdeleted!=0)
            echohl WarningMsg | echo "Fail to do cscope! I cannot delete the cscope.out" | echohl None
            return
        endif
    endif
	if filereadable("filenametags")
		let csoutdeleted=delete("./"."filenametags")
        
		if(csoutdeleted!=0)
            echohl WarningMsg | echo "Fail to do cscope! I cannot delete the filenametags" | echohl None
            return
        endif
	endif

	if(executable('cscope') && has("cscope") && executable('ctags'))
		silent! execute	"!find `pwd` -name '*.h' -o -name '*.c++' -o -name '*.cc' -o -name '*.cp' -o -name '*.cpp' -o -name '*.cxx' -o -name '*.h++' -o -name '*.hh' -o -name '*.hp' -o -name '*.hpp' -o -name '*.hxx' -o -name '*.C' -o -name '*.H' -o -name '*.ipp' -o -name '*.c' -o -name '*.js' -o -name '*.java' -o -name '*.idl' -o -name '*.mak' -o -name '*.mk' -o -name '[Mm]akefile' -o -name 'GNUmakefile' -o -name '*.pl' -o -name '*.pm' -o -name '*.plx' -o -name '*.perl' -o -name '*.cmake' -o -name '*.y' -o -name '*.sh' -o -name 'CMakeList*.txt'> cscope.files"
		"silent! execute "!cscope -Rbkq -i cscope.files"
		"silent! execute "!ctags -R --languages=+c,c++,java,javascript,make,perl,yacc,sh --langmap=c:+.x,c++:+.inl,make:+.mk.cmake --c-kinds=+px --c++-kinds=+px --fields=+afmikKlnsStz --extra=+q --exclude=lex.yy.cc --exclude=copy_lex.yy.cc"
        "silent! execute "!cscope -b"
		"silent! execute "!find `pwd` -type f > cscope.files"
		silent! execute "!cscope -Rbkq -i cscope.files"
		silent! execute "!ctags -R"	
        "execute "normal :"

        if filereadable("cscope.out")
            "let csoutdeleted=delete("./"."cscope.in.out")
            "let csoutdeleted=delete("./"."cscope.po.out")
			execute "cs add cscope.out"
            let csoutdeleted=delete("./"."cscope.files")
			call system("echo -e '!_TAG_FILE_SORTED\t2\t/2=foldcase/' > filenametags")
            call system("find `pwd` -not -regex '.*\.\(png\|gif\)' -type f -printf '%f\t%p\t1\n' | sort -f >> filenametags")
        endif
    endif
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""" color""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if &bg == "dark"  											" 根据你的背景色风格来设置不同的书签颜色
 highlight SignColor ctermfg=white ctermbg=blue guifg=wheat guibg=peru
else              											" 主要就是修改guibg的值来设置书签的颜色
 highlight SignColor ctermbg=white ctermfg=blue guibg=grey guifg=RoyalBlue3
endif
highlight CursorLine   cterm=NONE ctermbg=black ctermfg=grey guibg=NONE guifg=NONE
highlight CursorColumn cterm=NONE ctermbg=black ctermfg=grey  guibg=NONE guifg=NONE

if $TERM =~ '^xterm' || $TERM =~ '^screen' || $TERM=~ '256color$'
    set t_Co=256
    set background=dark
	colorscheme maroloccio
elseif has('gui_running')
    set background=light
    colorscheme solarized
elseif $TERM =~ 'cons256'
    colorscheme default
endif

nmap xr :r $HOME/.vimxfer
nmap xw :'a,.w! $HOME/.vimxfer
vmap xr c:r $HOME/.vimxfer
vmap xw :w! $HOME/.vimxfer

"install vim plugin command-t
"sudo apt-get install ruby-dev
"sudo apt-get install vim-nox

