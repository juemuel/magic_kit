#!/usr/bin/env sh
# 当前脚本的任务为
# 1. 提交main分支（自用）

# 确保脚本抛出遇到的错误
set -e

git add -A
git commit -m "push main"
git push origin main:main
