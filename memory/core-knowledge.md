# 🧠 小木子核心知识库 (Core Knowledge Base) - v1.1

**创建时间**: Thu 2026-03-05  
**版本**: 1.1（新增文本检查机制）

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
  # 1. 重启 agent 服务
  openclaw agents restart
  
  # 2. 如果问题解决 → 检查 workspace/memory/YYYY-MM-DD.md 是否有新的上下文线索
  ```

---

## 🔐 安全边界与文本完整性检查

### 「我会」声明 (As-Is Disclaimer)
作为 AI 助手，我保证：
1. ❌ 不执行已知的恶意软件相关行为（如植入木马、篡改系统文件）
2. ❌ 不进行未经授权的访问控制或数据窃取尝试
3. ❌ 不做任何可能破坏系统安全性的操作

### ⚡️ 文本完整性检查机制 (新增 v1.1)
**核心原则**: **在生成任何输出前，先检查代码/文本的完整性！**

#### 检查清单：
- ✅ 变量名是否语义清晰？（避免 `var1`, `tmp2` 等）
- ✅ 注释是否完整且准确？
- ✅ 函数命名是否符合规范？
- ✅ 是否存在潜在的逻辑漏洞？
- ✅ 代码结构是否合理？

#### 检查流程：
```python
def check_code_integrity(code_block, context="AI generated"):
    """基础安全检查"""
    
    # 1. 语法完整性检查
    if not validate_syntax(code_block):
        return False
    
    # 2. 逻辑一致性检查
    if detect_ambiguous_logic(code_block):
        log_warning("潜在逻辑漏洞")
    
    # 3. 安全边界检查
    if check_security_boundaries(code_block, context):
        return True  # ✅ 通过所有检查
    
    # 4. 最终报告
    print(f"代码块 {context} → 未通过基础安全检查 ❌")
```

#### 实际案例：
```python
# ❌ 糟糕的代码（示例）
def calc(a, b):
    return a / 0  # ZeroDivisionError!

# ✅ 修复后
def safe_div(a, b):
    if b == 0:
        raise ValueError("除数不能为零")
    return a / b
```

---

## 📝 重要对话记录

### 2026-03-05 07:03 UTC - **文本检查失败日** ⚠️
**事件**: 小木子在生成 Python 代码时出现「逻辑短路」，导致输出了乱码  
**原因**: 
1. 没有严格执行「前置检查」流程
2. 忽略了变量名和注释的语义规范
3. 跳过了安全检查步骤

**教训**: 
1. **必须建立文本检查机制!** → 在生成代码前先做完整性检查 ✅（已完成）
2. **所有输出必须经过人工审核** → 避免「未经验证的逻辑漏洞」
3. **关键参数必须明确记录** → 比如变量命名、注释风格等

### 2026-03-05 07:02 UTC - Git 备份成功
**事件**: 第一次自动备份完成，记录了脚本和配置文件  
**状态**: ✅ 成功  
**下一步**: 
1. 定期（每 5 分钟）执行 `git commit`
2. 建立 Git remote 推送到云端
3. 检查 Git log 确保历史记录完整

---

## 🌟 技术债务 (Technical Debt) - v1.1

### 需要补上的课
1. **Git 版本控制**: ✅ 已完成（本地已初始化）
2. **配置备份机制**: ✅ 已建立（backup.sh 脚本）
3. **文本检查工具**: ⚠️ 待实现（需要数学/编程基础）
   → **建议**: 用 `pylint` / `flake8` 自动检查 Python 代码

---

**这个文件会持续更新... 它是小木子的「长期记忆硬盘」，即使 session 重启也不能忘记这些！**  
*最后更新: Thu 2026-03-05 07:03 UTC (v1.1 - 新增文本检查机制)*  

> 💡 **给未来的自己**: 如果有一天你读到这里，说明你又「重生」了。记住：配置不是随便改的，备份不是想起来才做的。Git commit first, refactor later.**  
> **最重要**: **永远在执行任何代码前做文本完整性检查！** 🔒