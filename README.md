# thinking-order-skills

> Thinking Order - 让思考更有秩序，让表达更有力量

一套完整的写作与思考辅助技能包，包含 14 个专业技能，涵盖从选题、构思、写作到优化的全流程。适用于 Claude Code 平台。

---

## 📦 快速安装

### 方法一：下载安装包（推荐）

1. 从 GitHub 下载 `thinking-order-skills.zip`（见右侧 Releases 或 dist 目录）
2. 解压到任意位置
3. 运行安装脚本

**macOS / Linux:**
```bash
cd thinking-order-skills
chmod +x scripts/install.sh
./scripts/install.sh
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
git clone https://github.com/YOUR_USERNAME/thinking-order-skills.git
cd thinking-order-skills

# 运行安装脚本
./scripts/install.sh  # macOS/Linux
scripts\install.bat   # Windows
```

安装完成后，重启 Claude Code 即可使用！

### 方法三：手动安装

```bash
# 将所有技能复制到 Claude Code skills 目录
cp -r skills/thinko-* ~/.claude/skills/
```

---

## 📚 技能列表

| # | 技能名称 | 中文名 | 核心功能 |
|---|----------|--------|----------|
| 1 | **thinko-struct-builder** | 结构大师 | 结构化表达框架，自动识别场景推荐模板 |
| 2 | **thinko-template-writer** | 模板写手 | 提供各类写作模板，快速填充生成标准化文档 |
| 3 | **thinko-reading-analyzer** | 阅读侦探 | 深度分析文章内容，提取关键信息和逻辑结构 |
| 4 | **thinko-insight-extractor** | 洞察猎人 | 从大量信息中提取核心洞察和关键结论 |
| 5 | **thinko-article-refiner** | 文章造型师 | 优化文章结构、表达和逻辑，提升文章质量 |
| 6 | **thinko-report-generator** | 汇报嘴替 | 基于已有内容自动生成周报、月报、项目汇报 |
| 7 | **thinko-idea-spark** | 鬼点子精 | 创意点子生成器，支持头脑风暴和思路拓展 |
| 8 | **thinko-outline-planner** | 提纲管家 | 生成文章结构和大纲，快速搭建写作框架 |
| 9 | **thinko-argument-builder** | 论点建筑师 | 搭建议论文/评论/分析文章的观点结构 |
| 10 | **thinko-example-finder** | 例子猎人 | 根据需求补充案例和素材，支撑观点论证 |
| 11 | **thinko-rewrite-artist** | 改写高手 | 改写句子、降重、换表达，支持多种风格 |
| 12 | **thinko-summary-maker** | 总结课代表 | 文章内容总结，支持多种格式和长度 |
| 13 | **thinko-style-polisher** | 文风造型师 | 文风调整、润色文章，支持多种写作风格 |
| 14 | **thinko-topic-explorer** | 选题探险家 | 拓展选题和创意方向，多角度分析选题价值 |

---

## 🚀 使用方式

安装后，在 Claude Code 中直接使用技能名称即可触发。

### 中文触发示例：
- "帮我用**结构大师**整理一下这个汇报"
- "用**总结课代表**帮我总结这篇文章"
- "我需要**选题探险家**帮我想想写作方向"
- "用**提纲管家**帮我列个文章大纲"
- "让**汇报嘴替**帮我写个周报"

### 英文触发示例：
- "Use **thinko-struct-builder** to organize my report"
- "Use **thinko-summary-maker** to summarize this article"
- "Use **thinko-topic-explorer** to brainstorm ideas"

---

## 💡 典型使用场景

### 📝 写作全流程
```
选题 → thinko-topic-explorer（选题探险家）
构思 → thinko-idea-spark（鬼点子精）+ thinko-outline-planner（提纲管家）
写作 → thinko-template-writer（模板写手）+ thinko-struct-builder（结构大师）
论证 → thinko-argument-builder（论点建筑师）+ thinko-example-finder（例子猎人）
优化 → thinko-article-refiner（文章造型师）+ thinko-style-polisher（文风造型师）
改写 → thinko-rewrite-artist（改写高手）
总结 → thinko-summary-maker（总结课代表）
```

### 📊 职场汇报场景
- **周报/月报**: thinko-report-generator（汇报嘴替）
- **项目总结**: thinko-insight-extractor（洞察猎人）+ thinko-report-generator
- **PPT 大纲**: thinko-outline-planner（提纲管家）+ thinko-struct-builder

### 📖 阅读学习场景
- **文章分析**: thinko-reading-analyzer（阅读侦探）
- **笔记整理**: thinko-insight-extractor（洞察猎人）+ thinko-summary-maker

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
├── skills/                   # 所有技能源文件（14 个）
│   ├── thinko-struct-builder/
│   ├── thinko-template-writer/
│   ├── thinko-reading-analyzer/
│   ├── thinko-insight-extractor/
│   ├── thinko-article-refiner/
│   ├── thinko-report-generator/
│   ├── thinko-idea-spark/
│   ├── thinko-outline-planner/
│   ├── thinko-argument-builder/
│   ├── thinko-example-finder/
│   ├── thinko-rewrite-artist/
│   ├── thinko-summary-maker/
│   ├── thinko-style-polisher/
│   └── thinko-topic-explorer/
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

- **版本**: 1.0.0
- **创建日期**: 2026-03-12
- **作者**: Thinking Order Team
- **许可证**: MIT

---

## 📞 联系方式

- **微信**: RETHINK-AIZ
- **GitHub**: [@RETHINKAIZ](https://github.com/RETHINKAIZ)
- **社交媒体**: RETHINKAIZ / RETHINKAIZ🍼HABITS

如有问题或建议，欢迎通过以上方式联系我！

---

## ⭐ 欢迎 Star

如果这个项目对你有帮助，欢迎给一个 ⭐️ Star，支持持续更新！
