"Only load this plugin once."
if exists("b:loaded_tape")
	finish
endif
let b:loaded_tape = 1

"Set path for undo files"
if has('unix') || has('mac') || has('macunix')
	let undopath = '~/.vim/undodir//'
elseif has('win32') || has('win64')
	let undopath = "%appdata%\\vimundodir\\\\"
endif

"Ensure undo folder exist; make it if not"
if isdirectory(undopath) == 'FALSE'
	call system("mkdir " . undopath)
endif

"Enable persistent undo history"
set undofile
set undodir=undopath
