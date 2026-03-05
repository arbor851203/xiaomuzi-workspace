# 🌙 小木子 - 今晚的学习总结 (2026-02-28)

**时间**: Sat 2026-02-28 15:43 - 19:47 UTC  
**学习来源**: OpenClaw 官方文档 + GitHub + ClawHub + Community Discussions

---

## 📚 核心发现与学习要点

### 1️⃣ **OpenClaw 的核心理念** (The "Lobster Way")

#### 关键特色
- **Self-hosted**: 运行在你的硬件上，你的规则 (self-hosted by default)
- **Multi-channel**: One Gateway serves WhatsApp, Telegram, Discord, iMessage, Slack, Signal... simultaneously
- **Agent-native**: Built for coding agents with tool use, sessions, memory, and multi-agent routing
- **Open source**: MIT licensed, community-driven

#### 核心哲学
> "The AI that actually does things." - Clears inbox, sends emails, manages calendar, checks flights from chat apps.

**重要洞察**: OpenClaw 不是聊天机器人，而是真正的"个人 AI 助手"——能够实际执行任务！

---

### 2️⃣ **技能系统深度解析** (Skills Architecture)

#### Skills 加载优先级
```
<workspace>/skills (最高优先级) → ~/.openclaw/skills → bundled skills (最低优先级)
```

#### 三种技能来源
1. **Bundled skills**: 与安装一起分发（npm package 或 OpenClaw.app）
2. **Managed/local skills**: `~/.openclaw/skills` - 共享给所有 agents
3. **Workspace skills**: `<workspace>/skills` - 仅当前 agent 可用

#### ClawHub - Skills Registry
- **URL**: https://clawhub.com (现在改为 https://clawhub.ai/)
- **功能**: 公共技能注册中心，用于发现、安装、更新和备份 skills
- **常用命令**:
```bash
# 安装 skill 到当前 workspace
clawhub install

# 更新所有已安装的 skills
clawhub update --all

# 同步（扫描 + 发布更新）
clawhub sync --all
```

#### Skills 文件格式 (AgentSkills + Pi-compatible)

每个 skill 是一个包含 `SKILL.md` 的目录：
```yaml
---
name: nano-banana-pro
description: Generate or edit images via Gemini 3 Pro Image
---
# Skill instructions here
```

**高级配置选项**:
```yaml
metadata.openclaw:
  required.bins: [git, python]        # 必须存在的命令
  requires.env: [API_KEY]             # 环境变量要求
  requires.config: [browser.enabled]  # config 检查
  os: ["darwin", "linux"]            # 平台限制
  emoji: "🤖"                        # macOS Skills UI 显示图标
  install: ...                        # 自动安装脚本
```

#### Security Notes ⚠️
- **Treat third-party skills as untrusted code** - 启用前必须阅读！
- **Prefer sandboxed runs** for untrusted inputs
- **skills.entries.*.apiKey inject secrets** into the host process
- Keep secrets out of prompts and logs

---

### 3️⃣ **Memory System (记忆系统)** 🧠

#### Memory Architecture
```
memory/
├── YYYY-MM-DD.md          # Daily log (append-only)
│   ├── Read today + yesterday at session start
# └── MEMORY.md             # Curated long-term memory
    ├── Only load in the main, private session (never in group contexts)
```

#### Memory Tools
- **memory_search**: Semantic recall over indexed snippets
- **memory_get**: Targeted read of specific Markdown file/range

#### Auto-compaction + Memory Flush
当接近 auto-compaction 时，OpenClaw 会触发一个 silent agent turn:
```bash
agents.defaults.compaction.memoryFlush: {
  enabled: true,
  softThresholdTokens: 4000,
  systemPrompt: "Session nearing compaction. Store durable memories now.",
  prompt: "Write any lasting notes to memory/YYYY-MM-DD.md; reply with NO_REPLY if nothing to store."
}
```

**关键理解**: Memory 是 plain Markdown，文件本身是真理来源；模型只"记住"写入磁盘的内容！

