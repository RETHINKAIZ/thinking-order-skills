#!/bin/bash

# Thinking Order 系列技能打包脚本
# 将 skills/thinko-* 打包成一个可分发的 zip 文件

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PACK_DIR="$(dirname "$SCRIPT_DIR")"
SKILLS_DIR="$PACK_DIR/skills"
OUTPUT_DIR="$PACK_DIR/dist"

echo "=========================================="
echo "  Thinking Order 系列技能打包器 v1.1.0"
echo "=========================================="
echo ""

# 创建输出目录
mkdir -p "$OUTPUT_DIR"

# 确认 skills 目录存在
if [ ! -d "$SKILLS_DIR" ]; then
    echo "❌ 错误：未找到 skills 目录"
    exit 1
fi

echo "📦 开始打包..."
echo ""

# 进入 skills 目录
cd "$SKILLS_DIR"

# 创建 zip 文件
ZIP_FILE="$OUTPUT_DIR/thinking-order-skills.zip"
zip -r "$ZIP_FILE" thinko-*/

echo ""
echo "=========================================="
echo "  ✅ 打包完成！"
echo "=========================================="
echo ""
echo "   输出文件：$ZIP_FILE"
echo ""
echo "📦 包内容:"
unzip -l "$ZIP_FILE" | head -30
echo ""
echo "🚀 安装方法:"
echo "   1. 解压 thinking-order-skills.zip"
echo "   2. 将解压出的 thinko-* 目录复制到目标 skills 目录"
echo "      例如：cp -r thinko-* \"\$HOME/.claude/skills/\""
echo ""
