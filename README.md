# Tape.vim: Temporary Persistant Undo
Tape is meant to give Vim the benefit of remembering your undo history for a
period of time after you close Vim while keeping those ugly .un~ out of the way
and cleaning them out automatically.

## How it Works
Basically, Tape enables Vim's built in persistent undo feature while hiding the 
hidden undo files in `~/.vim/undodir` (`%AppData%\vim\undodir` on MS-Windows),
minimizing litter in your file system. The undo files are given unique names
based on their path allowing vim to identify two same named files, in different
directories, as separate. These files will expire after a certain amount of
days (defaults to 5) after last use giving you no reason to manually delete
them along with their respective files.

## Install
This script should work with unixy systems and MS Windows.

(Optional) Add `g:tape_expire N` to your .vimrc, with N being the number of
days an undo will have after its last modification date before it's deleted.
If you do not add this to your .vimrc, it will default to 5 days.

### Normal Way
Copy contents of project into `~/.vim`

### Pathogen Way
*Install Pathogen.vim*

Clone in or copy project to `~/.vim/bundle`

## License
Copyright (c) Kevin C. Distributed under the same terms as Vim itself. See
`:help license`.
