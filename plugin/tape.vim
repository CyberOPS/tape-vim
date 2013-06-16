"Set path for undo files and make them"
if has('unix') || has('mac') || has('macunix')
	let undopath = "~/.vim/undodir/"

	if isdirectory(undopath) == 'FALSE'
		call system('mkdir ' . undopath)
	endif

	"Delete files older than 5 days"
	call system('find ' . undopath . ' -type f -mtime +5 -exec rm {} \;')

	set undodir=~/.vim/undodir//

elseif has('win32') || has('win64')
	let undopath = '%AppData%\\vim\\undodir\\'

	if isdirectory('$appdata/vim/undodir/') == 'FALSE'
		call system('mkdir ' . undopath)
	endif

	"Delete files older than 5 days"
	call system('forfiles -p "' . undopath . '" -s -m *.* -d 5 -c "cmd /c del @path"')

	set undodir=$appdata/vim/undodir//
endif

"Enable persistent undo"
set undofile
