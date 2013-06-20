# Tape.vim: Temporary Persistant Undo
Tape is meant to give Vim the benefit of remembering your undo history for a
period of time after you close Vim while keeping those ugly .un~ out of the way
and cleaning them out automatically.

## How it Works
Basically, Tape enables Vim's built in persistent undo feature while hiding the 
hidden undo files in `~/.vim/undodir` (`%AppData%\vim\undodir` on MS-Windows),
minimizing litter in the file system. The undo files are given unique names
based on their path allowing vim to identify two same named files, in different
directories, as separate. These files will expire after 5 days from last use
giving no reason to manually delete them. If you want you can prolong the life
of your undo files by putting `let g:tape_expire = N` in your .vimrc, with N
being the number of days an undo file will live.

Tape.vim also allows manually clearing undo files older than a specified amount
of days `:TPclean` (or `:TPc`). To clear all undo files type `:TPclean 0`.
`TPclean` by it's self will clear files older than 5 days or the by the days
`g:tape_expire is set to`.

## Install
This script should work with unixy systems and MS Windows.

(Optional) Add `let g:tape_expire = N` to your .vimrc, with N being the number
of days an undo file will have after its last modification date before it's
deleted.  If you do not add this to your .vimrc, it will default to 5 days.

### Normal Way
Copy contents of project into `~/.vim`

### Pathogen Way
*Install Pathogen.vim*

Clone in or copy project to `~/.vim/bundle`

## License
Copyright (c) Kevin C. Distributed under the same terms as Vim itself. See
`:help license`.
