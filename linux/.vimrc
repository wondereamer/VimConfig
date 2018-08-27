filetype on
filetype plugin on
filetype plugin indent on
filetype indent on
syntax enable
syntax on
set autoindent
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab
set number
set hlsearch
set incsearch
"set nowrap
set hidden

set nobackup
set wrap
set fo+=t
set nocompatible
set nowb

set history=50	    " keep 50 lines of command line history
set ruler	" show the cursor position all the time
set showcmd	" 
"" set nocompatible
colorscheme darkblue
set nocp
set nobackup
set autoread
"autowrite when make
set autowrite
" 复制，粘贴时的格式切换建" 
set pastetoggle=<F8>

" high light when length over 81
set textwidth=100  "max length" 
"" highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"" match OverLength /\%100v.\+/

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"dictionary
"set complete-=k complete+=k
au BufNewFile,BufRead *py set dictionary+=~/.mytags/dictionary/pydiction.list
au BufNewFile,BufRead *py set dictionary+=./complete-dict
set dictionary+=~/.mytags/dictionary/en_word.list
"" set dictionary+=./complete-dict
"comment
"""""""""""""""""
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
autocmd FileType c,cpp,cc,h  setl fdm=syntax | setl fen | setl foldcolumn=2 
"" autocmd FileType c,cpp,cc,h  set tags+=~/.mytags/qttag
autocmd FileType c,cpp,cc,h  set tags+=~/.mytags/cpp_tag
autocmd FileType c,cpp,cc,h  set tags+=~/.mytags/cpp_tag2
autocmd FileType c,cpp,cc,h  set tags+=~/.mytags/ctag
autocmd FileType c,cpp,cc,h  set tags+=~/.mytags/systag
autocmd FileType c,cpp,cc,h  set tags+=./tags
autocmd FileType h,cpp set dictionary+=~/.mytags/dictionary/stl_index.list

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nohlsearch
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"源文件是什么编码，结果仍然是什么编码
"输入编码 也就是即将输出的编码格式"
set fencs=utf-8,usc-bom,euc-jp,gb18030,gbk,gb2312,cp936
"" set fenc=utf8
"" set fenc=utf-8
set enc=utf-8
"显示编码"
"" set encoding=gbk
"" let &termencoding=&encoding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"zendcoding & code_complete"
let g:user_zen_leader_key = 'z'
let g:completekey = "<c-h>"   "hotkey
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""abbreviate
iabbrev #c connect(*,SIGNAL(*),*,SLOT(*)); 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"cpp tags with out 'using namespace std'
"
""set tags+=~/.mytags/*
"if filereadable("Session.vim")
"    source Session.vim
"    rviminfo! Session.viminfo
"endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""'
"map
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" "Set mapleader
let mapleader = ","


"Fast editing of .vimrc
map <silent> <leader>e  :tab split ~/.vimrc<cr>
"When .vimrc is edited, reload it
autocmd! bufwritepost .vimrc source ~/.vimrc
"map
map <silent> <leader>rsl <Esc>:source workspace.vim<CR>:rviminfo! workspace.viminfo<CR>
map <silent> <leader>msl <ESc>:mksession! workspace.vim<CR>:wviminfo! workspace.viminfo<CR>
map <silent> <leader>rs <Esc>:source ~/.vim/workspace.vim<CR>:rviminfo! ~/.vim/workspace.viminfo<CR>,wm
map <silent> <leader>ms <ESc>,msl<C-W>h<C-W>o:mksession! ~/.vim/workspace.vim<CR>:wviminfo! ~/.vim/workspace.viminfo<CR>
map <silent> <leader>= <esc>:inoremap = =<cr>
"" map <silent> <leader>y <Esc>:inoremap = <c-r>= Istyle()<cr><cr>
"tags current file
map <silent> <leader>t  <Esc>:wall <CR>:TlistUpdate<CR>:!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ *<CR>
"ctags -R --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ cpp_src
map <silent> <leader>tc  <Esc>:wall <CR>:TlistUpdate<CR>:!ctags -R --c-kinds=+p --fields=+iaS*.[c,h] <CR>
"navigator
map <silent> <leader>wm <Esc>:WMToggle<cr>:vertical resize 80<CR><C-W>H
map <silent> <leader>k  <Esc>:FirstExplorerWindow<cr>z20<CR>:vertical resize 40<CR>zxM
map <silent> <leader>j  <Esc>:BottomExplorerWindow<cr>z20<CR><C-w>:vertical resize 40<CR>zxM
map <silent> <leader>h  <C-W>h:vertical resize 2000<CR>zxM
"quit ,unsaved
map <silent> <leader>q  <Esc>:qa!<cr>
"format whole file
map <silent> <leader>f <esc>:normal gg=G''<cr>
"unfold
map <silent> <leader>a <Esc>zM
map <silent> <leader>x <Esc>zR
map <silent> <leader>z  <Esc>zA
"map <cR>  <Esc>zA
"read file
map <silent> <leader>r  <Esc>:e!<cr>
"quick fix
map <silent> <leader>n <Esc>:cn<cr><cr>
map <silent> <leader>p <Esc>:cp<cr><cr>

map <silent> <leader>g   :bel 20vsplit gdb-variables <CR>
"insert debug info
map <silent> <leader>bf  ::call C_InsertTemplate("preprocessor.debug_f")<CR>
map <silent> <leader>bc  ::call C_InsertTemplate("preprocessor.debug_c")<CR>
map <silent> <leader>ba  ::call C_InsertTemplate("preprocessor.debug_a")<CR>
"map <silent> <leader>bs  ::call C_InsertTemplate("preprocessor.debug_s")<CR>
map <silent> <leader>bi  ::call C_InsertTemplate("preprocessor.debug_i")<CR>
"update tag list
map <silent> <leader>u <Esc>:wall <CR>:TlistUpdate<CR>a
map <silent> <leader>nf  ::call C_InsertTemplate("comment.myfile")<cr>
map <silent> <leader>es  :call ESnippet()<cr>
"chage working directory to current directory
"" autocmd BufEnter * lcd %:p:h
map <silent> <leader>cd :cd %:p:h<CR>:pwd<CR>
"debug file
autocmd FileType c,cpp,h inoremap ,bc <esc>::call C_InsertTemplate("preprocessor.debug_c")<CR>
autocmd FileType c,cpp,h inoremap ,bf <esc>::call C_InsertTemplate("preprocessor.debug_f")<CR>
autocmd FileType c,cpp,h inoremap ,ba <esc>::call C_InsertTemplate("preprocessor.debug_a")<CR>
autocmd FileType c,cpp,h inoremap ,bi <esc>::call C_InsertTemplate("preprocessor.debug_i")<CR>
autocmd FileType c,cpp,h inoremap <c-t> <tab><tab><tab>


"------------------------pep8--------------------" 
let g:flake8_show_in_file = 1
"------------------------Jedi--------------------" 
let g:jedi#goto_command = "<leader>d"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
"let g:jedi#completions_command = "<C-8>"
let g:jedi#completions_command = "<C-Alt>"
let g:jedi#rename_command = "<leader>r"
" .自动补全
"" let g:jedi#popup_on_dot =  0
"" let g:jedi#completions_enabled =  0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Omin Setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:AutoComplPop_IgnoreCaseOption=1
set ignorecase
let OmniCpp_GlobalScopeSearch = 1  " 0 or 1
let OmniCpp_NamespaceSearch = 1   " 0 ,  1 or 2
let OmniCpp_DisplayMode = 1
let OmniCpp_ShowScopeInAbbr = 0
let OmniCpp_ShowPrototypeInAbbr = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_MayCompleteDot = 1
let OmniCpp_MayCompleteArrow = 1
let OmniCpp_MayCompleteScope = 1
set completeopt=menu,longest	    
"heigh of menu
set pumheight=20
inoremap <expr> <CR>       pumvisible()?"\<C-Y>":"\<CR>"
inoremap <expr> <C-J>	   pumvisible()?"\<PageDown>\<C-N>\<C-P>":"\<C-X><C-O>\<C-N>"
inoremap <expr> <C-K>	   pumvisible()?"\<PageUp>\<C-P>\<C-N>":"\<c-x><C-K>\<C-N>"
inoremap <expr> <C-U>      pumvisible()?"\<C-E>":"\<C-U>"
inoremap  <C-f>      <c-x><c-f>
inoremap  <C-l>      <c-x><c-l>
""let g:easytags_cmd = '/usr/bin/ctags'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"acp @@!
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:acp_ignorecaseOption = 1
let g:acp_behaviorKeywordLength = 3 
let g:acp_behaviorFileLength = 2
let g:acp_behaviorPythonOmniLength = 1
let g:acp_behaviorCssOmniPropertyLength = 1
let g:acp_behaviorSnipmateLength = -1 
"scope 'k'means dictionary
"" let g:acp_completeOption = '.,i,w,b,k'
let g:acp_completeOption = '.,w,b,k'
highlight Pmenu ctermbg=lightcyan gui=bold
highlight PmenuSel ctermbg=lightyellow gui=bold
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"buffer explorer
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:bufExplorerDefaultHelp = 0      
let g:bufExplorerShowRelativePath = 1  
let g:bufExplorerSortBy = 'mru'   
let g:bufExplorerSplitRight = 0    
let g:bufExplorerSplitVertical = 1  
let g:bufExplorerSplitVertSize = 3 
let g:bufExplorerUseCurrentWindow = 0 


""""""""""""""""""""""""""""""
" winManager setting
"    """"""""""""""""""""""""""""""
let g:winManagerWindowLayout = "BufExplorer,FileExplorer|TagList"
let g:winManagerWidth = 40
let g:defaultExplorer = 0
let g:persistentBehaviour = 0
let g:bufExplorerResize = 0
nmap <C-W><C-T>  <Esc>:WMToggle<cr> 

"""""""""""""""""""""""""""""""""""""
"Taglist
""""""""""""""""""""""""""""'
let Tlist_Auto_Open = 0
let Tlist_Use_Right_Window = 1
let Tlist_File_Fold_Auto_Close = 1
let Tlist_Auto_Update = 1
let Tlist_Max_Tag_Length =10
let Tlist_Show_One_File = 1 
let g:EclimTaglistEnabled=0
""""""""""""""""""""""""""""""
" Enable ShowMarks
" """""""""""""""""""""""""""""
let showmarks_enable = 1
" Show which marks
let showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
" Ignore help, quickfix, non-modifiable buffers
let showmarks_ignore_type = "hqm"
" Hilight lower & upper marks
"let showmarks_hlline_lower = 1
"let showmarks_hlline_upper = 1
""""""""""""""""""""""""""""""""""""""""
"python
""""""""""""""""""""""""""""""""""""""""'
autocmd FileType python set omnifunc=pythoncomplete#Complete
let g:pydiction_location = '~/.mytags/dictionary/pydiction.list' 
"
"""""""""""""""""""""""""""""""""""""""
"括号补全
""""""""""""""""""""""""""""""""""""""""'
"conflict with echofun.vim"
autocmd FileType html,htm inoremap {{ {{   }}<ESC>hhhi
autocmd FileType html,htm inoremap {# {#   #}<ESC>hhhi
autocmd FileType html,htm inoremap {% {%   %}<ESC>hhhi
autocmd FileType html,htm inoremap {[ {[   ]}<ESC>hhhi
inoremap ( ()<ESC>i
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap { {<CR>}<ESC>O
"<c-r>=   替换"
inoremap ] <c-r>=ClosePair(']')<CR>
inoremap ${ ${}<ESC>i
inoremap #{ {#$#}<esc>hi
inoremap ' <c-r>=CloseQuote("'")<cr><Esc>:call IfBack()<cr>a
inoremap " <c-r>=CloseQuote('"')<cr><Esc>:call IfBack()<cr>a
inoremap [ []<ESC>i
au FileType h,cpp,cc,c,python,javascript inoremap = <c-r>=Istyle()<cr>
au FileType html inoremap = =
function! ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
	return "\<Right>"
    else
	return a:char
    endif
endfunction
function! Istyle()
    let m = getline('.')[col('.') - 2] 
    if(match(m,'\s') != -1)
	return "==\<Space>" 
    endif
    if(match(m,'\w')== -1)
	"non word"
	return '='
    else 
	"word"
	return "\<Space>=\<Space>" 
    endif
endfunction
function! IfBack()
    if(g:back)
	normal hh
    endif
endfunction
function! CloseQuote(char)
     let m = getline('.')[col('.')-1] 
     let g:back = 0
    if(match(m,a:char)==-1)
	"begin 
	let g:back = 1
	return a:char.a:char."\<Space>" 
    else 
	"close 
	return "\<Right>\<Delete>" 
    endif
endfunction
""""""""""""""""""""""""""""""""""""""""""""""   
let g:is_python = 1
let g:MY_COL= 40
au BufNewFile,BufRead *.py let g:is_python = 1
if g:is_python == 1
    map <silent> <leader>lc <Esc>:call To_column()<cr>A## 
