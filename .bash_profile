export CLICOLOR=1
export LSCOLORS="GxFxCxDxBxegedabagaced"
export PYENV_ROOT="${HOME}/.pyenv"
export PATH="${PYENV_ROOT}/bin:$PATH"
eval "$(pyenv init -)"
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi
