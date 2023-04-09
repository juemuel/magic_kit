#!/usr/bin/env sh
# 当前脚本的任务为
# 1. 从本地空目录初始化git项目
# 2. 关联本地main 和 远程仓库的 origin/main

# 确保脚本抛出遇到的错误
set -e

git init
echo "# README" > README.md
# 注意将覆盖gitignore
echo "git_deploy.sh" > .gitignore
echo "node_modules/" >> .gitignore
echo "package-lock.json" >> .gitignore
echo "docs/.vitepress/" >> .gitignore
echo "*.exe" >> .gitignore
echo "*.o" >> .gitignore
echo "*.pyc" >> .gitignore
echo "*.swp" >> .gitignore
echo ".DS_Store" >> .gitignore
echo ".idea" >> .gitignore
echo ".vscode" >> .gitignore
	
# 3.关联本地main分支和 origin/main 分支
git add .
git branch -M main
git remote add origin https://GIT_TOKEN@github.com/GIT_USERNAME/REMOTE.git
git push -u origin main
