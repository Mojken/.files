#automatically commit and push .files to git
git add -- .vimrc .bashrc .bash_logout
git commit -m "automatically pushed .files" >/dev/null 2>&1 && git push
