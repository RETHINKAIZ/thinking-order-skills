# thinking-order-skills

Thinking Order 写作与思考辅助 Agent Skills。当前版本已从 14 个原子技能合并升级为 4 个复合技能，覆盖写作前策划、结构成稿、阅读洞察和改写润色四条高频工作流。

本仓库适用于 skills-compatible runtime。默认安装脚本会安装到 `~/.claude/skills/`，也可以通过环境变量指定其他 runtime 的 skills 目录。

## 当前版本

- 版本：`v1.1.0`
- 更新日期：`2026-06-15`
- 版本定位：4 技能合并升级版
- 主要变化：由 14 个细碎入口合并为 4 个复合工作流技能，并补齐工作流、边界处理和测试 prompts。

## 技能列表

| 技能名 | 中文名 | 合并能力 | 适用场景 |
|---|---|---|---|
| `thinko-writing-planner` | 写作策划师 | 选题探险家、鬼点子精、提纲管家、论点建筑师、例子猎人 | 选题策划、创意发想、列大纲、搭论点、找案例 |
| `thinko-structure-writer` | 结构成稿师 | 结构大师、模板写手、汇报嘴替 | 写汇报、写邮件、写方案、套模板成稿、客户沟通、演讲发言 |
| `thinko-reading-synthesizer` | 阅读洞察官 | 阅读侦探、洞察猎人、总结课代表 | 总结文章、分析材料、提炼洞察、整理会议记录 |
| `thinko-revision-polisher` | 改写润色师 | 文章造型师、改写高手、文风造型师 | 润色、改写、降重、调整文风、终稿打磨 |

## 合并原则

旧版 14 个技能按写作流程合并，而不是简单改名：

```text
写作前       -> thinko-writing-planner
成稿交付     -> thinko-structure-writer
阅读沉淀     -> thinko-reading-synthesizer
修改优化     -> thinko-revision-polisher
```

每个新技能都包含：

- 明确触发场景和适用任务。
- 分阶段工作流。
- 用户确认点。
- 输出模板。
- 边界条件和 fallback。
- `test-prompts.json` 干跑验证用例。

## 目录结构

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
│   │   ├── SKILL.md
│   │   ├── test-prompts.json
│   │   └── references/
│   ├── thinko-structure-writer/
│   │   ├── SKILL.md
│   │   ├── test-prompts.json
│   │   └── references/
│   ├── thinko-reading-synthesizer/
│   │   ├── SKILL.md
│   │   ├── test-prompts.json
│   │   └── references/
│   └── thinko-revision-polisher/
│       ├── SKILL.md
│       ├── test-prompts.json
│       └── references/
└── dist/
    ├── thinking-order-skills.zip
    └── plugins/
```

## 安装

### 默认安装

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

### 指定安装目录

如果你的 runtime 使用其他 skills 目录，可以指定 `SKILLS_DIR`：

```bash
SKILLS_DIR="$HOME/.codex/skills" ./scripts/install.sh
```

手动安装：

```bash
cp -r skills/thinko-* "$YOUR_SKILLS_DIR/"
```

## 使用示例

```text
用写作策划师帮我围绕 AI 工具做 10 个选题方向。
用结构成稿师把这些信息整理成项目进展汇报。
用阅读洞察官总结这段会议记录，列出结论和后续动作。
用改写润色师把这段话改得更专业，但不要改变意思。
```

也可以直接使用技能名：

```text
Use thinko-writing-planner to plan article topics.
Use thinko-structure-writer to draft a project report.
Use thinko-reading-synthesizer to extract insights from this text.
Use thinko-revision-polisher to rewrite this paragraph.
```

## 打包

生成 zip 分发包：

```bash
./scripts/package.sh
```

生成 `.skill` 插件包：

```bash
python3 scripts/package_all_skills.py
```

输出目录：

```text
dist/
```

## 质量验证

本次升级按 `darwin-skill` 思路进行了干跑验证：

- Runtime 中立度：修复用户可见文档里的单一 runtime 绑定表述。
- 结构完整度：每个技能补齐触发、流程、输出、fallback、自检。
- 测试覆盖：每个技能新增 3 个典型 `test-prompts.json`。
- 合并可用性：旧的 14 个入口已从主技能目录移除，避免安装后入口重复。

## 开发约定

新增或修改技能时，保持以下结构：

```text
skills/thinko-skill-name/
├── SKILL.md
├── test-prompts.json
└── references/
    └── README.md
```

`SKILL.md` 必须包含：

- YAML frontmatter。
- 清晰的适用任务。
- 分步工作流。
- 输出模板。
- 边界条件。
- 质量检查。

## 版本历史

### v1.1.0 (2026-06-15)

- 将 14 个原子技能合并为 4 个复合技能。
- 新增每个技能的测试 prompts。
- 同步 README、分发说明和安装脚本文案。
- 修复用户可见文档中的 runtime 绑定表述。

### v1.0.0 (2026-03-12)

- 初始版本。
- 包含 14 个写作与思考辅助原子技能。

## 联系方式

- 微信：`RETHINK-AIZ`
- GitHub：`@RETHINKAIZ`
- 社交媒体：`RETHINKAIZ / RETHINKAIZ HABITS`
