# thinking-order-skills - 分发指南

> 如何安装和分发 thinking-order-skills 系列技能
>
> 项目名称：thinking-order-skills
> GitHub: https://github.com/RETHINKAIZ/thinking-order-skills

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
├── skills/                    # 所有技能源文件（4 个合并能力簇）
│   ├── thinko-content-planner/
│   ├── thinko-draft-writer/
│   ├── thinko-reading-synthesizer/
│   ├── thinko-editor-polisher/
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
4. 重启你的 agent 或刷新 skills 索引

### 方法二：手动安装

```bash
# 将所有技能复制到你的 Agent Skills 目录
cp -r skills/thinko-* "$SKILLS_DIR/"
```

### 方法三：使用 .skill 文件（高级）

如需打包成 `.skill` 格式（Plugin Skills），运行：

```bash
cd thinking-order-skills
python3 scripts/package_all_skills.py
```

生成的 `.skill` 文件位于 `dist/plugins/` 目录，复制到你的 Agent Skills 目录即可。

---

## 📚 技能列表

| # | 技能名 | 中文名 | 功能 |
|---|--------|--------|------|
| 1 | thinko-content-planner | 内容策划中枢 | 选题、创意、提纲、论点、案例素材 |
| 2 | thinko-draft-writer | 成稿写作中枢 | 结构化表达、模板写作、邮件、方案、汇报 |
| 3 | thinko-reading-synthesizer | 阅读综合中枢 | 阅读分析、总结摘要、洞察提取、会议纪要 |
| 4 | thinko-editor-polisher | 编辑润色中枢 | 文章优化、改写降重、语气和文风润色 |

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

### v1.1.0 (2026-06-15)
- 将 14 个细分技能合并为 4 个能力簇
- 默认从逐步问答改为一次性产出，降低 token 消耗
- 保留旧技能名称作为新技能触发词，便于迁移

### v1.0.0 (2026-03-12)
- 初始版本
- 包含 14 个写作与思考辅助技能
- 支持 macOS/Windows/Linux

---

## ❓ 常见问题

### Q: 安装后看不到技能？
A: 确保技能已复制到你的 Agent Skills 目录，并重启 agent 或刷新 skills 索引。技能名称使用小写 `thinko-` 前缀（如 `thinko-struct-builder`）。

### Q: 如何卸载？
A: 删除目标 skills 目录中的 `thinko-*` 目录即可。

### Q: 可以只安装部分技能吗？
A: 可以，手动复制需要的技能文件夹到你的 Agent Skills 目录。

---

## 📞 联系方式

- **微信**: RETHINK-AIZ
- **GitHub**: @RETHINKAIZ
- **社交媒体**: RETHINKAIZ / RETHINKAIZ🍼HABITS

如有问题或建议，欢迎通过以上方式联系我！
