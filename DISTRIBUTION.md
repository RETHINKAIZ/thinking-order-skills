# thinking-order-skills 分发指南

当前分发版本：`v1.1.0`  
版本日期：`2026-06-15`  
版本定位：4 技能合并升级版

## 包内容

```text
thinking-order-skills/
├── README.md
├── DISTRIBUTION.md
├── scripts/
│   ├── install.sh
│   ├── install.bat
│   ├── package.sh
│   └── package_all_skills.py
├── skills/
│   ├── thinko-writing-planner/
│   ├── thinko-structure-writer/
│   ├── thinko-reading-synthesizer/
│   └── thinko-revision-polisher/
└── dist/
    ├── thinking-order-skills.zip
    └── plugins/
```

## 技能列表

| # | 技能名 | 中文名 | 功能 |
|---|---|---|---|
| 1 | `thinko-writing-planner` | 写作策划师 | 选题、创意、大纲、论点、案例 |
| 2 | `thinko-structure-writer` | 结构成稿师 | 结构化表达、模板写作、汇报生成 |
| 3 | `thinko-reading-synthesizer` | 阅读洞察官 | 阅读分析、总结、洞察提炼、会议沉淀 |
| 4 | `thinko-revision-polisher` | 改写润色师 | 文章优化、改写降重、文风润色 |

## 安装方法

### 默认安装

macOS / Linux:

```bash
cd thinking-order-skills
chmod +x scripts/install.sh
./scripts/install.sh
```

Windows:

```bat
cd thinking-order-skills
scripts\install.bat
```

### 指定 skills 目录

不同 skills-compatible runtime 可能使用不同安装目录。可以通过 `SKILLS_DIR` 指定目标目录：

```bash
SKILLS_DIR="$HOME/.codex/skills" ./scripts/install.sh
```

Windows:

```bat
set SKILLS_DIR=%USERPROFILE%\.codex\skills
scripts\install.bat
```

### 手动安装

```bash
cp -r skills/thinko-* "$YOUR_SKILLS_DIR/"
```

## 打包

生成 zip 包：

```bash
./scripts/package.sh
```

生成 `.skill` 文件：

```bash
python3 scripts/package_all_skills.py
```

## 升级说明

从 `v1.0.0` 升级到 `v1.1.0` 时，建议移除旧的 14 个原子技能目录，再安装新的 4 个复合技能，避免入口重复。

旧技能到新技能的映射：

| 新技能 | 合并旧技能 |
|---|---|
| `thinko-writing-planner` | `thinko-topic-explorer`、`thinko-idea-spark`、`thinko-outline-planner`、`thinko-argument-builder`、`thinko-example-finder` |
| `thinko-structure-writer` | `thinko-struct-builder`、`thinko-template-writer`、`thinko-report-generator` |
| `thinko-reading-synthesizer` | `thinko-reading-analyzer`、`thinko-insight-extractor`、`thinko-summary-maker` |
| `thinko-revision-polisher` | `thinko-article-refiner`、`thinko-rewrite-artist`、`thinko-style-polisher` |

## 常见问题

### 安装后看不到新技能？

确认 4 个新目录已复制到你的 skills 目录，并重启对应 agent/runtime。

### 可以保留旧的 14 个技能吗？

不建议。旧技能入口更碎，且多数是骨架状态；`v1.1.0` 之后应优先使用 4 个复合技能。

### zip 包里包含什么？

`scripts/package.sh` 默认打包 `skills/thinko-*`，也就是 4 个复合技能目录。
