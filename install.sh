sh setup.sh
sh link.sh

# .git/は無視されているがcommit_templateは共有
git config --global commit.template .commit_template

echo "All complete"
