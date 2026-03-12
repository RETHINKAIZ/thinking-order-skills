#!/usr/bin/env python3
"""
Thinking Order 系列技能批量打包脚本
将所有技能打包成独立的 .skill 插件文件

Usage:
    python package_all_skills.py
"""

import sys
import os
from pathlib import Path

# 添加官方打包脚本路径
sys.path.insert(0, str(Path.home() / ".claude/plugins/cache/anthropic-agent-skills/document-skills/69c0b1a06741/skills/skill-creator/scripts"))

from package_skill import package_skill


def main():
    # 技能源目录
    script_dir = Path(__file__).parent
    pack_dir = script_dir.parent
    skills_dir = pack_dir / "skills"
    output_dir = pack_dir / "dist" / "plugins"

    # 创建输出目录
    output_dir.mkdir(parents=True, exist_ok=True)

    print("=" * 60)
    print("  Thinking Order 系列技能打包器 (.skill 格式)")
    print("=" * 60)
    print()

    # 获取所有 thinko 技能目录
    skill_dirs = sorted([d for d in skills_dir.iterdir() if d.is_dir() and d.name.startswith("thinko-")])

    if not skill_dirs:
        print("❌ 未找到 thinko 技能目录")
        return

    print(f"📦 发现 {len(skill_dirs)} 个技能:")
    for d in skill_dirs:
        print(f"   - {d.name}")
    print()

    # 逐个打包
    packaged = 0
    failed = 0

    for skill_dir in skill_dirs:
        print(f"🔧 打包：{skill_dir.name}...")

        # 调用官方打包脚本
        result = package_skill(str(skill_dir), str(output_dir))

        if result:
            print(f"   ✅ 成功：{result}")
            packaged += 1
        else:
            print(f"   ❌ 失败")
            failed += 1

    print()
    print("=" * 60)
    print(f"  打包完成！成功：{packaged}, 失败：{failed}")
    print("=" * 60)
    print()
    print(f"📁 输出目录：{output_dir}")
    print()

    if packaged > 0:
        print("📦 生成的 .skill 文件列表:")
        for f in sorted(output_dir.glob("*.skill")):
            size = f.stat().st_size
            print(f"   - {f.name} ({size:,} bytes)")
        print()

        print("🚀 安装方法:")
        print(f"   1. 复制 .skill 文件到 ~/.claude/skills/")
        print(f"   2. 或者运行以下命令:")
        print(f"      cp {output_dir}/*.skill ~/.claude/skills/")
        print()


if __name__ == "__main__":
    main()
