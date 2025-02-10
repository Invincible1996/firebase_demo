#!/bin/bash

# 检查是否有文件被修改
if [[ -z $(git status -s) ]]; then
    echo "📝 没有检测到文件修改，无需提交"
    exit 0
fi

# 检查是否提供了提交信息
if [ -z "$1" ]; then
    echo "❌ 请提供提交信息，例如: ./scripts/git_commit.sh '更新登录页面'"
    exit 1
fi

# 添加所有改动的文件
git add .

# 提交代码
echo "📝 提交信息: feat: $1"
git commit -m "feat: $1"

# 推送到远程仓库
git push

echo "✨ 代码已成功提交并推送!"