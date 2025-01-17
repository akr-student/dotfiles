sh setup.sh
sh link.sh

# .git/は無視されているがcommit_templateは共有
git config --global commit.template ~/dotfiles/.commit_template

#node.js
nodebrew setup
nodebrew install-binary stable
nodebrew use stable

node -v
npm -v

npm install --global pure-prompt

echo "All complete"
echo "but npm install pureを確認してみて"
