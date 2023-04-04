#!/usr/bin/env sh

# 确保脚本抛出遇到的错误
set -e

# 1. 初始化git、READ.md
git init
echo "# TITLE" > README.md


# 2. 配置git忽略项
if [ -f ./.gitignore ]
then
	echo "gitignore存在"
else
	echo "gitignore文件不存在"
	touch .gitignore
fi

# 不论是否存在首句覆盖，当前的部署文件去掉（其中包含你隐私的token啦~）
echo "current_deploy.sh" > .gitignore
# 忽略前端相关，目录node_modules/ 、
echo "node_modules/" >> .gitignore
echo "package-lock.json" >> .gitignore
echo "docs/.vitepress/" >> .gitignore
# 忽略可执行、工程文件相关
echo "*.exe" >> .gitignore
echo "*.o" >> .gitignore
echo "*.pyc" >> .gitignore
echo "*.swp" >> .gitignore
# 忽略环境相关
echo ".DS_Store" >> .gitignore
echo ".idea" >> .gitignore
echo ".vscode" >> .gitignore
	
# 3.添加部署
git add 
git commit -m "git deploy"
git status
git remote add origin https://TOKEN@github.com/用户名/仓库名.git
git remote set-url origin https://TOKEN@github.com/用户名/仓库名.git
# git pull --rebase origin main
git push -u origin main
