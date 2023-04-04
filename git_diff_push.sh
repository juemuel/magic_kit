#!/usr/bin/env sh

# 确保脚本抛出遇到的错误
set -e

git init

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
	
# # 3.添加部署，先删除原remote仓库、清空缓存，重新配置一下

git add .
git status
git commit -m '提交信息'
# 远程有新的commit未同步到本地 并且 自己仓库已经修改
# 此时可以先commit，等到完成拉取后再提交；如果还不想提交，则先stash修改的内容再拉取，最后再git stash-pop取出内容
git pull --rebase origin main
git push -u origin main
