#!/usr/bin/env sh

# 确保脚本抛出遇到的错误
set -e

# 1. 初始化git、READ.md
git init
echo "# YOUR_TITLE" > README.md


# 2. 配置git忽略项
if [ -f ./.gitignore ]
then
	echo "gitignore存在"
else
	echo "gitignore文件不存在"
	touch .gitignore
fi

# 不论是否存在首句覆盖
echo "git_deploy.sh" > .gitignore
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
	
# # 3.添加部署
git add .
git status

git branch -M main
git remote add origin https://YOUR_GIT_TOKEN@github.com/YOUR_GIT_USERNAME/YOUR_PROJECT_NAME.git
git push -u origin main
