#!/usr/bin/env python3
"""
Thinking Order 系列技能批量打包脚本
将所有技能打包成独立的 .skill 插件文件

Usage:
    python package_all_skills.py
"""

import os
import sys
import fnmatch
import zipfile
from pathlib import Path

def find_package_skill_script():
    """Find a local Agent Skills package_skill.py helper across common runtimes."""
    env_path = os.environ.get("PACKAGE_SKILL_SCRIPT")
    if env_path and Path(env_path).is_file():
        return Path(env_path).parent

    home = Path.home()
    search_roots = [
        home / ".codex",
        home / ".claude",
        home / ".cursor",
    ]
    for root in search_roots:
        if not root.exists():
            continue
        matches = sorted(root.glob("**/skill-creator/scripts/package_skill.py"))
        if matches:
            return matches[0].parent

    return None


package_script_dir = find_package_skill_script()
if package_script_dir is None:
    print("未找到 package_skill.py。请安装 skill-creator，或设置 PACKAGE_SKILL_SCRIPT 指向 package_skill.py。")
    sys.exit(1)

sys.path.insert(0, str(package_script_dir.parent))

try:
    from scripts.package_skill import package_skill
except ModuleNotFoundError as exc:
    if exc.name != "yaml":
        raise

    EXCLUDE_DIRS = {"__pycache__", "node_modules"}
    EXCLUDE_GLOBS = {"*.pyc"}
    EXCLUDE_FILES = {".DS_Store"}
    ROOT_EXCLUDE_DIRS = {"evals"}

    def should_exclude(rel_path: Path) -> bool:
        parts = rel_path.parts
        if any(part in EXCLUDE_DIRS for part in parts):
            return True
        if len(parts) > 1 and parts[1] in ROOT_EXCLUDE_DIRS:
            return True
        if rel_path.name in EXCLUDE_FILES:
            return True
        return any(fnmatch.fnmatch(rel_path.name, pat) for pat in EXCLUDE_GLOBS)

    def package_skill(skill_path, output_dir=None):
        skill_path = Path(skill_path).resolve()
        skill_md = skill_path / "SKILL.md"
        if not skill_path.is_dir() or not skill_md.exists():
            print(f"   ❌ 无效 skill 目录：{skill_path}")
            return None

        text = skill_md.read_text(encoding="utf-8")
        if not text.startswith("---") or "name:" not in text or "description:" not in text:
            print(f"   ❌ SKILL.md frontmatter 不完整：{skill_path.name}")
            return None

        output_path = Path(output_dir).resolve() if output_dir else Path.cwd()
        output_path.mkdir(parents=True, exist_ok=True)
        skill_filename = output_path / f"{skill_path.name}.skill"

        with zipfile.ZipFile(skill_filename, "w", zipfile.ZIP_DEFLATED) as zipf:
            for file_path in skill_path.rglob("*"):
                if not file_path.is_file():
                    continue
                arcname = file_path.relative_to(skill_path.parent)
                if should_exclude(arcname):
                    continue
                zipf.write(file_path, arcname)

        return skill_filename


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
        print("   1. 复制 .skill 文件到你的 Agent Skills 目录")
        print("   2. 或者指定 SKILLS_DIR 后运行:")
        print(f"      cp {output_dir}/*.skill \"$SKILLS_DIR/\"")
        print()


if __name__ == "__main__":
    main()
