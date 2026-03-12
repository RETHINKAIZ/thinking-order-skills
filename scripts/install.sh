#!/bin/bash

# Thinking Order 系列技能安装脚本
# 一键安装所有 Thinking Order 技能到 Claude Code

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PACK_DIR="$(dirname "$SCRIPT_DIR")"
SKILLS_DIR="$HOME/.claude/skills"

echo "=========================================="
echo "  Thinking Order 系列技能安装器"
echo "=========================================="
echo ""

# 检查 Claude Code skills 目录是否存在
if [ ! -d "$SKILLS_DIR" ]; then
    echo "❌ 错误：未找到 Claude Code skills 目录"
    echo "   请确保已安装 Claude Code"
    exit 1
fi

echo "✅ 检测到 Claude Code skills 目录：$SKILLS_DIR"
echo ""

# 复制所有技能
echo "📦 开始安装技能..."
echo ""

SKILL_COUNT=0
for skill_dir in "$PACK_DIR"/skills/thinko-*/; do
    if [ -d "$skill_dir" ]; then
        skill_name=$(basename "$skill_dir")
        echo "   → 安装：$skill_name"
        cp -r "$skill_dir" "$SKILLS_DIR/"
        ((SKILL_COUNT++))
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
echo "   1. thinko-struct-builder    - 结构大师（结构化表达框架）"
echo "   2. thinko-template-writer   - 模板写手（模板化写作）"
echo "   3. thinko-reading-analyzer  - 阅读侦探（阅读分析）"
echo "   4. thinko-insight-extractor - 洞察猎人（洞察提取）"
echo "   5. thinko-article-refiner   - 文章造型师（文章优化）"
echo "   6. thinko-report-generator  - 汇报嘴替（汇报生成）"
echo "   7. thinko-idea-spark        - 鬼点子精（创意生成）"
echo "   8. thinko-outline-planner   - 提纲管家（大纲生成）"
echo "   9. thinko-argument-builder  - 论点建筑师（论证结构）"
echo "  10. thinko-example-finder    - 例子猎人（案例素材）"
echo "  11. thinko-rewrite-artist    - 改写高手（改写降重）"
echo "  12. thinko-summary-maker     - 总结课代表（内容总结）"
echo "  13. thinko-style-polisher    - 文风造型师（文风润色）"
echo "  14. thinko-topic-explorer    - 选题探险家（选题策划）"
echo ""
echo "🎉 重启 Claude Code 即可使用！"
echo ""
