#!/bin/bash

# 获取当前时间
current_time=$(date "+%Y-%m-%d %H:%M:%S")

# 获取变更的文件信息
added_files=$(git status --porcelain | grep "^A" | cut -c4-)
modified_files=$(git status --porcelain | grep "^M" | cut -c4-)
deleted_files=$(git status --porcelain | grep "^D" | cut -c4-)

# 构建提交信息
commit_msg="feat: "

# 添加新文件信息
if [ ! -z "$added_files" ]; then
    commit_msg+="添加文件: ${added_files}; "
fi

# 添加修改文件信息
if [ ! -z "$modified_files" ]; then
    commit_msg+="更新文件: ${modified_files}; "
fi

# 添加删除文件信息
if [ ! -z "$deleted_files" ]; then
    commit_msg+="删除文件: ${deleted_files}; "
fi

# 如果没有检测到具体变更，使用默认信息
if [ "$commit_msg" = "feat: " ]; then
    commit_msg="feat: 更新于 $current_time"
fi

# 添加所有改动的文件
git add .

# 提交代码
echo "📝 提交信息: $commit_msg"
git commit -m "$commit_msg"

# 推送到远程仓库
git push

echo "✨ 代码已成功提交并推送!"