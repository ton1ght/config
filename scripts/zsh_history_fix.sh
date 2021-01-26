#!/usr/bin/env zsh
# George Ornbo (shapeshed) http://shapeshed.com
# License - http://unlicense.org
#
# Fixes a corrupt .zsh_history file

mv $ZDOTDIR/.histfile $ZDOTDIR/.histfile_bad
strings $ZDOTDIR/.histfile_bad > $ZDOTDIR/.histfile
fc -R $ZDOTDIR/.histfile
rm $ZDOTDIR/.histfile_bad
