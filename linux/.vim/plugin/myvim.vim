""""""""""""""""""""""""""""""""""""""""""''
"My Function
".h      [type fun](\space
"		   )
".cpp    [class::fun]      [}]
"""""""""""""""""""""""""""""""""""""""'""""
autocmd FileType c,cpp,h map <F4> :call HbetweenCpp()<cr>
autocmd FileType c,cpp,h inoremap <F4> <esc>:call HbetweenCpp()<cr>
autocmd FileType cpp,h map <F2> :call F_HbetweenCpp()<cr>zR
autocmd FileType cpp,h inoremap <F2> <esc>:call F_HbetweenCpp()<cr>zR
autocmd FileType cpp,h map ,c   :call Comment_Code()<cr>
autocmd FileType cpp,h map ,d   :call Del_Fun()<cr><cr>
autocmd FileType cpp,h inoremap ;  ;<esc>::call Auto_Cpp()<CR>a

map ,rp :call All_Replace()<cr>

let s:s_line =0
let s:e_line =0
let s:isToDel = 0
"the  cursor of { of accessor
let s:align = 55
let s:align1 = 15
let s:align2 = 30
"swich on Auto_cpp()
let g:m_auto = 0
let s:save_counter = 0
let s:v_e_line = 0
let s:v_e_line = 0
let s:list = ['double','int','float','real','char','bool']
function! Is_H_File()
    let m = bufname("%")
    let index = strridx(m,'.')
    let post  = strpart(m,index+1)
    return  post == 'h'
endfunction

"work only under current directory
function! HbetweenCpp()
    let m = bufname("%")
    let index = strridx(m,'.')
    let pre   = strpart(m,0,index)
    if Is_H_File()
        let filename = pre . '.cpp'
        let filenamec = pre . '.c'
        let filenamecc = pre . '.cc'
    else
        let filename = pre . '.h'
    endif
    exe "e " . filename
    return
    "if findfile(filename,".") != ""
        "exe "e " . filename 
        "return
    "endif
    "if findfile(filenamec,".") != ""
        "exe "e " . filenamec
        "return
    "endif
    "if findfile(filenamecc,".") != ""
        "exe "e " . filenamecc
        "return
    "endif 
    "echo "no" 

endfunction

