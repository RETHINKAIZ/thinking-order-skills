#!/usr/bin/env python3
"""
Thinking Order 系列技能批量打包脚本
将所有技能打包成独立的 .skill 插件文件

Usage:
    python package_all_skills.py
"""

from pathlib import Path
from zipfile import ZIP_DEFLATED, ZipFile


def package_skill(skill_dir: Path, output_dir: Path) -> Path:
    """Package one skill directory as a .skill zip archive."""
    skill_file = skill_dir / "SKILL.md"
    if not skill_file.exists():
        raise FileNotFoundError(f"missing SKILL.md: {skill_dir}")

    output_path = output_dir / f"{skill_dir.name}.skill"
    if output_path.exists():
        output_path.unlink()

    with ZipFile(output_path, "w", compression=ZIP_DEFLATED) as zf:
        for path in sorted(skill_dir.rglob("*")):
            if path.is_file():
                zf.write(path, path.relative_to(skill_dir))

    return output_path


def main():
    # 技能源目录
    script_dir = Path(__file__).parent
    pack_dir = script_dir.parent
    skills_dir = pack_dir / "skills"
    output_dir = pack_dir / "dist" / "plugins"

    # 创建输出目录
    output_dir.mkdir(parents=True, exist_ok=True)

    print("=" * 60)
    print("  Thinking Order 系列技能打包器 v1.1.0 (.skill 格式)")
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

        try:
            result = package_skill(skill_dir, output_dir)
            print(f"   ✅ 成功：{result}")
            packaged += 1
        except Exception as exc:
            print(f"   ❌ 失败：{exc}")
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
        print("   复制 .skill 文件到目标 skills 目录。")
        print("   示例:")
        print(f"      cp {output_dir}/*.skill \"$HOME/.claude/skills/\"")
        print()


if __name__ == "__main__":
    main()
