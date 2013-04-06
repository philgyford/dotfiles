SHELL=/bin/bash

PATH=/usr/local/bin:/usr/local/sbin:$PATH

export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh
export PIP_VIRTUALENV_BASE=$WORKON_HOME # Tell pip to create its virtualenvs in $WORKON_HOME.
export PIP_RESPECT_VIRTUALENV=true # Tell pip to automatically use the currently active virtualenv.

# For CLW RotaMC
# export PYTHONPATH='/Users/phil/Projects/CLW/clwcore:/Users/phil/Projects/CLW/clwpy'
export PYTHONPATH='/Users/phil/Projects/CLW/clwpy'