else 
    map <silent> <leader>lc <Esc>:call To_column()<cr>A//!< 
endif
function! To_column()
    let l = line('.')
    let t = getline(line('.'))
    let len = strlen(t)
    while len < g:MY_COL
	let len += 1
	let t = t . ' ' 
    endwhile
    let t = t . '   ' 
    call setline('.',t)
endfunction

""""""""""""""""""""""""
""cscope0
"'""""""""""""""""""""""""
if has("cscope")
    set csprg=/usr/bin/cscope
    set csto=0
    set cst
    set nocsverb
    " add any database in current directory
    if filereadable("cscope.out")
	cs add cscope.out
	" else add database pointed to by environment
    elseif $CSCOPE_DB != ""
	cs add $CSCOPE_DB
    endif
    set csverb
endif
set cscopetagorder=1 
":set cscopequickfix=s-,c-,d-,i-,t-,e-
map <silent> <leader>cs  :cs find s <C-R>=expand("<cword>")<CR><CR>
map <silent> <leader>cc  :cs find c <C-R>=expand("<cword>")<CR><CR>
map <silent> <leader>cd  :cs find d <C-R>=expand("<cword>")<CR><CR>
"defination" 
map <silent> <leader>cg  :cs find g <C-R>=expand("<cword>")<CR><CR>
"zhi ding de zhi fu chuang" 
map <silent> <leader>ct  :cs find t <C-R>=expand("<cword>")<CR><CR>
map <silent> <leader>ci  :cs find i <C-R>=expand("<cfile>")<CR><CR>
map <silent> <leader>ce  :cs find e <C-R>
map <silent> <leader>cf  :cs find f <C-R>=expand("<cfile>")<CR><CR>
" "
""""""""""""""""""""""""""""""
" vimgdb setting
"    """"""""""""""""""""""""""""""
"let g:vimgdb_debug_file = ""
"run macros/gdb_mappings.vim
""""""""""""""""""""""""""""""""""""""""""""""""""
"php
""""""""""""""""""""""""""""""""""""""""""""""""""
""au FileType tpl :set FileType=html  //useless
au BufNewFile,BufRead *.swig set filetype=html
au BufNewFile,BufRead *.html set filetype=html
au BufNewFile,BufRead *.htm set filetype=html
au BufNewFile,BufRead *.tpl noremap L f>
au BufNewFile,BufRead *.tpl noremap H F>
au BufNewFile,BufRead *.tpl let g:m_type='.tpl'
au BufNewFile,BufRead *.cpp let g:m_type='.cpp'
au BufNewFile,BufRead *.js let g:m_type='.cpp'
au FileType html,htm noremap L f>
au FileType html,htm noremap H F>

au BufNewFile,BufRead *.js set shiftwidth=2
au BufNewFile,BufRead *.js set softtabstop=2
au BufNewFile,BufRead *.js set tabstop=2
au BufNewFile,BufRead *.js set fenc=utf-8
au FileType html set fenc=utf-8

" Public Setters
"map <S-F3> :s/\(\(\w\)\(\w\+\)\).*/public function set\u\2\3(\$\1){\r\t\$this->\1 = \$\1;\r}/<CR>
"autocmd FileType php set keywordprg=/home/wondereamer/.mytags/documents/php_doc
function! OpenPhpFunction (keyword)
    let proc_keyword = substitute(a:keyword , '_', '-', 'g')
    exe 'split'
    exe 'enew'
    exe "set buftype=nofile"
    exe 'silent !lynx   file:///home/wondereamer/.mytags/documents/php_manual_en/function.'.proc_keyword.'.html'
    "exe 'silent r!lynx -dump -nolist http://www.php.net/'.proc_keyword
    exe 'norm gg'
    exe 'call search("____________________________________")'
    exe 'norm dgg'
    exe 'call search("User Contributed Notes")'
    exe 'norm dGgg'
    exe 'call search ("'proc_keyword'")'
endfunction
"<c-r><c-w>---current words   <left>  @#$@@@@@@@
"au! BufWriteCmd  *.php    call PHPsynCHK()
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:DoxygenToolkit_compactOneLineDoc="no"
""let g:DoxygenToolkit_blockHeader="--------------------------------------------------------------------------"
""let g:DoxygenToolkit_blockFooter="----------------------------------------------------------------------------"
"Dox
"DoxLic
"DoxAuthor
"DoxUndoc
"DoxBlock
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"edit snippets script"
function! ESnippet()
    let s = input("file:")
    let sn = input("snippet name:")
    exe 'tab split ~/.vim/snippets/'.s.'.snippets'
    exe 'norm ,xGo'
    call cursor(0,1)
    exe 'norm asnippet '.sn
    let num_ = line('.') + 1
    norm o
    exe 'norm p'
    let end_ = line('$')
    while num_ < end_
	call cursor(num_,0)
	normal >>>>
	let num_ = num_ + 1
    endwhile
    norm jdd
endfunction
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""riv.vim 
"let proj1 = { 'path': '~/Work',}
 "let g:riv_projects = [proj1]
""NeoBundle Scripts-----------------------------
"if has('vim_starting')
  "if &compatible
    "set nocompatible               " Be iMproved
  "endif

  "" Required:
  "set runtimepath+=~/.vim/bundle/neobundle.vim/
"endif

"" Required:
"call neobundle#begin(expand('~/.vim/bundle'))

"" Let NeoBundle manage NeoBundle
"" Required:
"NeoBundleFetch 'Shougo/neobundle.vim'

"" Add or remove your Bundles here:
"NeoBundle 'Shougo/neosnippet.vim'
"NeoBundle 'Shougo/neosnippet-snippets'
"NeoBundle 'tpope/vim-fugitive'
"NeoBundle 'ctrlpvim/ctrlp.vim'
"NeoBundle 'flazz/vim-colorschemes'
"NeoBundle 'Rykka/InstantRst'

"" You can specify revision/branch/tag.
"NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }

"" Required:
"call neobundle#end()

"" Required:
"filetype plugin indent on

"" If there are uninstalled bundles found on startup,
"" this will conveniently prompt you to install them.
"NeoBundleCheck
""End NeoBundle Scripts-------------------------

let tlist_pyrex_settings = 'python;c:classe;m:memder;f:function'

