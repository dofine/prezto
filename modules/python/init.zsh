#
# Enables local Python package installation.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#   Sebastian Wiesner <lunaryorn@googlemail.com>
#

# Load manually installed pyenv into the shell session.
if [[ -s "$HOME/.pyenv/bin/pyenv" ]]; then
  # path=("$HOME/.pyenv/bin" $path)
  # eval "$(pyenv init -)"
  # export PYENV_ROOT=/usr/local/opt/pyenv
  # source $PYENV_ROOT/completions/pyenv.zsh


# Load package manager installed pyenv into the shell session.
elif (( $+commands[pyenv] )); then
  eval "$(pyenv init -)"
  # the line below must be put in ~/.zshenv
  # eval "$(pyenv virtualenv-init -)"
  export PYENV_ROOT=/usr/local/opt/pyenv
  source $PYENV_ROOT/completions/pyenv.zsh


# Prepend PEP 370 per user site packages directory, which defaults to
# ~/Library/Python on Mac OS X and ~/.local elsewhere, to PATH. The
# path can be overridden using PYTHONUSERBASE.
else
  if [[ -n "$PYTHONUSERBASE" ]]; then
    path=($PYTHONUSERBASE/bin $path)
  elif [[ "$OSTYPE" == darwin* ]]; then
    path=($HOME/Library/Python/*/bin(N) $path)
  else
    # This is subject to change.
    path=($HOME/.local/bin $path)
  fi
fi

# Source pyenv-virtualenv 

# Return if requirements are not found.
if (( ! $+commands[python] && ! $+commands[pyenv] )); then
  return 1
fi

VIRTUAL_ENV_DISABLE_PROMPT=1


# Load virtualenvwrapper into the shell session.
# if (( $+commands[virtualenvwrapper.sh] )); then
#   # set the directory where virtual environments are stored.
#   export workon_home="$home/.virtualenvs"
#   export project_home=$home/devel
#   source /usr/local/bin/virtualenvwrapper.sh


#   # disable the virtualenv prompt.
#   virtual_env_disable_prompt=1

#   source "$commands[virtualenvwrapper.sh]"
# fi

# export PIP_REQUIRE_VIRTUALENV=true
# export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache

# global pip
# gpip() {
#   PIP_REQUIRE_VIRTUALENV="" pip "$@"
# }


#
# Aliases
#

alias py='python'