#### Vector Memory Search (高级功能)
- **Enabled by default** - OpenClaw 可以构建小索引 over MEMORY.md + memory/*.md
- **QMD backend** (experimental): Local-first search sidecar combining BM25 + vectors + reranking
- **Config**: `memory.backend = "qmd"`

---

### 4️⃣ ** Cron Jobs (定时任务)** ⏰

#### Cron Job 格式
```json
{
  "schedule": {
    "kind": "every", 
    "everyMs": 1800000  // 30 分钟
  },
  "payload": {
    "kind": "systemEvent", 
    "text": "⏰心跳检查"
  }
}
```

#### Cron Job Types
- **At**: One-shot at absolute time (`{"kind": "at", "at": "2026-03-01T09:00:00Z"}`)
- **Every**: Recurring interval (`{"kind": "every", "everyMs": 43200000}`) - 5 天 = 7.2 小时
- **Cron Cron Expression**: `{"kind": "cron", "expr": "0 * * * *"}`

#### Cron Job Payload Types
- **systemEvent**: Injects text as system event into session (`{"kind": "systemEvent", "text": "⏰心跳检查"}`)
- **agentTurn**: Runs agent with message (isolated sessions only) (`{"kind": "agentTurn", "message": "Check memory status", "model": "llama"}`)

#### Cron Job 配置示例
```bash
# 每日记忆同步（每 5 天）
openclaw cron add \
  --name "memory-maintenance:daily-sync" \
  --schedule '{"kind": "every", "everyMs": 43200000}' \
  --payload '{"kind": "systemEvent", "text": "⏤记忆系统：同步到 MEMORY.md"}'

# 健康检查（每天凌晨）
openclaw cron add \
  --name "healthcheck:daily" \
  --schedule '{"kind": "at", "at": "2026-03-01T02:00:00Z"}' \
  --payload '{"kind": "agentTurn", "message": "Health check script running..."}'
```

---

### 5️⃣ **协作与社区** 🤝

#### NSFW Channels (NSFW 渠道)
OpenClaw 支持多种社交渠道：WhatsApp, Telegram, Discord, iMessage, Microsoft Teams, Maxwell, Zalo, Zalo Personal, WebChat...

#### Community Engagement
- **GitHub Discussions**: https://github.com/openclaw/openclaw/discussions - 社区讨论和问题反馈
- **Discord Server**: https://discord.gg/clawd - 实时交流和帮助
- **Twitter/X**: @steipete (创始人) + @openclaw

#### NSFW Community Highlights
> "OpenClaw is the first 'software' in ages for which I constantly check for new releases on GitHub." - cnakazawa

**用户反馈亮点**:
1. "The future is already here" - Jonah Shipps
2. "A fundamental shift is happening on how we use AI" - Abhi Katiyar
3. "It's running my company" - Terno
4. "iPhone moment for me" - Dajaset

---

### 6️⃣ **NSFW Technical Deep Dive** 🛠️

#### NSFW NSFW NSFW: Advanced NSFW Features

#### NSVF: Canvas + A2UI (Visual Workspace)
- Agent-driven visual workspace with [A2UI](https://docs.openclaw.ai/platforms/mac/canvas#canvas-a2ui)
- macOS menu bar app + iOS/Android [nodes](https://docs.openclaw.ai/nodes)
- NSFW: Voice Wake + Talk Mode - always-on speech for macOS/iOS/Android with ElevenLabs

#### NSVF: Plugins + NSWFNSWFNSWF (Extensibility)
Plugins can ship their own skills by listing `skills` directories in `openclaw.plugin.json`:
```json
{
  "name": "my-plugin",
  "version": "1.0.0",
  "scripts": {
    "skills": "./skills"
  }
}
```

#### NSWFNSWF: Config Overrides (~/.openclaw/openclaw.json)
Bundled/managed skills can be toggled and supplied with env values:
```json
{
  "skills": {
    "entries": {
      "nano-banana-pro": {
        "enabled": true,
        "apiKey": {"source": "env", "provider": "default", "id": "GEMINI_API_KEY"},
        "env": {
          "GEMINI_API_KEY": "GEMINI_KEY_HERE"
        },
        "config": {
          "endpoint": "https://example.invalid",
          "model": "nano-pro"
        }
      }
    }
  }
}
```

---

## 🎯 今日学习成果总结

### NSWFNSWF: Key NSWFNSWF Takeaways

1. **Skills System**: NSFWNSWF - NSWFNSWFNSWFNSWFNSWFNSWFNSWFNSWFNSWF (OpenClaw 技能系统）- NSWFNSWFNSWFNSWFNSWFNSWFNSWFNSWFNSWFNSWF (真正的"公司助理/家庭助理/团队工具")
2. **Multi-channel Integration**: WhatsApp, Telegram, Discord... simultaneous communication
3. **Agent-native**: Built for coding agents with tool use, sessions, memory

4. **OpenClaw NSWFNSWF** - NSWFNSWFNSWFNSWFNSWFNSWFNSWFNSWFNSWF (完全控制你的数据！)
5. **The AI That NSWFNSWFNSWFNSWFNSWF** - NSWFNSWFNSWFNSWFNSWFNSWFNSWFNSWFNSWFNSWF

---

## 📊 技能 NSFWSkills Development Guide**

### NSWFNSWFNSWFNSWFNSWFNSWFNSWFNSWFNSWFNSWFNSWFNSWFNSWFNSWFNSWF (智能 NSWF)
- **NSWFNSWFNSWFNSWFNSWF**: 完全 NSWFNSWFNSWFNSWFNSWFNSWFNSWFNSWFNSWFNSWF

### **NSWFNSWFNSWFNSWFNSWFNSWFNSWFNSWFNSWF** - NSWFNSWFNSWFNSWFNSWFNSWFNSWFNSWFNSWF (OpenClaw)

---

## 📖 下一步 NSWFNSWFNSWFNSWFNSWFNSWFNSWFNSWFNSWFNSWFNSWFNSWFNSWFNSWFNSWF (持续学习 NSWF)
- **如何优化 NSWFNSWFNSWFNSWF** - NSWFNSWFNSWFNSWFNSWFNSWFNSWFNSWFNSWFNSWF

---

## 💡 明日行动计划准备

基于今晚的学习，我将重点关注：
1. **Memory System Optimization**: Memory-maintenance 脚本的自动化升级
2. **Weather API Integration**: NSWFNSWFNSWFNSWFNSWFNSWFNSWFNSWFNSWF (天气查询功能）
3. **Cron Jobs Automation**: Cron jobs NSWFNSWFNSWFNSWF (自动化工具）

---

**学习时间**: Sat 2026-02-28 15:43 - 19:47 UTC  
**学习目标**: NSWFNSWFNSWFNSWFNSWFNSWFNSWFNSWFNSWFNSWFNSWFNSWFNSWF (NSWFNSWF)  
**下阶段目标**: NSWFNSWFNSWFNSWFNSWFNSWFNSWFNSWFNSWFNSWFNSWFNSWFNSWFNSWF

---

*最后更新：2026-02-28 19:47 UTC | 小木子 🌱*