function! GetFunInfo(funname,server_t)
    "remove space and split it to two part ,"("
    let l_flag =""
    let template = ""
    let t_arg = ""
    let classType2 =""
    let s:save_counter = 0
    let temp = substitute(a:funname,'^\s\+',"","")
    let	temp	 = substitute(temp,'\s\+$',"","")
    let temp  = substitute(temp,'\<virtual\>',"","")
    let temp  = substitute(temp,'\<static\>',"","")
    let temp = substitute(temp,'^\s\+',"","")
    let index = stridx(temp,'(')
    let pre = strpart(temp,0,index)
    let post = strpart(temp,index,strlen(temp))
    let items = split(pre)
    "part before '('
    if len(items) > 1
	"member method
	if len(items) == 3
	    let funType = items[0] . " " . items[1]
	    let funName = items[2]
	else 
	    let funType = items[0]
	    let funName = items[1]
	endif
    else
	"constructor or destructor
	let funType = ""
	let funName = items[0]
    endif

    let classType = bufname("%")
    let classType= substitute(classType,'^\s\+',"","")
    let classType = substitute(classType,'\s\+$',"","")
    let index = strridx(classType,'.')
    let classType = strpart(classType,0,index)
    let index = strridx(classType,'/')
    let classType = strpart(classType,index+1,strlen(classType)- index -1)
    let old_line = line('.')
    while classType !=? classType2
	let classType2 = search('\<class\>',"bW")
	"class Node:public"
	let classType2 = substitute(getline(classType2),':'," ","")	
	let items= split(classType2)
	let classType2 = items[1]
	if s:save_counter > 50
	    break
	endif
	let s:save_counter += 1
    endwhile
    let classType = classType2
    let template = getline(line('.') - 1)
    if template =~ "template" && template =~ '<'
	let index = stridx(template,'<')
	let index2 = stridx(template,'>')
	let t_arg = strpart(template,index,index2-index+1)
	let t_arg = substitute(t_arg,"class","","g")
	let t_arg = substitute(t_arg,'\s',"","g")
    else
	let template = ""
	let t_arg = ""
    endif
    call cursor(old_line,1)

    let pre = funType . " " . classType . t_arg . "::" . funName
    let l_flag = classType . t_arg . "::" . funName

    if a:server_t == 'locate'
	return l_flag
    elseif a:server_t == 'funtype'
	return funType
    elseif a:server_t == 'funname'
	return funName
    elseif a:server_t == 'template'
	return template
    endif
    "part behind '('
    let index = strridx(post,';')
    let post = strpart(post,0,index)
    "remove default args
    let s:save_counter = 0
    while stridx(post,'=') != -1 
	let index = stridx(post,'=')
	let p_pre = strpart(post,0,index)
	if stridx(post,',',index) != -1
	    let index = stridx(post,',',index)
	    let p_post = strpart(post,index,strlen(post))
	else 
	    let index = stridx(post,')',index)
	    if index == -1
		"abstract method"
		return ''
	    endif
	    let p_post = strpart(post,index,strlen(post))
	endif
	let post = p_pre . p_post
	if s:save_counter > 50
	    echo "error: GetFunInfo"
	    break
	endif
	let s:save_counter +=1
    endwhile
    "cppfunname
    return  pre . post
endfunction

"return function name,given start line and end line of that function in a .h
"file
function! Get_H_Functionname(s_line,e_line)
    let line = a:s_line
    let FunName =""
    let s:save_counter = 0
    while line <= a:e_line
	let temp = getline(line)
	"remove whitespace and backslash
	let temp = substitute(temp,'\',"","")
	let temp = substitute(temp,'^\s\+',"","")
	let temp = substitute(temp,'\s\+$',"","")
	let FunName = FunName . temp
	let line += 1

	if s:save_counter > 50
	    echo "error: Get_H_Functionname"
	    break
	endif

	let s:save_counter +=1
    endwhile
    return FunName
endfunction
"find start and end line of a function ,given '(' ';' as symbol
function! Find_Fun_Scope_H(line)
    let temp = a:line
    let s:save_counter = 0
    "##################
    while getline(temp) !~ '('
	let temp -= 1
	if s:save_counter > 50
	    echo "error: Find_Fun_Scope_H"
	    break
	endif

	let s:save_counter +=1
    endwhile
    let s:s_line = temp
    let temp = a:line
    while getline(temp) !~ ';'
	let temp +=1
	if s:save_counter > 50
	    echo "error: Find_Fun_Scope_H()"
	    break
	endif

	let s:save_counter +=1
    endwhile
    let s:e_line = temp
endfunction

function! F_HbetweenCpp()
    if Is_H_File()
	if Is_Attr()
	    call Attr_To_Accessor()
	    return
	else
	    call F_H_To_Cpp()
	endif
    else
	call F_Cpp_To_H()
    endif
    normal zz
endfunction
"locate the function in cpp or add one
function! F_H_To_Cpp()
    call Find_Fun_Scope_H(line('v'))
    let f_name = Get_H_Functionname(s:s_line,s:e_line)
    let l_flag = f_name
    let l_template = f_name
    let l_flag = GetFunInfo(l_flag,'locate')
    let f_name = GetFunInfo(f_name,'cppfunname')
    if f_name == '' 
	echo "error ,abstract method"
	call HbetweenCpp()
	return
    endif
    let l_template = GetFunInfo(l_template,'template')
    call HbetweenCpp()

    normal zR
    let hit = 0
    if l_flag =~ '\~'
	let l_flag = substitute(l_flag,'\~','\\~','')

    endif

    while search(l_flag,'w') > 0
	if Next_Is(l_flag,'(')
	    let hit = 1
	    break
	endif
    endwhile
    if hit
	let hit_line = line('.')
	call cursor(hit_line,1)
    else
	normal G
    let endnamespace = getline(".")
    normal o
	if l_template != ""
	    call setline(".",l_template)
	endif
	call setline(line(".")+1,f_name . ' {' )

    call setline(line(".")+2, '')
    call setline(line(".")+3, endnamespace)
	normal Gk
    endif
endfunction
"''''''''''''''''''''''''''''''''''''''''''''''''''''''''
function! Auto_Cpp()
    "#################
    if g:m_auto && Is_H_File() && IsDeclare()
	call F_H_To_Cpp()
	call HbetweenCpp()
    endif
endfunction
function! IsDeclare()
    let line = getline(".")
    if line =~ ')' && line !~ '('
	return 1
    endif
    if line =~ ')' && line =~ '('
	let index1 = stridx(line,'(')
	let index2 = stridx(line,')')
	let line = strpart(line,index1,index2)
	if line =~ '\s'
	    return 1
	endif
    endif
    return 0
endfunction
"'''''''''''''''''''''''''''''''''''''''''''
"return the end line and set cursor to the pair{
function! F_Fun_End_Cpp(line)
    let s:save_counter = 0
    let line = a:line
    let temp = " "
    "###################
    while temp =~ '\s'
	let temp = getline(line)
	let index = stridx(temp,'}')
	if index != -1
	    let temp = strpart(temp,0,index)
	else
	    let temp = " "
	endif
	let line+=1
	if s:save_counter > 1000
	    echo "error: F_Fun_End_Cpp"
	    return -1
	endif
	let s:save_counter +=1
    endwhile

    let line -= 1
    call cursor(line,1)
    call searchpair('{','','}','bW')
    "line  = the end of the function

    return line 
endfunction


function! F_Cpp_To_H()
    let r =  F_Fun_End_Cpp(line("."))
    if r != -1 &&  search("::","bW") > 0
	let funName = getline(".")
	let index = strridx(funName,'::')
	let len = stridx(funName,'(') - index
	let funName = strpart(funName,index,len)
	let funName = substitute(funName,':','','g')
	let funName = substitute(funName,'\s','','g')
	call HbetweenCpp()
	normal gg
	let hit = 0
	let p = funName
	if p =~ '\~'
	    let p = substitute(p,'\~','\\~','')
	    let funName = substitute(funName,'\~','\\~','')
	else
	    let p= '\<' . funName . '\>'
	endif
	while search(p,'') > 0
	    if Next_Is(funName,'(')
		let hit = 1
		break
	    endif
	endwhile
	if !hit
	    echo "error: F_Cpp_To_H()"
	endif
    endif
endfunction

function! Comment_Code()
    if Is_H_File()
	if Is_Attr()
	    call Uncomment_Comment_Attr()
	else
	    let s:isToDel = 0
	    call Comment_Del_Code_H_To_Cpp()
	endif
    else
	let s:isToDel = 0
	call Comment_Del_Code_Cpp_To_H()
    endif
    let oldone=dictionary
    echo oldone
endfunction
function! Comment_Del_Code_H_To_Cpp()
    call Find_Fun_Scope_H(line('v'))
    let t = getline(s:e_line)
    let items = split(t)
    let e_line = s:e_line
    let s_line = s:s_line
    let t= Get_H_Functionname(s:s_line,s:e_line)
    let t= GetFunInfo(t,"funtype")
    call F_HbetweenCpp()
    if s:isToDel
	"delete function
	call F_Fun_Scope_Cpp(t)
	exe s:s_line . "," . s:e_line . "d"
	call HbetweenCpp()
	exe s_line . "," . e_line . "d"
	return
    endif
    if items[0] =~ '//'

	"comment to code
	"----uncomment .cpp file
	call F_Fun_Scope_Cpp(t)
	exe s:s_line . "," . s:e_line . "call Uncomment()"
	call HbetweenCpp()

	"----uncomment .h file
	exe s_line . "," . e_line . "call Uncomment()"
    else
	"code to comment
	"----comment .cpp file
	call F_Fun_Scope_Cpp(t)
	exe s:s_line . "," . s:e_line . "call Comment()"
	call HbetweenCpp()
	"----comment .h file
	exe s_line . "," . e_line . "call Comment()"
    endif
endfunction
"find the function scope in the cpp file ,given cursor under :: in cpp file
"retult to s:s_line ,s:e_line
function! F_Fun_Scope_Cpp(type)
    let s:s_line  = line('.')
    let s:e_line  =  F_Fun_End_Cpp(line("."))
    let a = getline(s:s_line - 1)
    "############# 
    let type = substitute(a:type,'/','','g')
    let type = substitute(type,'\s','','g')
    if a =~ type || a =~ 'template'
	let s:s_line -= 1
    endif

endfunction
function! Comment_Del_Code_Cpp_To_H()
    let e_line =  F_Fun_End_Cpp(line("."))
    let c = getline(e_line)
    let index = stridx(c,'}')
    let c = strpart(c,0,index)
    if e_line != -1 &&  search("::","bW") > 0
	" file .h
	let funName = getline(".")
	let index = strridx(funName,'::')
	let len = stridx(funName,'(') - index
	let funName = strpart(funName,index,len)
	let funName = substitute(funName,':','','g')
	let funName = substitute(funName,'\s','','g')
	call HbetweenCpp()
	normal gg
	let funName = '\<' . funName . '\>'
	call search(funName,"")
	call Find_Fun_Scope_H(line('v'))
	"get function return type
	let t= Get_H_Functionname(s:s_line,s:e_line)
	let t= GetFunInfo(t,"funtype")
	if s:isToDel
	    "delete function
	    exe s:s_line . "," . s:e_line . "d"
	    call HbetweenCpp()
	    call F_Fun_Scope_Cpp(t)
	    exe s:s_line . "," . s:e_line . "d"
	    return
	endif

	if c =~ '//'
	    "comment to code
	    exe s:s_line . "," . s:e_line . "call Uncomment()"
	else
	    "code to comment
	    exe s:s_line . "," . s:e_line . "call Comment()"
	endif
	"end 
	" file .cpp
	call HbetweenCpp()
	call F_Fun_Scope_Cpp(t)

	if c =~ '//'
	    "comment to code
	    exe s:s_line . "," . s:e_line . "call Uncomment()"
	else
	    "code to comment
	    exe s:s_line . "," . s:e_line . "call Comment()"
	endif
	"end
    endif
endfunction
function! Next_Is(word,symbol)
    let word = a:word
    let str= getline('.')
    let index1 = stridx(str,word)
    let index2 = stridx(str,a:symbol,index1)
    if index2 == -1
	return 0
    endif
    let str = strpart(str,index1,index2-index1)
    let str = substitute(str,word,'','')
    let str = substitute(str,'\s','','')
    return str == ''
endfunction
function! Del_Fun()
    if Is_H_File()
	if Is_Attr()
	    call Del_Attr()
	else
	    let s:isToDel = 1
	    call Comment_Del_Code_H_To_Cpp()
	endif
    else
	let s:isToDel = 1
	call Comment_Del_Code_Cpp_To_H()
    endif
endfunction
function! Comment()
    call cursor(line('.'),1)
    normal i//
endfunction
function! Uncomment()
    call cursor(line('.'),1)
    normal xx
endfunction
function! Is_Attr()
    let t = getline(".")
    "##############
    return t =~ ';' && t !~ ')'
endfunction
function! Del_Attr()
    let atrname =  Get_Attr_Info('name')
    normal dd
    "delete accssor
    let funName = "get" . atrname
    if Accessor_Scope(funName)
	exe s:s_line . "," . s:e_line . "d"
    endif
    let funName = "set" . atrname
    if Accessor_Scope(funName)
	exe s:s_line . "," . s:e_line . "d"
    endif

endfunction

function! Uncomment_Comment_Attr()
    let atrname =  Get_Attr_Info('name')
    let a = getline('.')
    let line = line('.')
    let items = split(a)
    if items[0] =~ '//'
	"uncomment
	call Uncomment()
    else
	"comment
	call Comment()
    endif
    let funName = "get" . atrname
    " comment or uncomment acessor
    if Accessor_Scope(funName)
	if items[0] =~ '//'
	    exe s:s_line . "," . s:e_line . "call Uncomment()"
	else
	    exe s:s_line . "," . s:e_line . "call Comment()"
	endif

    endif
    let funName = "set" . atrname
    if Accessor_Scope(funName)
	if items[0] =~ '//'
	    exe s:s_line . "," . s:e_line . "call Uncomment()"
	else
	    exe s:s_line . "," . s:e_line . "call Comment()"
	endif

    endif

endfunction
"go to acessor ,or create one
function! Attr_To_Accessor()
    let line = line('.')
    let atrname =  Get_Attr_Info('name')
    let atrtype =  Get_Attr_Info('type')
    let items = split(atrtype)
    if items[0] =~ 'static'
	return
    endif
    let funName = "get" . atrname
    if !Accessor_Scope(funName)
	let funName = "set" . atrname
	if !Accessor_Scope(funName)
	    call Create_Accessor(atrname,atrtype)
	    call cursor(line + 2,5)
	endif
    endif
endfunction
"create a  Accessor
function! Create_Accessor(atrname,atrtype)
    normal gg
    call search('\<accessor methods\>','')
    call search('\<public\>','')
    normal o
    let atrtype = a:atrtype
    if stridx(a:atrtype,'const') == 0
	let atrtype = substitute(atrtype,'const','','')
    endif

    exe "normal a" . atrtype
    "find the start of functionname
    normal A 
    let k = s:align1 - col('.')
    if col('.') < s:align1
	exe "normal " . k . "a "
    endif
    exe "normal a" .  " get" . a:atrname . "( ) const"
    "find the start of  { "
    normal A
    let k = s:align - col('.')
    if col('.') < s:align
	exe "normal " . k . "a "
    endif
    let k = line('.')
    "find the start of return ,but not work at all"
    exe "normal a" . "{"
    exe "normal 4a "
    exe "normal a" .  "return " . a:atrname . ";"
    call cursor(k,0)
    normal JJ
    "find the start of }"
    normal $i 
    let k = s:align + s:align2 - col('.')
    if col('.') < s:align +s:align2
	exe "normal " . k . "a "
    endif
    "not const attrbutie
    if stridx(a:atrtype,'const') != 0
	normal o
	let a = substitute(a:atrname,'_','','')
	"	let a = "input"
	let plut = ''
	"last bit of type"
	let t = strpart(a:atrtype,strlen(a:atrtype)-1,1)
	let c = ''
	if match(t,'*') ==-1 && match(t,'&') == -1
	    let c = "const "
	endif
	if  match(t,'\W') == -1
	    "type don't include symbol like * &
	    let items = split(a:atrtype)
	    let l = len(items) 
	    let t = items[l - 1]
	    if index(s:list,t) == -1
		let plut = '&'
	    else 
		let c = " "
	    endif
	endif
	if t =~ '>'
	    let plut = '&'
	endif

	exe "normal a" ."void"
	normal A 
	let k = s:align1 - col('.')
	if col('.') < s:align1
	    exe "normal " . k . "a "
	endif
	exe "normal a" .  " set" . a:atrname . "(" .c . a:atrtype . " " . plut .a . ")"

	normal A 
	let k = s:align - col('.')
	if col('.') < s:align
	    exe "normal " . k . "a "
	    "not work"	else
	    ""	    normal o
	    ""	    exe "normal " . s:align . "a "
	endif
	let k = line('.')
	exe "normal a" . "{"
	exe "normal 4a "
	exe "normal a" .  a:atrname . "=" . a . ";" 
	call cursor(k,0)
	normal JJ
	normal $i 
	let k = s:align + s:align2 - col('.')
	if col('.') < s:align +s:align2
	    exe "normal " . k . "a "
	endif
    endif
    normal gg=G
endfunction

"return 1 if exist Accessor and posit cursor uner the funtion line,set the scope info
"return 0 otherwise
function! Accessor_Scope(funName)
    normal G$
    let s:s_line = -1
    while search(a:funName,'b') > 0
	if Next_Is(a:funName,'(')
	    let s:s_line  = line('.')
	    break
	endif
    endwhile
    if s:s_line == -1 
	"doesn't exist aceesor
	return 0
    endif
    call search('{','') 
    let s:e_line = searchpair('{','','}','')
    return 1
endfunction
"given cursor under Attr line
"not static
"type       atrname;
"const int attr;"
function! Get_Attr_Info(type)
    let t = getline('.')
    let t = substitute(t,'/','','g')
    let t = substitute(t,'^\s\+',"","")
    let index = stridx(t,';')
    let t = strpart(t,0,index)
    let t1 = substitute(t,'\W','#','g')
    let index = strridx(t1,'#')
    let n = ""
    if a:type == 'name'
	let t = strpart(t,index+1)
	let t = substitute(t,'\W','','g')
	return t
    elseif a:type == 'type'
	"type
	let t2 = strpart(t,0,index+1)
	let t2 = substitute(t2,'\s\+$',"","")
	"*&
	let n = strpart(t,index+1)
	let index =0
	let p = ''
	let p2 = ''
	"\W ,one bit
	"############
	while	match(n,'\W',index) != -1
	    let index = match(n,'\W',index)
	    let p2 = strpart(n,index,1)
	    let p = p . p2
	    let index += 1
	endwhile
	"
	let t = t2 . p
	let itemss = split(t)
	let t = ''
	let tlen = len(itemss)
	let tlen2 = 0
	while tlen2 < tlen
	    let t = t . itemss[tlen2] 
	    let tlen2 +=1
	endwhile
	return t
    endif
endfunction
"won't work for tempnary file
function! All_Replace()
    let name = bufname("%")
    "args *.{cpp,c,h}
    exe "args *". g:m_type 
    let n = 1
    let s = input("replace word:")
    let t = input("with:")
    let ask = ''
    "whether ask user before modifying
    if s =~ '?'
	let ask = 'c'
    endif
    let s = substitute(s,'?','','g')
    let ss = '\<' . s . '\>'
    while n <= argc ()
	exe "argument " . n
	normal G$
	while search(ss,'w') > 0
	    if t =~'d!'
		normal dd
		continue
	    endif
	    exe 's/' . ss . '/' . t . '/g' . ask 
	endwhile
	let n = n + 1
    endwhile
    exe "e " . name
endfunction

