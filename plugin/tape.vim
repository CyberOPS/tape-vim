" Tape.vim - Temporary Persistent Undo
" Maintainer: Kevin C. <skate_ops@yahoo.com>
" License:  Distributed under the same terms as Vim itself
" Version: 0.9

if exists('g:loaded_tape')
	finish
endif
let g:loaded_pathogen = 1


if !exists('g:tape_expire')
	let g:tape_expire = 5
endif


function! Tape(...)
	"If no value is given, set days to default"
	if a:0 == 0
		let days = g:tape_expire
	else
		let days = a:1
	endif

	if has('unix') || has('mac') || has('macunix')
		"Define undopath for unixy systems"
		let undopath = "~/.vim/undodir/"

		"Ensure directory path exist"
		if !isdirectory(undopath)
			call system('mkdir '.undopath)
		endif

		"Set undodir"
		set undodir=~/.vim/undodir//

		"Remove old files"
		if days == 0
			call system('rm -f '.undopath.'*')
		else
			call system('find '.undopath.' -type f -mtime +'.days.' -exec rm {} \;')
		endif

	elseif has('win32') || has('win64')
		"Define undopath for MS Windows"
		let undopath = '%AppData%\vim\undodir'

		"Ensure directory path exist"
		if isdirectory('$appdata/vim/undodir') == 'FALSE'
			call system('mkdir ' . undopath)
		endif

		"Set undodir"
		set undodir=$appdata/vim/undodir//

		"Remove old files"
		if days <= 0
			call system('del /q '.undopath.'*')
		else
			"Windows Vista and earlier"
			call system('forfiles -p "'.undopath.'" -s -m *.* -d '.days.' -c "cmd /c del @path"')
			"Windows 7 & later"
			call system('forfiles -p "'.undopath.'" -s -m *.* /D -'.days.' /C "cmd /c del @path"')
		endif
	endif

	"Enable persistent undo"
	set undofile
endfunction


call Tape(g:tape_expire)


"Set user command to manually clean history"
command! -nargs=? TPclean call Tape(<f-args>)
command! -nargs=? TPc call Tape(<f-args>)
