alias sa="source $PYENV_ROOT/versions/anaconda3-4.2.0/bin/activate"
alias la="lah"

# bashを消すのがこわいからここでzshを読みこむ
DOT_DIRECTORY="${HOME}/dotfiles"
cd ${DOT_DIRECTORY}

for f in .zshrc
do
    source ${DOT_DIRECTORY}/${f}
done

brew() {
  if [ "$1" = update ]; then
    shift
    set -- update -v "$@"
  fi
  command brew "$@"
}
