function! Tapedown(...)
	"If no value (or zero) is given, set days to default"
	if a:0 == 0
		let days = '5'
	else
		let days = a:1
	endif

	if has('unix') || has('mac') || has('macunix')
		"Define undopath for unixy systems"
		let undopath = "~/.vim/undodir/"

		"Ensure directory path exist"
		if isdirectory(undopath) == 'FALSE'
			call system('mkdir ' . undopath)
		endif

		"Set undodir"
		set undodir=~/.vim/undodir//

		"Delete files older than 5 days"
		call system('find ' . undopath . ' -type f -mtime +' . days . ' -exec rm {} \;')

	elseif has('win32') || has('win64')
		"Define undopath for MS Windows"
		let undopath = '%AppData%\vim\undodir'

		"Ensure directory path exist"
		if isdirectory('$appdata/vim/undodir') == 'FALSE'
			call system('mkdir ' . undopath)
		endif

		"Set undodir"
		set undodir=$appdata/vim/undodir//

		"Delete files older than 5 days"
			"Windows Vista and earlier"
		call system('forfiles -p "' . undopath . '" -s -m *.* -d ' . days . ' -c "cmd /c del @path"')
			"Windows 7 & later"
		call system('forfiles -p "' . undopath . '" -s -m *.* /D -' . days . ' /C "cmd /c del @path"')
	endif

	"Enable persistent undo"
	set undofile
endfunction

command! -nargs=? Tape call Tapedown(<f-args>)
