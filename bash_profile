. ~/.bashrc
ENV=$HOME/.bashrc
export ENV
export PATH=/usr/local/mysql/bin:$PATH


# Try this sometime: http://lindesk.com/2009/03/customizing-the-terminal-the-prompt/
#
if [ "$PS1" ]; then
      export PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'
      PS1='\u@\h:\W\$ '
fi

# From http://blog.macromates.com/2008/working-with-history-in-bash/
# Removes duplicates.
export HISTCONTROL=erasedups
# Increases history size.
export HISTFILESIZE=1000000000
export HISTSIZE=1000000
# Adds history from a session to .bash_history on exit.
shopt -s histappend

PROMPT_COMMAND='history -a'

#export PYTHONPATH=/Users/phil/Sites/testserver/djcode/ 

# To get OpenCV working.
export PYTHONPATH=/usr/local/lib/python2.7/site-packages:$PYTHONPATH

# For node.js (installed with homebrew).
export NODE_PATH='/usr/local/lib/node_modules'

# From http://docs.djangoproject.com/en/dev/ref/contrib/gis/install/#kyngchaos-packages
export PATH=/Library/Frameworks/UnixImageIO.framework/Programs:$PATH
export PATH=/Library/Frameworks/PROJ.framework/Programs:$PATH
export PATH=/Library/Frameworks/GEOS.framework/Programs:$PATH
export PATH=/Library/Frameworks/SQLite3.framework/Programs:$PATH
export PATH=/Library/Frameworks/GDAL.framework/Programs:$PATH
export PATH=/usr/local/pgsql/bin:$PATH

# Use SublimeText for things that want a text editor.
export EDITOR='subl -w'

# Don't check mail when opening terminal.
unset MAILCHECK

########################################################################
# ALIASES for servers, databases, etc

alias baked="ssh -l phil baked.haddock.org"
alias plum="ssh -l philg plum.flirble.org"

alias cloudview="ssh -l philgyford cloudview.joyent.us"
alias butte="ssh -l philgyford butte.joyent.us"
alias price="ssh -l philgyford price.textdrive.us"

alias spacebar="telnet spacebar.com 7227"


########################################################################
# GENERAL ALIASES

alias mysql="mysql --default-character-set=utf8"

alias mactop="top -ocpu -R -F -s 2 -n30"

alias psql="/usr/local/bin/psql"

alias php5='/usr/local/php5/bin/php'

# What I had before:
#alias l='ls -lh'
#alias ll='ls -lah'

# ALL THE BELOW from
# https://github.com/revans/bash-it/blob/master/aliases/available/general.aliases.bash

# List directory contents
alias sl=ls
alias ls='ls -G'        # Compact view, show colors
alias la='ls -AF'       # Compact view, show hidden
alias ll='ls -al'
alias l='ls -a'
alias l1='ls -1'

alias c='clear'
alias k='clear'
alias cls='clear'

alias ..='cd ..'         # Go up one directory
alias ...='cd ../..'     # Go up two directories
alias ....='cd ../../..' # Go up two directories
alias -- -="cd -"        # Go back

# Directory
alias	md='mkdir -p'
alias	rd=rmdir

alias h='heroku'

alias m='./manage.py'

########################################################################
# GIT ALIASES originally from
# https://github.com/revans/bash-it/blob/master/aliases/available/git.aliases.bash

alias gcl='git clone'
alias ga='git add'
alias gall='git add .'
alias g='git'
alias get='git'
alias gst='git status'
alias gs='git status'
alias gss='git status -s'
alias gl='git pull'
alias glo='git pull origin'
alias gup='git fetch && git rebase'
alias gp='git push'
alias gpo='git push origin'
alias gdv='git diff -w "$@" | vim -R -'
alias gc='git commit'
alias gca='git commit -a'
# alias gc='git commit -v'
# alias gca='git commit -v -a'
alias gci='git commit --interactive'
alias gb='git branch'
alias gba='git branch -a'
alias gcount='git shortlog -sn'
alias gcp='git cherry-pick'
alias gco='git checkout'
alias gexport='git archive --format zip --output'
alias gdel='git branch -D'
alias gmu='git fetch origin -v; git fetch upstream -v; git merge upstream/master'
alias gll='git log --graph --pretty=oneline --abbrev-commit'

case $OSTYPE in
  linux*)
    alias gd='git diff | vim -R -'
    ;;
  darwin*)
    alias gd='git diff | mate'
    ;;
  darwin*)
    alias gd='git diff'
    ;;
esac


