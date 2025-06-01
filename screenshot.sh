#!/usr/bin/env bash

# 创建截图保存目录（如果不存在）
SCREENSHOT_DIR="$HOME/screenshots"
mkdir -p "$SCREENSHOT_DIR"

# 生成带有Unix时间戳的文件名
TIMESTAMP=$(date +%s)
FILENAME="${TIMESTAMP}.png"

# 使用grim和slurp捕获屏幕区域，并以时间戳命名保存
grim -g "$(slurp)" "$SCREENSHOT_DIR/$FILENAME"

# 如果截图成功，显示通知
if [ $? -eq 0 ]; then
	# notify-send "Screenshot saved" "File: $FILENAME\nLocation: $SCREENSHOT_DIR"
else
	# notify-send "Screenshot failed" "An error occurred while taking the screenshot"
fi
