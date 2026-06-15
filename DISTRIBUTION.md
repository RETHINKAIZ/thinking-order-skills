# thinking-order-skills - 分发指南

> 如何安装和分发 thinking-order-skills 系列技能
>
> 项目名称：thinking-order-skills
> GitHub: https://github.com/YOUR_USERNAME/thinking-order-skills

---

## 📦 包内容

```
thinking-order-skills/
├── README.md                  # 项目说明文档
├── scripts/
│   ├── install.sh             # macOS/Linux 一键安装脚本
│   ├── install.bat            # Windows 一键安装脚本
│   ├── package.sh             # 重新打包脚本
│   └── package_all_skills.py  # .skill 格式打包脚本
├── skills/                    # 所有技能源文件（14 个）
│   ├── thinko-struct-builder/
│   ├── thinko-template-writer/
│   └── ...
└── dist/
    ├── thinking-order-skills.zip   # 分发包（约 50KB）
    └── plugins/                    # .skill 格式文件
```

---

## 🚀 安装方法

### 方法一：使用安装包（推荐）

1. 下载 `thinking-order-skills.zip`
2. 解压到任意位置
3. 双击运行 `scripts/install.sh` (macOS/Linux) 或 `scripts/install.bat` (Windows)
4. 重启 Claude Code

### 方法二：手动安装

```bash
# 将所有技能复制到 Claude Code skills 目录
cp -r skills/thinko-* ~/.claude/skills/
```

### 方法三：使用 .skill 文件（高级）

如需打包成 `.skill` 格式（Plugin Skills），运行：

```bash
cd thinking-order-skills
python3 scripts/package_all_skills.py
```

生成的 `.skill` 文件位于 `dist/plugins/` 目录，复制到 `~/.claude/skills/` 即可。

---

## 📚 技能列表

| # | 技能名 | 中文名 | 功能 |
|---|--------|--------|------|
| 1 | thinko-struct-builder | 结构大师 | 结构化表达框架 |
| 2 | thinko-template-writer | 模板写手 | 模板化写作 |
| 3 | thinko-reading-analyzer | 阅读侦探 | 阅读分析 |
| 4 | thinko-insight-extractor | 洞察猎人 | 洞察提取总结 |
| 5 | thinko-article-refiner | 文章造型师 | 文章优化 |
| 6 | thinko-report-generator | 汇报嘴替 | 汇报内容生成 |
| 7 | thinko-idea-spark | 鬼点子精 | 创意点子生成 |
| 8 | thinko-outline-planner | 提纲管家 | 文章结构大纲 |
| 9 | thinko-argument-builder | 论点建筑师 | 论证观点结构 |
| 10 | thinko-example-finder | 例子猎人 | 案例素材补充 |
| 11 | thinko-rewrite-artist | 改写高手 | 改写降重换表达 |
| 12 | thinko-summary-maker | 总结课代表 | 文章内容总结 |
| 13 | thinko-style-polisher | 文风造型师 | 文风调整润色 |
| 14 | thinko-topic-explorer | 选题探险家 | 选题创意拓展 |

---

## 🛠️ 开发者说明

### 重新打包

```bash
cd thinking-order-skills
./scripts/package.sh
```

### 添加新技能

1. 在 `skills/` 目录创建新技能文件夹
2. 按照现有技能格式创建 `SKILL.md` 和 `references/`
3. 运行 `package.sh` 重新打包

---

## 📝 版本历史

### v1.0.0 (2026-03-12)
- 初始版本
- 包含 14 个写作与思考辅助技能
- 支持 macOS/Windows/Linux

---

## ❓ 常见问题

### Q: 安装后看不到技能？
A: 确保技能已复制到 `~/.claude/skills/` 目录，重启 Claude Code。技能名称使用小写 `thinko-` 前缀（如 `thinko-struct-builder`）。

### Q: 如何卸载？
A: 删除 `~/.claude/skills/thinko-*` 目录即可。

### Q: 可以只安装部分技能吗？
A: 可以，手动复制需要的技能文件夹到 `~/.claude/skills/`。

---

## 📞 联系方式

- **微信**: RETHINK-AIZ
- **GitHub**: @RETHINKAIZ
- **社交媒体**: RETHINKAIZ / RETHINKAIZ🍼HABITS

如有问题或建议，欢迎通过以上方式联系我！
