# thinking-order-skills

> Thinking Order - 让思考更有结构，让表达更有力量

一套完整的写作与思考辅助技能包，包含 4 个合并能力簇，涵盖从选题、构思、写作、阅读到优化的全流程。适用于支持 Agent Skills 的多种 agent runtime。

---

## 📦 快速安装

### 方法一：下载安装包（推荐）

1. 从 GitHub 下载 `thinking-order-skills.zip`（见右侧 Releases 或 dist 目录）
2. 解压到任意位置
3. 运行安装脚本；如需安装到指定 runtime，请先设置 `SKILLS_DIR`

**macOS / Linux:**
```bash
cd thinking-order-skills
chmod +x scripts/install.sh
./scripts/install.sh

# 指定安装目录示例
SKILLS_DIR="$HOME/.codex/skills" ./scripts/install.sh
```

**Windows:**
```batch
# 双击运行 scripts/install.bat
# 或在命令行执行：
cd thinking-order-skills
scripts\install.bat
```

### 方法二：Git 克隆

```bash
# 克隆仓库
git clone https://github.com/RETHINKAIZ/thinking-order-skills.git
cd thinking-order-skills

# 运行安装脚本
./scripts/install.sh  # macOS/Linux
scripts\install.bat   # Windows
```

安装完成后，重启你的 agent 或刷新 skills 索引即可使用。

### 方法三：手动安装

把 `skills/thinko-*` 复制到你的 agent skills 目录即可。常见目录示例：

| Runtime | 示例目录 |
|---|---|
| Codex | `~/.codex/skills/` |
| Claude Code | `~/.claude/skills/` |
| Cursor / 其他兼容 runtime | 以对应 runtime 文档为准 |

```bash
cp -r skills/thinko-* "$SKILLS_DIR/"
```

---

## 📚 技能列表

| # | 技能名称 | 中文名 | 核心功能 |
|---|----------|--------|----------|
| 1 | **thinko-content-planner** | 内容策划中枢 | 选题、创意、提纲、论点、案例素材 |
| 2 | **thinko-draft-writer** | 成稿写作中枢 | 结构化表达、模板写作、邮件、方案、汇报 |
| 3 | **thinko-reading-synthesizer** | 阅读综合中枢 | 阅读分析、总结摘要、洞察提取、会议纪要 |
| 4 | **thinko-editor-polisher** | 编辑润色中枢 | 文章优化、改写降重、语气和文风润色 |

### 旧技能映射

| 原技能 | 合并到 |
|---|---|
| thinko-topic-explorer / thinko-idea-spark / thinko-outline-planner / thinko-argument-builder / thinko-example-finder | thinko-content-planner |
| thinko-struct-builder / thinko-template-writer / thinko-report-generator | thinko-draft-writer |
| thinko-reading-analyzer / thinko-insight-extractor / thinko-summary-maker | thinko-reading-synthesizer |
| thinko-article-refiner / thinko-rewrite-artist / thinko-style-polisher | thinko-editor-polisher |

---

## 🚀 使用方式

安装后，在你的 skills-aware agent 中直接使用技能名称或中文名即可触发。

### 中文触发示例：
- "用**内容策划中枢**帮我把 AI Agent 企业协作这个方向拆成选题和大纲"
- "用**成稿写作中枢**帮我写一份项目延期说明邮件"
- "用**阅读综合中枢**总结这篇文章并提炼可行动洞察"
- "用**编辑润色中枢**把这段话改得更专业但不要生硬"

### 英文触发示例：
- "Use **thinko-content-planner** to brainstorm topics and build an outline"
- "Use **thinko-draft-writer** to write a weekly report"
- "Use **thinko-reading-synthesizer** to summarize this article"
- "Use **thinko-editor-polisher** to rewrite this paragraph"

---

## 💡 典型使用场景

### 📝 写作全流程
```
策划 → thinko-content-planner（内容策划中枢）
成稿 → thinko-draft-writer（成稿写作中枢）
阅读/总结 → thinko-reading-synthesizer（阅读综合中枢）
优化/改写 → thinko-editor-polisher（编辑润色中枢）
```

### 📊 职场汇报场景
- **周报/月报/项目总结**: thinko-draft-writer（成稿写作中枢）
- **复盘洞察**: thinko-reading-synthesizer（阅读综合中枢）+ thinko-draft-writer
- **PPT 大纲**: thinko-content-planner（内容策划中枢）

### 📖 阅读学习场景
- **文章分析/笔记整理**: thinko-reading-synthesizer（阅读综合中枢）

---

## 📁 目录结构

```
thinking-order-skills/
├── README.md                 # 项目说明（本文件）
├── DISTRIBUTION.md           # 分发指南
├── scripts/
│   ├── install.sh            # macOS/Linux 安装脚本
│   ├── install.bat           # Windows 安装脚本
│   ├── package.sh            # 重新打包脚本
│   └── package_all_skills.py # .skill 格式打包脚本
├── skills/                   # 所有技能源文件（4 个合并能力簇）
│   ├── thinko-content-planner/
│   ├── thinko-draft-writer/
│   ├── thinko-reading-synthesizer/
│   └── thinko-editor-polisher/
├── dist/
│   ├── thinking-order-skills.zip   # 分发包（推荐下载）
│   └── plugins/                    # .skill 格式文件
└── README.md
```

---

## 🛠️ 重新打包

如果需要重新生成分发包：

```bash
cd thinking-order-skills

# 生成 zip 分发包
./scripts/package.sh

# 生成 .skill 格式文件
python3 scripts/package_all_skills.py
```

生成的文件位于 `dist/` 目录。

---

## 📝 版本信息

- **版本**: 1.1.0
- **创建日期**: 2026-03-12
- **更新日期**: 2026-06-15
- **作者**: RETHINKAIZ
- **许可证**: RTHINKORDER260003

---

## 📞 联系方式

- **微信**: RETHINK-AIZ
- **GitHub**: [@RETHINKAIZ](https://github.com/RETHINKAIZ)
- **社交媒体**: RETHINKAIZ / RETHINKAIZ🍼HABITS

如有问题或建议，欢迎通过以上方式联系我！

---

## ⭐ 欢迎 Star

如果这个项目对你有帮助，欢迎给一个 ⭐️ Star，支持持续更新！
