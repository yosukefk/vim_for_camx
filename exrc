" all vim stuff is in the root of camx.  
" each subdirectory should have exrc which have source ../.exrc
" also, your ~/.vimrc should have set exrc, of cource
"let rootdir = $HOME . "/Desktop/work/camx420_lpa"
"let rootdir = $HOME . "/src/work/camx420_lpa"
"let rootdir = "/sunghye.old/yosuketmp/camx420_lpa"
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
if filereadable($VIMRUNTIME . '/compiler/pgf90.vim') || filereadable($VIM        . '/vimfiles/compiler/pgf90.vim') || filereadable($HOME  . '/.vim/compiler/pgf90.vim')
	compiler pgf90
endif

" we used fixed-form code
let fortran_fixed_source=1

" fold OSAT, DDM etc
se fdm=expr
se fde=FoldCAMx()
function! FoldCAMx()
	if getline(v:lnum)=~'^c=\+.*\ Begin'
		"if getline(v:lnum)=~'Process Analysis'
		if getline(v:lnum)=~'xxxx'
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
