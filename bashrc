#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# cp reflink (btrfs optimization)
alias cp='cp --reflink=auto'

# virtualenv
source /usr/bin/virtualenvwrapper.sh

# virtualenv aliases
# http://blog.doughellmann.com/2010/01/virtualenvwrapper-tips-and-tricks.html
vmk ()
{
    mkvirtualenv --no-site-packages --python=$(which python2) $1 && pip install -U pip && pip install ipython pdbpp anaconda_mode autoflake flake8 flake8-bugbear pylint python-language-server pyls-isort pyls-mypy
}
vmks ()
{
    mkvirtualenv --system-site-packages --python=$(which python2) $1 && pip install ipython pdbpp anaconda_mode autoflake flake8 flake8-bugbear pylint python-language-server pyls-isort pyls-mypy
}
vmk3 ()
{
    mkvirtualenv --no-site-packages $1 && pip install ipython pdbpp anaconda_mode autoflake flake8-bugbear flake8 pylint python-language-server pyls-isort pyls-mypy
}
vmk36 ()
{
    mkvirtualenv --no-site-packages --python=$(which python3.6) $1 && pip install ipython pdbpp anaconda_mode autoflake flake8-bugbear flake8 pylint python-language-server pyls-isort pyls-mypy
}
alias v='workon'
alias v.d='deactivate'
alias v.mk='vmk'
alias v.mks='vmks'
alias v.mk3='vmk3'
alias v.mk36='vmk36'
alias v.mk_withsitepackages='mkvirtualenv'
alias v.rm='rmvirtualenv'
alias v.switch='workon'
alias v.add2virtualenv='add2virtualenv'
alias v.cdsitepackages='cdsitepackages'
alias v.cd='cdvirtualenv'
alias v.lssitepackages='lssitepackages'
alias v.up='allvirtualenv pip install -U pip && allvirtualenv pip install -U ipython pdbpp anaconda_mode autoflake flake8 flake8-bugbear pylint python-language-server pyls-isort pyls-mypy'

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

# Autoswitch virtualenv
#
# Wrapper function that is called if cd is invoked
# by the current shell
#
function cd {
    # call builtin cd. change to the new directory
    builtin cd "$@"
    # call a hook function that can use the new working directory
    # to decide what to do
    switch_venv
}

#
# Changes the color of the prompt depending
# on the current working directory
#
function switch_venv {
    if [ -f '.venv' ]; then
        v $(< .venv)
    fi
}

# Check the current directory for existing venv
switch_venv

function em {
    venv=${VIRTUAL_ENV##*/}
    if [[ "x"$venv"x" == "xx" ]]
    then
        emacs $@
    else
        emacs -T $venv $@
    fi
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