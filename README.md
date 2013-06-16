# Tape.vim: Temporary Persistant Undo

Tape is short for **T**empor**a**ry **Pe**rsistent Undo. It's meant to give Vim the benefit
of remembering your undo history for a period of time after you close Vim while
keeping those ugly .un~ out of the way and cleaning them out automatically.

## How it Works

Basically, Tape enables Vim's built in persistent undo feature but instead of
littering your file system with hidden .un~ files it stores them in
`~/.vim/undodir`. The undo files are given unique names based on their path
allowing vim to distinguish between two files with the same name in separate
directories. These file's will expire 5 days after last use giving you no
reason to manually delete them along with their respective files.

If you would like to change the undodir or extend your .un~ files shelf life,
the script is small, but you may need to make changes in more than one place
for the script to work properly.

## Supported Platforms

This script should work with Unixy systems and MS Windows.

## Install

Copy contents of project into `~/.vim`

### With Pathogen

Clone in or copy project to `~/.vim/bundle`

## License
Copyright (c) Kevin C. Distributed under the same terms as Vim itself. See
`:help license`.
