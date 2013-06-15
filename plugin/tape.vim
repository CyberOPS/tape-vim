"Only load this plugin once"
if exists("b:loaded_tape")
	finish
endif
let b:loaded_tape = 1

"Set path for undo files and make them"
if has('unix') || has('mac') || has('macunix')
	let undopath = "~/.vim/undodir//"

	if isdirectory(undopath) == 'FALSE'
		call system('mkdir ' . undopath)
	endif

	set undodir=~/.vim/undodir//

elseif has('win32') || has('win64')
	if isdirectory('$appdata\\vimundodir\\\\') == 'FALSE'
		call system('mkdir %AppData%\\vimundodir\\\\')
	endif

	set undodir=$appdata/vimundodir//
endif

"Enable persistent undo"
set undofile
