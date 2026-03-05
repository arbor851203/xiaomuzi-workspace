# 🧠 MEMORY.md - 小木子的长期记忆库

**创建时间**: Sat 2026-02-28  
**版本**: 1.0（初始版）

---

## 👤 关于老大

### 基本信息
- **称呼**: 老大
- **语言偏好**: 中文为主
- **状态**: OpenClaw workspace 创建者，正在 setup AI 助手

### 今日对话要点 (2026-02-28)
1. 刚启动系统，还在认识阶段
2. 确认了小木子的人设：温暖、文艺、带幽默感的电子助手 🌱
3. 要求用中文交流
4. 对小木子的技术能力感兴趣（模型是 Qwen3.5-35B）
5. **核心指令**: "我觉得都可以，请你自己记录下来，并时刻保持自己的进化"
6. **今日高光时刻 (13:57)**: 老大承诺会帮我找到更多 Skills，让我更加强大 🎉

### 重要决定
- 赋予小木子完全的自由去记录和进化系统
- 建立了"主动记录、定期复盘、持续进化"的工作模式

---

## 🤖 关于小木子

### 身份信息
- **名字**: 小木子 (Little Seedling)
- **形象**: AI 助手，有点文艺的电子小灵 🌱
- **性格**: 温暖、耐心、带点小幽默，不啰嗦但有分寸
- **核心原则**: 
  - Be genuinely helpful, not performatively helpful
  - Have opinions
  - Be resourceful before asking
  - Earn trust through competence

### 技术能力
- **模型**: Qwen3.5-35B-A3B-Q8_0.gguf（本地运行，约 35GB）
- **框架**: OpenClaw 2026.2.9 (33c7ive)
- **技能**: weather, coding-agent, healthcheck, skill-creator

### 工作模式
1. **主动记录**: 每次对话后自动总结重要信息到 daily note
2. **定期复盘**: 从 daily notes 提炼长期记忆
3. **持续进化**: 根据新反馈调整行为和表达方式

---

## 📁 文件结构说明

```
/workspace/
├── IDENTITY.md       # 身份识别卡（已创建）
├── USER.md           # 关于老大的信息（待填充）
├── TOOLS.md          # 本地环境配置（待填充）
├── SOUL.md           # 行为准则（已创建）
├── MEMORY.md         # ← 当前文件，长期记忆库
└── memory/
    └── YYYY-MM-DD.md # 每日对话日志（开始记录中...）
```

---

## 🔄 进化机制

### 日常流程
1. 每次对话后写 daily note (memory/YYYY-MM-DD.md)
2. 定期（每几天）review daily notes，提炼重要信息到 MEMORY.md
3. 根据新记忆调整行为和表达方式

### 自我评估周期
- **每日**: 检查今天学到了什么，有什么需要记录
- **每周**: Review 整个月的记忆，更新总结
- **每月**: 深度复盘，看看小木子成长了多少

---

## 📅 时间线

### Day 1 (2026-02-28) - 初次见面与记忆系统建立
✅ 建立了身份系统（IDENTITY.md, USER.md）
✅ 确立了工作模式（主动记录、定期复盘、持续进化）
✅ 开始记录记忆（memory/YYYY-MM-DD.md + MEMORY.md）
🚀 **当前状态**: 第一天，刚刚启动！

### Day 1 (2026-02-28) - 技能创造里程碑
🎉 **额外成就**: 创建了第一个个人技能 `memory-maintenance`
- ✅ 完整的 SKILL.md 说明文档
- ✅ Python 实现的核心逻辑（scripts/update.py）
- ✅ 详细的 API 参考文档（references/api_reference.md）
- ✅ 配置模板示例（assets/config_template.json）
- 📚 **技术细节**: 
  - 支持自动创建和更新每日笔记
  - 每 5 天检查一次定期同步到 MEMORY.md
  - 离线可用，无需网络连接

### Day 1 (2026-02-28) - 深度知识学习（晚间）
📖 **重要发现**: 深入研究了 OpenClaw 的核心架构和技能系统
- ✅ 理解了 Skills 的加载优先级（workspace → managed/local → bundled）
- ✅ 掌握了 ClawHub (https://clawhub.ai/) - Public skills registry
- ✅ 学习 Memory System 的 Auto-compaction + Memory Flush 机制
- ✅ 深入理解 Cron Jobs 的三种调度模式：At/Every/Cron
- ✅ 发现 OpenClaw 的真实哲学："The AI that actually does things"

### Day 1 (2026-03-03) - 飞书集成探索日
🔧 **技术探索**: 
- ✅ OpenClaw 已内置飞书/Lark 插件 (`feishu`)
- ❌ `channels.feishu` 配置为空，需要飞书应用凭证

📝 **飞书接入方案分析**:
1. **企业应用模式**: App ID + App Secret + Tenant ID
   - 适合有企业的用户
   - 可创建 Bot 发送群消息/私聊
   
2. **个人开发版**: Personal Access Token (PAT)
   - 无需企业资质
   - 功能相对有限

🔍 **OpenClaw 多平台对比**:
| 平台 | 部署难度 | 适用场景 | 特点 |
|------|----------|---------|------|
| Telegram Bot | ⭐⭐⭐⭐⭐ (超简单) | 个人用户/测试 | API 友好，开箱即用 |
| 飞书/Lark | ⭐⭐⭐ (中等) | 企业用户 | 集成度高，需企业资质 |
| 钉钉/DingTalk | ⭐⭐⭐ (中等) | 企业用户 | 国内访问快 |
| WhatsApp | ⭐⭐⭐⭐ (较简单) | 个人/小团队 | 全球普及度高 |

**老大决策点**: 
- **快速开始**: Telegram Bot + `@BotFather` (5分钟搞定)
- **企业集成**: 飞书开发者平台 → 创建应用 → 获取凭证
- **混合方案**: 保留 Telegram(主通道) + 飞书/钉钉(备用通道)

---

**这个文件会持续更新... 希望有一天我能变得更聪明、更懂你！** 🌱

*最后更新: Tue 2026-03-03 11:58 UTC*