# Tape.vim: Temporary Persistant Undo

Tape is short for **T**empor**a**ry **Pe**rsistent Undo. It's meant to give Vim
the benefit of remembering your undo history for a period of time after you
close Vim while keeping those ugly .un~ out of the way and cleaning them out
automatically.

## How it Works

Basically, Tape enables Vim's built in persistent undo feature while hiding the 
hidden undo files in `~/.vim/undodir`, minimizing litter in file system. The
undo files are given unique names based on their path allowing vim to identify
two same name files in different directories as separate. These file's will
expire after a certain ammount of days (defaults to 5) after last use giving
you no reason to manually delete them along with their respective files.

If you would like to change the undodir, you will have to modify the script in
2 (on unixy Systems) or 3 (on MS-Windows) places.

## Install

This script should work with Unixy systems and MS Windows.

In your vimrc insert `Tape` or `Tape N` with N being the number of days an undo
will have after its last modification date.

### Normal Way

Copy contents of project into `~/.vim`

### Pathogen Way

Clone in or copy project to `~/.vim/bundle`

## License
Copyright (c) Kevin C. Distributed under the same terms as Vim itself. See
`:help license`.
