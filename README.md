# Tape.vim: Temporary Persistant Undo
Tape is meant to give Vim the benefit of remembering your undo history for a
period of time after you close Vim while keeping those ugly .un~ files out of
way.

## How it Works
Basically, Tape enables Vim's built in persistent undo feature while hiding the 
hidden undo files in `~/.vim/undodir` (`%AppData%\vim\undodir` on MS-Windows),
minimizing litter in the file system. The undo files are given unique names
based on their path allowing vim to know the diffrence between two files with
the same name but in different directories. All undo files will expire 5 days
after last modification leaving no reason to manually delete them all the time;
This can be adjusted by inserting `let g:tape_expire = N` with `N` as the number
of days you'd prefer the files to last.

Tape.vim also allows manually clearing undo files older than a specified amount
of days with `:TPclean` (or `:TPc`). To clear all undo files type `:TPclean 0`.
`TPclean` by it's self will clear files older than the days `g:tape_expire` is
set to (5 by default).

## Install
This script should work with unixy systems and MS Windows.

Optionally add `let g:tape_expire = N` to your .vimrc, with N being the number
of days an undo file will have after its last modification before it's
deleted. If you do not add this to your .vimrc, it will default to 5 days.

### Normal Way
Copy contents of project into `~/.vim`.

### Pathogen Way
[*Install Pathogen.vim*](https://github.com/tpope/vim-pathogen)

Clone or copy project to `~/.vim/bundle`.

## License
Copyright (c) Kevin C. Distributed under the same terms as Vim itself. See
`:help license`.
