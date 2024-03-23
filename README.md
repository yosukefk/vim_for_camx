# vim for camx

## install

1. instal CAMx first, https://camx.com/.  ctags used, but that comes with vim
2. go to the top directory of camx installation, and `git clone https://github.com/yosukefk/vim_for_camx.git`
3. `cd vim_for_camx; make`

## use
from vim,
1. ctags has set up, so you can <kbd>CTRL-]</kbd> to jump to definition of a function, for example.   see https://vimhelp.org/tagsrch.txt.html , or page like this https://kulkarniamit.github.io/whatwhyhow/howto/use-vim-ctags.html
2. keywordprg is set to search the include files in /Include dir.  so <kbd>K</kbd> on variable would find the defintion of variables
3. code block like "=== Source Apportion Begin ===" are folded.  if you need to see content, <kbd>zo</kbd>, and close again with <kbd>zc</kbd>.  see https://vimhelp.org/fold.txt.html , or find some info for "vim folding"

