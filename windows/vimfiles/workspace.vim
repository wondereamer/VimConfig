let SessionLoad = 1
if &cp | set nocp | endif
let s:cpo_save=&cpo
set cpo&vim
inoremap <silent> <S-Tab> =BackwardsSnippet()
imap <silent> <Plug>IMAP_JumpBack =IMAP_Jumpfunc('b', 0)
imap <silent> <Plug>IMAP_JumpForward =IMAP_Jumpfunc('', 0)
vnoremap <silent>  :call RangeCommentLine()
nnoremap <silent>  :call CommentLine()
onoremap <silent>  :call CommentLine()
snoremap <silent> 	 i<Right>=TriggerSnippet()
vmap <NL> <Plug>IMAP_JumpForward
nmap <NL> <Plug>IMAP_JumpForward
nmap  :WMToggle 
snoremap  b<BS>
xnoremap <silent>  :call RangeUnCommentLine()
nnoremap <silent>  :call UnCommentLine()
onoremap <silent>  :call UnCommentLine()
snoremap % b<BS>%
snoremap ' b<BS>'
nmap <silent> ,sl <Plug>SnippetsListSnippets
nmap <silent> ,sd <Plug>SnippetsDeleteSnippet
nmap <silent> ,se <Plug>SnippetsEditSnippet
nmap <silent> ,sI <Plug>SnippetsInsertSnippet
nmap <silent> ,si <Plug>SnippetsAppendSnippet
vmap <silent> ,sa <Plug>SnippetsAddSnippet
nmap <silent> ,sa <Plug>SnippetsAddSnippet
map <silent> ,mm :ShowMarksPlaceMark
map <silent> ,ma :ShowMarksClearAll
map <silent> ,mh :ShowMarksClearMark
map <silent> ,mo :ShowMarksOn
map <silent> ,mt :ShowMarksToggle
map ,rp :call All_Replace()
nmap <silent> ,bv :VSBufExplorer
nmap <silent> ,bs :HSBufExplorer
nmap <silent> ,be :BufExplorer
map <silent> ,cf :cs find f =expand("<cfile>")
map <silent> ,ce :cs find e 
map <silent> ,ci :cs find i =expand("<cfile>")
map <silent> ,ct :cs find t =expand("<cword>")
map <silent> ,cg :cs find g =expand("<cword>")
map <silent> ,cc :cs find c =expand("<cword>")
map <silent> ,cs :cs find s =expand("<cword>")
map <silent> ,lc :call To_column()A## 
map <silent> ,cd :cs find d =expand("<cword>")
map <silent> ,es :call ESnippet()
map <silent> ,nf ::call C_InsertTemplate("comment.myfile")
map <silent> ,u :wall :TlistUpdatea
map <silent> ,bi ::call C_InsertTemplate("preprocessor.debug_i")
map <silent> ,ba ::call C_InsertTemplate("preprocessor.debug_a")
map <silent> ,bc ::call C_InsertTemplate("preprocessor.debug_c")
map <silent> ,bf ::call C_InsertTemplate("preprocessor.debug_f")
map <silent> ,g :bel 20vsplit gdb-variables 
map <silent> ,p :cp
map <silent> ,n :cn
map <silent> ,r :e!
map <silent> ,z zA
map <silent> ,x zR
map <silent> ,a zM
map <silent> ,f :normal gg=G''
map <silent> ,q :qa!
map <silent> ,h h:vertical resize 120M
map <silent> ,j :BottomExplorerWindow:vertical resize 40zRM
map <silent> ,k :FirstExplorerWindow:vertical resize 40M
map <silent> ,tc :wall :TlistUpdate:!ctags -R --c-kinds=+p --fields=+iaS*.[c,h] 
map <silent> ,t :wall :TlistUpdate:!ctags  --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ *.{cc,cpp,h}
map <silent> ,= :inoremap = =
map <silent> ,ms ,mslho:mksession! ~/.vim/workspace.vim:wviminfo! ~/.vim/workspace.viminfo
map <silent> ,rs :source ~/.vim/workspace.vim:rviminfo! ~/.vim/workspace.viminfo,wm
map <silent> ,msl :mksession! workspace.vim:wviminfo! workspace.viminfo
map <silent> ,rsl :source workspace.vim:rviminfo! workspace.viminfo
map <silent> ,wm :WMToggle:vertical resize 80H
map <silent> ,e :tab split ~/.vimrc
snoremap U b<BS>U
snoremap \ b<BS>\
vnoremap <silent> \co :call RangeUnCommentLine()
nnoremap <silent> \co :call UnCommentLine()
onoremap <silent> \co :call UnCommentLine()
vnoremap <silent> \cc :call RangeCommentLine()
nnoremap <silent> \cc :call CommentLine()
onoremap <silent> \cc :call CommentLine()
snoremap ^ b<BS>^
snoremap ` b<BS>`
nmap gx <Plug>NetrwBrowseX
snoremap <Left> bi
snoremap <Right> a
snoremap <BS> b<BS>
snoremap <silent> <S-Tab> i<Right>=BackwardsSnippet()
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#NetrwBrowseX(expand("<cWORD>"),0)
nnoremap <SNR>29_ListSnippets :ListSnippets
nnoremap <SNR>29_DeleteSnippet :DeleteSnippet
nnoremap <SNR>29_EditSnippet :EditSnippet
nnoremap <SNR>29_InsertSnippet :InsertSnippet
nnoremap <SNR>29_AppendSnippet :AppendSnippet
vnoremap <SNR>29_AddSnippet :AddSnippet
nnoremap <SNR>29_AddSnippet :%AddSnippet
vmap <silent> <Plug>IMAP_JumpBack `<i=IMAP_Jumpfunc('b', 0)
vmap <silent> <Plug>IMAP_JumpForward i=IMAP_Jumpfunc('', 0)
vmap <silent> <Plug>IMAP_DeleteAndJumpBack "_<Del>i=IMAP_Jumpfunc('b', 0)
vmap <silent> <Plug>IMAP_DeleteAndJumpForward "_<Del>i=IMAP_Jumpfunc('', 0)
nmap <silent> <Plug>IMAP_JumpBack i=IMAP_Jumpfunc('b', 0)
nmap <silent> <Plug>IMAP_JumpForward i=IMAP_Jumpfunc('', 0)
inoremap  
inoremap <silent> 	 =TriggerSnippet()
imap <NL> <Plug>IMAP_JumpForward
inoremap <expr>  pumvisible()?"\<PageUp>\\":"\\"
inoremap  
inoremap <expr>  pumvisible()?"\":"\"
inoremap <silent> 	 =ShowAvailableSnips()
inoremap <expr>  pumvisible()?"\":"\"
inoremap " =CloseQuote('"'):call IfBack()a
inoremap #{ {#$#}hi
inoremap ${ ${}i
inoremap ' =CloseQuote("'"):call IfBack()a
inoremap ( ()i
inoremap ) =ClosePair(')')
inoremap = =Istyle()
inoremap [ []i
inoremap ] =ClosePair(']')
inoremap { {}O
iabbr #c connect(*,SIGNAL(*),*,SLOT(*)); 
let &cpo=s:cpo_save
unlet s:cpo_save
set autoindent
set autoread
set autowrite
set background=dark
set backspace=indent,eol,start
set comments=s1:/*,mb:*,ex:*/,://,b:#,:XCOMM,n:>,fb:-
set completeopt=menu,longest
set cscopeprg=/usr/bin/cscope
set cscopetag
set cscopetagorder=1
set cscopeverbose
set fileencodings=utf-8,usc-bom,euc-jp,gb18030,gbk,gb2312,cp936
set helplang=en
set hidden
set ignorecase
set incsearch
set omnifunc=pythoncomplete#Complete
set printoptions=paper:a4
set pumheight=20
set ruler
set runtimepath=~/.vim,/var/lib/vim/addons,/usr/share/vim/vimfiles,/usr/share/vim/vim73,/usr/share/vim/vimfiles/after,/var/lib/vim/addons/after,~/.vim/after
set shiftwidth=4
set softtabstop=4
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc
set termencoding=utf-8
set wildignore=*.pyc
set window=38
set winheight=50
set nowritebackup
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/Dropbox/python
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +304 logic.py
badd +324 tree.py
badd +144 backup_logic.py
badd +147 ~/Ubuntu\ One/.vim/snippets/python.snippets
badd +135 rules.py
args logic.py
edit logic.py
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
noremap <buffer> <silent>  :PyflakesUpdate
map <buffer> <silent> \s :call PdbSaveSavedBreakpoints()
map <buffer> <silent> \l :call PdbLoadSavedBreakpoints()
noremap <buffer> <silent> dw dw:PyflakesUpdate
noremap <buffer> <silent> dd dd:PyflakesUpdate
noremap <buffer> <silent> u u:PyflakesUpdate
let s:cpo_save=&cpo
set cpo&vim
map <buffer> <silent> <F12> :call PdbPrintStackTrace()
map <buffer> <silent> <C-F3> :call PdbExecStatement()
map <buffer> <silent> <F3> :call PdbEvalExpression()
map <buffer> <silent> <C-F4> :call PdbEvalCurrentWORD()
map <buffer> <silent> <F4> :call PdbEvalCurrentWord()
map <buffer> <silent> <F11> :call PdbPrintBreakpointConditionOnCurrentLine()
map <buffer> <silent> <M-C-S-F2> :call PdbClearAllBreakpoints()
map <buffer> <silent> <C-S-F2> :call PdbClearAllBreakpointsInCurrentFile()
map <buffer> <silent> <S-F2> :call PdbToggleTemporaryBreakpointOnCurrentLine()
map <buffer> <silent> <C-F2> :call PdbToggleConditionalBreakpointOnCurrentLine()
map <buffer> <silent> <F2> :call PdbToggleBreakpointOnCurrentLine()
map <buffer> <silent> <C-F6> :call PdbJumpToCurrentLine()
map <buffer> <silent> <F6> :call PdbSetFocusToCurrentDebugLine()
map <buffer> <silent> <F10> :call PdbMoveDownInStackFrame()
map <buffer> <silent> <F9> :call PdbMoveUpInStackFrame()
map <buffer> <silent> <C-F8> :call PdbContinueUntilReturn()
map <buffer> <silent> <F8> :call PdbStepOver()
map <buffer> <silent> <F7> :call PdbStepInto()
map <buffer> <silent> <M-C-S-F5> :call PdbRestartDebug()
map <buffer> <silent> <S-F5> :call PdbStopDebug()
map <buffer> <silent> <C-S-F5> :call PdbStartDebugWithArguments()
map <buffer> <silent> <C-F5> :call PdbStartDebug(0, [])
map <buffer> <silent> <F5> :call PdbStartDebug(1, [])
inoremap <buffer>  =CodeComplete()=SwitchRegion()
let &cpo=s:cpo_save
unlet s:cpo_save
setlocal keymap=
setlocal noarabic
setlocal autoindent
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),:,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=s1:/*,mb:*,ex:*/,://,b:#,:XCOMM,n:>,fb:-
setlocal commentstring=#%s
setlocal complete=.,w,b,u,t,i
setlocal concealcursor=
setlocal conceallevel=0
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal noexpandtab
if &filetype != 'python'
setlocal filetype=python
endif
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=tq
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=0
setlocal include=^\\s*\\(from\\|import\\)
setlocal includeexpr=substitute(v:fname,'\\.','/','g')
setlocal indentexpr=GetPythonIndent(v:lnum)
setlocal indentkeys=0{,0},:,!^F,o,O,e,<:>,=elif,=except
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=pydoc
setlocal nolinebreak
setlocal nolisp
setlocal nolist
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=pythoncomplete#Complete
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=4
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=4
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=
setlocal suffixesadd=.py
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'python'
setlocal syntax=python
endif
setlocal tabstop=8
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal noundofile
setlocal nowinfixheight
setlocal nowinfixwidth
set nowrap
setlocal nowrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 284 - ((34 * winheight(0) + 19) / 38)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
284
normal! 01l
lcd ~/Dropbox/python
tabnext 1
if exists('s:wipebuf')
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=50 winwidth=20 shortmess=filnxtToO
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
