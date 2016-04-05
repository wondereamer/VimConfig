" Vim syntax file
" Language:	zjt
" Maintainer:	WDJ <dingjie.wang@gmail.com>
" Last Change:	2009 Nov 17

" Quit when a (custom) syntax file was already loaded
if exists("b:current_syntax")
  finish
endif
":syntax list {group-name}
syntax case ignore
"syntax case match

syn keyword xFun 
	\ H[IGH] L[OW] BUY BUYSHORT SELL SELLSHORT REF C[LOSE] O[PEN] IF BARPOS CEILING MINDIFF ma Date Time UBOUND SETUBOUND COLORSTICK
	\ HOLDING BARSLAST HHV LLV max min floor DRAWLINE BARSLAST BARSLAST ENTERBARS tr NODRAW cross Longcross abs VARIABLE Mod 
syn keyword	xStatement	IF FOR ELSE IFELSE AND OR THEN BEGIN END input False True Not Const


syntax keyword xTodo TODO contained
syntax match xComment /\/\/.*/    contains=xTodo
syntax region xString start=/"/ skip=/\\"/ end=/"/ 
"syntax region xBlock start=/{/ end=/}/ contains=xBlock
" display the begin and end with another way
"syntax region xInside matchgroup=xComment start=/(/ end=/)/


hi link xComment    Special
hi link xStatement  Keyword
hi link xTodo       Error
hi link xString     String
hi link xFun        Comment

let b:current_syntax = "zjt"
