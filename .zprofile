autoload -U compinit
compinit
export CLICOLOR=1
export LSCOLORS="GxFxCxDxBxegedabagaced"
export PYENV_ROOT="${HOME}/.pyenv"
export PATH="${PYENV_ROOT}/bin:$PATH"
eval "$(pyenv init -)"
if [ -f ~/.zshrc ]; then
    . ~/.zshrc
fi

NAME=`id -u -n`
echo "${NAME}、君を待っていたよ"
