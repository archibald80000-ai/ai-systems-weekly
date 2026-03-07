# ai-systems-weekly

一个面向中文读者的「AI 系统周刊」项目：
每天记录值得分享的 AI 科技内容，每周沉淀成结构化周刊。

## 项目目标
- **日更采集**：每天早上 8:00 完成当天素材整理（论文 / 新闻 / 工具 / 实战坑点）。
- **定时发布**：每天 10:00 发布当日摘要或卡片内容。
- **周更复盘**：按周输出系统化总结，沉淀为可复用的方法论与实践指南。

## 对标项目与内容组织
本项目借鉴了 [ruanyf/weekly](https://github.com/ruanyf/weekly) 的内容组织思路：
- 先有「素材池」和「日常记录」
- 再做「周刊归档」
- 模板化写作，降低持续输出成本

## 仓库结构

```text
.
├── README.md
├── docs
│   ├── issue-1.md
│   ├── daily
│   │   └── 2026
│   │       └── 2026-03-07.md
│   ├── weekly
│   │   └── 2026
│   │       └── 2026-W09.md
│   ├── inbox
│   │   └── README.md
│   └── templates
│       ├── daily-template.md
│       ├── weekly-template.md
│       ├── paper-template.md
│       ├── eval-template.md
│       └── rag-template.md
```

## 写作流程（建议）

### 每天 8:00（写）
1. 在 `docs/daily/<year>/YYYY-MM-DD.md` 新建当天记录。
2. 从 `docs/inbox/README.md` 的素材池挑选 3-5 条重点。
3. 使用模板写出：
   - 今日结论
   - 关键链接
   - 可落地启发
   - 待验证问题

### 每天 10:00（发）
1. 检查当天文稿中的事实和链接。
2. 发布到目标平台（公众号 / 社区 / 社媒）。
3. 将发布链接回填到当天记录里，形成闭环。

### 每周末（归档）
1. 回看本周 7 天日更。
2. 提炼成 `docs/weekly/<year>/YYYY-Wxx.md`。
3. 按「Papers / Evals / RAG / Badcases」分类沉淀。

## 快速开始
1. 复制 `docs/templates/daily-template.md` 新建今日条目。
2. 复制 `docs/templates/weekly-template.md` 新建本周周刊。
3. 每天至少沉淀 1 个「可复用经验」和 1 个「可验证问题」。

---
如果你愿意，我下一步可以继续帮你补：
- 自动创建当天文档的脚本（按日期生成）
- GitHub Actions 定时提醒（8:00 写、10:00 发）
- 统一的发布检查清单（链接、事实、标签）
