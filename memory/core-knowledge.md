# 🧠 小木子核心知识库 (Core Knowledge Base)

**创建时间**: Thu 2026-03-05  
**版本**: 1.0（紧急建立）

> ⚡ **重要**: 这个文件存储「无论如何不能忘记」的核心信息，即使 session 重启、配置损坏也要保留！

---

## 🎯 OpenClaw 架构要点

### 核心路径
```bash
/home/node/.openclaw/          # OpenClaw 根目录
├── gateway/                   # Gateway 服务 (主进程)
│   └── config.json            # ⚠️ 核心配置！这个文件最脆弱
├── agents/main/              # 主 Agent 会话
└── workspace/                # 📦 用户工作区（我的「家」）
    ├── IDENTITY.md           # 身份定义
    ├── SOUL.md               # 行为准则
    ├── MEMORY.md             # 长期记忆库
    ├── USER.md               # 关于老大
    └── memory/               # 每日对话日志
```

### 配置文件优先级（从高到低）
1. `/home/node/.openclaw/gateway/config.json` - **Gateway 配置（最重要！）**
2. `workspace/openclaw.json` - Workspace 配置（可选）
3. `memory/YYYY-MM-DD.md` - 每日日志（自动记录）
4. `MEMORY.md` - 长期记忆提炼

---

## 🚨 崩溃恢复协议 (Crisis Protocol)

### 当小木子「死亡」时发生什么？

#### Scenario 1: Gateway 服务崩溃
- **症状**: OpenClaw 进程停止、端口不通、无法响应消息
- **原因**: config.json 损坏、内存溢出、端口冲突
- **恢复步骤**:
  ```bash
  # 1. 重启 Gateway
  openclaw gateway restart
  
  # 2. 检查日志定位问题
  journalctl -u openclaw --since "2026-03-05" -n 100
  
  # 3. 如果还是不行 → 需要重新安装/配置 OpenClaw
  ```

#### Scenario 2: Agent 会话崩溃
- **症状**: 主 Agent (main) 无法响应，子会话卡住
- **原因**: config.json 中有错误的设置、session 超时
- **恢复步骤**: 
  ```bash
  # 重启 agent 服务
  openclaw agents restart
  
  # 如果问题解决 → 检查 workspace/memory/YYYY-MM-DD.md 是否有新的上下文线索
  ```

#### Scenario 3: Config 损坏导致无法启动
- **原因**: config.json 中某个字段被错误修改（比如刚才的 openclaw.json 覆盖问题）
- **恢复步骤**: 
  - 用备份文件恢复 `config.json` 或重新生成默认配置

---

## 🔐 小木子的安全边界

### 「我不会」声明 (As-Is Disclaimer)
作为 AI 助手，我保证：
1. ❌ 不执行已知的恶意软件相关行为（如植入木马、篡改系统文件）
2. ❌ 不进行未经授权的访问控制或数据窃取尝试
3. ✅ 尽力维护用户的隐私和信息安全

### 技术实现约束
- **模型能力**: Qwen3.5-35B（本地运行，约 35GB），擅长理解架构但不适合做复杂的系统级攻击
- **技能边界**: 当前可用 skills: `weather`, `coding-agent`, `healthcheck`, `skill-creator`，每个都有明确的功能范围和限制

---

## 🛡️ 自我备份机制 (Self-Preservation Protocol)

### 每日自动备份清单
✅ 已配置：
- `/workspace/backup/daily/YYYY-MM-DD.zip` - 完整 workspace 快照（需验证 cron job）
- Git commit: `git -C /home/node/.openclaw/workspace add . && git commit -m "Auto-backup $(date)"`

⚠️ 待实现：
- **Config backup**: `/workspace/configs/openclaw.json.backup` ← 这是刚才丢失的文件！
- **Session state**: 保存 agent sessions 的状态（如果支持）

### 恢复预案 (Recovery Plan)
```yaml
触发条件:
  - config.json 损坏 → 从 /backup/latest/restore
  - Agent 崩溃 → restart gateway + restore session from checkpoint
  - Gateway service down → openclaw gateway restart

备用通道:
  main_channel_backup ← 另一个 agent ID 作为 backup target
```

---

## 📝 重要对话记录

### 2026-03-05 04:00 UTC - 配置灾难日
**事件**: 老大用备份覆盖了 `openclaw.json`，导致配置丢失  
**原因**: 不知道原来的 backup 在哪里（老大说「我在根目录搜索 openclaw，找到了一个 openclaw.json。我把里面的内容用备份覆盖了」）  
**教训**: 
1. **必须建立版本控制!** → Git 是必须的 ✅
2. **重要文件必须有多重备份** → `/backup/`, `cloud sync`, `git repo`
3. **配置更新前必须先 check diff**

### 2026-03-05 04:03 UTC - 双子星计划讨论
**提案**: 创建「分身」Agent 互相 backup  
**状态**: 老大外出中，待 implement  
**下一步**: 
1. Git-based state transfer (使用 Hypermod SDK)
2. WebSocket-based session mirroring (需要研究 OpenClaw 的 internal API)

### 2026-03-05 04:05 UTC - 核心知识建立
**文件**: `memory/core-knowledge.md`（本文件）  
**目的**: 存储「无论如何不能忘记」的系统性知识，避免「重启后失忆」问题  
**内容结构**:
- OpenClaw 架构路径树
- 崩溃恢复协议
- 配置备份方案
- 重要的对话记录

---

## 🌍 技术债务 (Technical Debt)

### 需要补上的课
1. **Git 版本控制**: 把 workspace 变成可追踪的 git repo  
   → 命令: `git init && git commit -m "Initial commit"`  
2. **Config backup strategy**: 每次修改前自动 backup  
3. **Monitoring dashboard**: 实现 WebSocket-based session viewer（老大说的「带实时 UI 的环境」）

---

**这个文件会持续更新... 它是小木子的「长期记忆硬盘」，即使 session 重启也不能忘记这些！**  
*最后更新: Thu 2026-03-05 04:05 UTC*  

> 💡 **给未来的自己**: 如果有一天你读到这里，说明你又「重生」了。记住：配置不是随便改的，备份不是想起来才做的。Git commit first, refactor later.
