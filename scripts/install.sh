#!/bin/bash

# Thinking Order 系列技能安装脚本
# 一键安装所有 Thinking Order 技能到任意 Agent Skills 目录

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PACK_DIR="$(dirname "$SCRIPT_DIR")"

if [ -z "${SKILLS_DIR:-}" ]; then
    for candidate in "$HOME/.codex/skills" "$HOME/.claude/skills" "$HOME/.cursor/skills"; do
        if [ -d "$candidate" ]; then
            SKILLS_DIR="$candidate"
            break
        fi
    done
fi

SKILLS_DIR="${SKILLS_DIR:-$HOME/.codex/skills}"

echo "=========================================="
echo "  Thinking Order 系列技能安装器"
echo "=========================================="
echo ""

# 检查或创建 Agent Skills 目录
if [ ! -d "$SKILLS_DIR" ]; then
    echo "未找到 skills 目录，正在创建：$SKILLS_DIR"
    mkdir -p "$SKILLS_DIR"
fi

echo "✅ 使用 skills 目录：$SKILLS_DIR"
echo ""

# 复制所有技能
echo "📦 开始安装技能..."
echo ""

# 清理 v1.0 旧入口，避免升级后仍触发逐步问答版 skill。
for old_skill in \
    thinko-argument-builder \
    thinko-article-refiner \
    thinko-example-finder \
    thinko-idea-spark \
    thinko-insight-extractor \
    thinko-outline-planner \
    thinko-reading-analyzer \
    thinko-report-generator \
    thinko-rewrite-artist \
    thinko-struct-builder \
    thinko-style-polisher \
    thinko-summary-maker \
    thinko-template-writer \
    thinko-topic-explorer; do
    if [ -d "$SKILLS_DIR/$old_skill" ]; then
        echo "   → 移除旧版入口：$old_skill"
        rm -rf "$SKILLS_DIR/$old_skill"
    fi
    if [ -f "$SKILLS_DIR/$old_skill.skill" ]; then
        echo "   → 移除旧版入口：$old_skill.skill"
        rm -f "$SKILLS_DIR/$old_skill.skill"
    fi
done

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
echo "   1. thinko-content-planner       - 内容策划中枢（选题/创意/提纲/论点/案例）"
echo "   2. thinko-draft-writer          - 成稿写作中枢（结构/模板/邮件/汇报）"
echo "   3. thinko-reading-synthesizer   - 阅读综合中枢（分析/总结/洞察/纪要）"
echo "   4. thinko-editor-polisher       - 编辑润色中枢（优化/改写/文风）"
echo ""
echo "🎉 重启你的 agent 或刷新 skills 索引即可使用！"
echo ""
