"=============================================
"    Name: python.vim
"    File: python.vim
" Summary: highlight reStructuredText in python docstring.
"  Author: Rykka G.F
"  Update: 2012-09-25
"=============================================
let s:cpo_save = &cpo
set cpo-=C

if g:riv_python_rst_hl == 1 
    " Store the current syntax because python-mode set's it's syntax to pymode and
    " not python
    let g:_riv_stored_syntax = b:current_syntax
    " Let the after/syntax/rst.vim know that this is not a full RST file, this
    " way, it won't enable spelling on the whole file
    let g:_riv_incluing_python_rst = 1

    unlet! b:current_syntax
    syn include @python_rst <sfile>:p:h:h:h/syntax/rst.vim
    syn include @python_rst <sfile>:p:h/rst.vim
    syn region  pythonRstString matchgroup=pythonString
        \ start=+[uU]\=\z('''\|"""\)+ end="\z1" keepend
        \ contains=@python_rst,@Spell
    " Restore the previous syntax
    let b:current_syntax = g:_riv_stored_syntax
    " Clear the temporary variable
    unlet! g:_riv_stored_syntax
    unlet! g:_riv_incluing_python_rst
endif

let &cpo = s:cpo_save
unlet s:cpo_save


"=============================================
"    Name: python.vim
"    File: python.vim
" Summary: for jedi
"  Author: Rykka G.F
"  Update: 2012-09-25
"=============================================

if !jedi#init_python()
    finish
endif

if g:jedi#show_call_signatures > 0 && has('conceal')
    " +conceal is the default for vim >= 7.3

    let s:e = g:jedi#call_signature_escape
    let s:full = s:e.'jedi=.\{-}'.s:e.'.\{-}'.s:e.'jedi'.s:e
    let s:ignore = s:e.'jedi.\{-}'.s:e
    exe 'syn match jediIgnore "'.s:ignore.'" contained conceal'
    setlocal conceallevel=2
    syn match jediFatSymbol "\*_\*" contained conceal
    syn match jediFat "\*_\*.\{-}\*_\*" contained contains=jediFatSymbol
    syn match jediSpace "\v[ ]+( )@=" contained
    exe 'syn match jediFunction "'.s:full.'" keepend extend '
                \ .' contains=jediIgnore,jediFat,jediSpace'
                \ .' containedin=pythonComment,pythonString,pythonRawString'
    unlet! s:e s:full s:ignore

    hi def link jediIgnore Ignore
    hi def link jediFatSymbol Ignore
    hi def link jediSpace Normal

    if exists('g:colors_name')
        hi def link jediFunction CursorLine
        hi def link jediFat TabLine
    else
        hi jediFunction term=NONE cterm=NONE ctermfg=6 guifg=Black gui=NONE ctermbg=0 guibg=Grey
        hi jediFat term=bold,underline cterm=bold,underline gui=bold,underline ctermbg=0 guibg=#555555
    endif
endif
