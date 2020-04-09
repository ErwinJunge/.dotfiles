#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# cp reflink (btrfs optimization)
alias cp='cp --reflink=auto'

# Recursive grep
rg ()
{
  fnpart="$1"
  filename=$HOME/.greps/${fnpart//\//_}
  if [ -z "$2" ]; then
    grep -I -r -n --exclude-dir=".git" --exclude-dir=".svn" "$1" . > "$filename"
  else
    grep -I -r -n --exclude-dir=".git" --exclude-dir=".svn" --include "*.$2" "$1" . > "$filename"
  fi
  less "$filename"
}
rgi ()
{
  fnpart="$1"
  filename=$HOME/.greps/${fnpart//\//_}
  if [ -z "$2" ]; then
    grep -I -i -r -n --exclude-dir=".git" --exclude-dir=".svn" "$1" . > "$filename"
  else
    grep -I -i -r -n --exclude-dir=".git" --exclude-dir=".svn" --include "*.$2" "$1" . > "$filename"
  fi
  less "$filename"
}

# ntfs rsync
alias ntfs_rsync='rsync --modify-window=3601'

# emacs title
alias emacs='emacs --name $(basename $(pwd)) -mm'

EDITOR=vim
alias pacupg='sudo pacman -Syuw && sudo snp pacman -Su'

# Fix gnome-terminal not switching to current working directory on new tab
if [ -e /etc/profile.d/vte.sh ]
then
    . /etc/profile.d/vte.sh
fi

# use pkgfile command-not-found hook
if [ -e /usr/share/doc/pkgfile/command-not-found.bash ]
then
    source /usr/share/doc/pkgfile/command-not-found.bash
fi

# nvm
if [ -e /usr/share/nvm/init-nvm.sh ]
then
    source /usr/share/nvm/init-nvm.sh
    alias nvmu='nvm use --delete-prefix'
fi
