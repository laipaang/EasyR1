#!/bin/bash

# 自动获取当前目录作为项目名
PROJECT_NAME=$(basename "$PWD")

# 获取 Git 短 hash（7 位）
SHORT_HASH=$(git rev-parse --short HEAD)

# 获取当前日期
DATE=$(date +%Y%m%d)

# 构建输出文件名
FILENAME="${PROJECT_NAME}-${SHORT_HASH}-${DATE}.tar.gz"

# 确保在 /tmp 之外生成压缩文件（防止被同时读取）
TEMP_FILE="/tmp/$FILENAME"

# 打包当前目录（排除 .git 和最终输出文件）
tar --exclude-vcs --exclude="$TEMP_FILE" -czf "$TEMP_FILE" .

# 移动回来
mv "$TEMP_FILE" "$FILENAME"

echo "✅ Created: $FILENAME"
