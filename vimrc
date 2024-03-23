" all vim stuff is in the root of camx.  
" each subdirectory should have exrc which have source ../.exrc
" also, your ~/.vimrc should have set exrc, of cource
let rootdir =  expand("<sfile>:p:h")

" for K command, look for the token from files in Inc
let &kp = rootdir . '/vim/searchkw.sh -p ' . rootdir

" tags file in the root have everything (ctags * */*)
let &tags = &tags . ',' . rootdir . '/tags'

" grep result is skimmed to get rid of matches for OSAT, DDM etc
let &gp = 'grep -n $* /dev/null \| '. rootdir . '/vim/skimgrep.prl'

" environ uses prm, com for extention
au BufRead,BufNewFile *.prm,*.prm.*,*.com,*.inc		set filetype=fortran

" compiler
" im assuming that we are uing pgf90.  i once had vompiler/pgf90.vim, i add
" them to github repo when i find those..
if filereadable($VIMRUNTIME . '/compiler/pgf90.vim') || filereadable($VIM        . '/vimfiles/compiler/pgf90.vim') || filereadable($HOME  . '/.vim/compiler/pgf90.vim')
	compiler pgf90
endif

" we used fixed-form code
let fortran_fixed_source=1
" below turns of some sybtax problem like 72 char limit
let fortran_have_tabs=1
" i actually want to change this line in syntax/fortran.vim
"syn match fortranSerialNumber	excludenl "^.\{72,}$"lc=72
" into this, sinc i have long format.  but i dont want to edit
" vim/syntax/fortran.vim so i let it be with have_tabs
"syn match fortranSerialNumber	excludenl "^.\{132,}$"lc=132

" fold OSAT, DDM etc
se fdm=expr
se fde=FoldCAMx()

" it done not create fold if "Source Appporion" is chosen as below
" TODO not sure if this use of variable because it is hard wired anyway..
let expand_by_default="None"
"let expand_by_default="Process Analysis"
"let g:expand_by_default="Source Apportion"

function! FoldCAMx()
	if getline(v:lnum)=~'^c=\+.*\ Begin'
		"if getline(v:lnum)=~"Source Apportion"
		if getline(v:lnum)=~g:expand_by_default
			return "="
		else
			return 1
		endif
	elseif getline(v:lnum-1)=~'^c=\+.*\ End'
		return 0
	else 
		return "="
	endif
endfunction


" other options
se aw
se diffopt+=iwhite
