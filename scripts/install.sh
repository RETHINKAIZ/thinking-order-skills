#!/bin/bash

# Thinking Order 系列技能安装脚本
# 一键安装所有 Thinking Order 技能到目标 skills 目录

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PACK_DIR="$(dirname "$SCRIPT_DIR")"
SKILLS_DIR="${SKILLS_DIR:-$HOME/.claude/skills}"

echo "=========================================="
echo "  Thinking Order 系列技能安装器 v1.1.0"
echo "=========================================="
echo ""

# 检查或创建 skills 目录
if [ ! -d "$SKILLS_DIR" ]; then
    echo "ℹ️ 未找到 skills 目录，正在创建：$SKILLS_DIR"
    mkdir -p "$SKILLS_DIR"
fi

echo "✅ 检测到 skills 目录：$SKILLS_DIR"
echo ""

# 复制所有技能
echo "📦 开始安装技能..."
echo ""

SKILL_COUNT=0
for skill_dir in "$PACK_DIR"/skills/thinko-*/; do
    if [ -d "$skill_dir" ]; then
        skill_name=$(basename "$skill_dir")
        echo "   → 安装：$skill_name"
        rm -rf "$SKILLS_DIR/$skill_name"
        cp -R "$skill_dir" "$SKILLS_DIR/$skill_name"
        ((SKILL_COUNT+=1))
    fi
done

echo ""
echo "=========================================="
echo "  ✅ 安装完成！"
echo "=========================================="
echo ""
echo "   已安装 $SKILL_COUNT 个技能"
echo ""
echo "📚 Thinking Order 系列技能列表:"
echo ""
echo "   1. thinko-writing-planner      - 写作策划师（选题/创意/大纲/论点/案例）"
echo "   2. thinko-structure-writer     - 结构成稿师（结构化表达/模板写作/汇报生成）"
echo "   3. thinko-reading-synthesizer  - 阅读洞察官（阅读分析/总结/洞察提炼）"
echo "   4. thinko-revision-polisher    - 改写润色师（文章优化/改写降重/文风润色）"
echo ""
echo "🎉 重启对应 agent/runtime 即可使用！"
echo ""
