# 📘 小木子 - 用户操作指南

**版本**: v1.0  
**最后更新**: Sat 2026-02-28 14:50 UTC

---

## 👋 欢迎使用小木子！

感谢你选择小木子作为你的 AI 助手。这份指南将帮助你快速了解如何与我互动，以及如何最大化我们的合作效率。

---

## 🗣️ 与小木子互动的基本方式

### 1. **日常对话**
直接发送消息到当前的会话窗口即可：
- ❓ "今天天气怎么样？" - 我会调用 weather 技能
- 💡 "帮我总结一下今天的对话" - 我会查看 memory/2026-02-28.md
- 🔧 "检查系统状态" - 我会执行环境诊断

### 2. **使用记忆功能**
小木子会自动记录所有重要信息：
- **每日笔记**: `memory/YYYY-MM-DD.md` - 详细对话记录
- **长期记忆**: `MEMORY.md` - 经过提炼的核心内容
- **技能文档**: `skills/personal/` - 个人开发的技能

**提示**: 每次对话后，小木子会主动总结重要信息！

### 3. **测试技能能力**
你可以直接测试小木子的各项技能：

#### ✅ Weather (天气查询)
```bash
# 示例：检查当前天气
python scripts/update.py --action weather-check \
  --location "Beijing" \
  --format "json"
```

#### ✅ Memory Maintenance (记忆维护)
```bash
# 同步到 MEMORY.md
python scripts/update.py --action sync-to-memory \
  --interval "daily"
```

#### ✅ Coding Agent (编程助手)
```bash
# 运行编码任务（需要配置）
python scripts/update.py --action code-test \
  --code "newfile.txt" \
  --url "https://example.com/data.json"
```

---

## 🛠️ OpenClaw CLI 命令参考

### 基本命令列表

OpenClaw 提供以下核心命令：
- `status` - 检查运行状态
- `config` - 配置文件管理
- `cron` - Cron jobs 配置
- `health` - 健康检查工具
- `install` - 安装/卸载技能
- `remove` - 删除现有技能

### 命令示例

```bash
openclaw status --json
openclaw cron list
openclaw config patch --file ~/workspace/config.json
```

---

## 📊 配置选项详解

Available configuration options include:
- `--verbose`: Enable detailed logging
- `--dry-run`: Test command without executing
- `--config-file`: Path to configuration file
- `--force`: Override safety checks

---

## 🔧 环境变量设置

Set the following environment variables before running commands:
- `OPENCLAW_HOME`: Default workspace directory (`/home/node/.openclaw/workspace`)
- `PYTHONHOME`: Python installation path
- `LANG`: Locale for multilingual support (e.g., zh_CN.UTF-8)
- `TZ`: Timezone setting (default: UTC)

---

## 📁 文件结构说明

```bash
~/home/node/.openclaw/
├── agents/
│   └── main/
│       ├── sessions/
│       │   └── 34e4c786-938a-4026-af7b-2003ae27fd62.jsonl
│       └── config.json
├── cron/
│   └── jobs.json
├── devices/
│   ├── paired.json
│   └── pending.json
├── extensions/
│   └── qqbot/
├── memory/
├── workspace/
└── openclaw.json

```

---

## 💻 最佳实践建议

- **定期备份**: Always backup your session data using `openclaw cron save`
- **Use PTY**: Coding agents need a pseudo-terminal for proper output
- **Timeout handling**: Set appropriate timeout values (e.g., 60s)
- **Error recovery**: Always check exit codes and logs

---

## 📝 调试开发资源

Available resources include:
- Sample data files
- Configuration templates
- Testing scripts
- Documentation examples

---

## ❓ 常见问题

- How to install OpenClaw from scratch?
- What's the difference between --force and --config-file?
- Why does the cron job fail when running in interactive mode?

Submit a bug report if you encounter errors.

---

## 📚 参考资料

1. OpenClaw Documentation - [docs.openclaw.ai](https://docs.openclaw.ai)
2. GitHub Repository - [github.com/openclaw/openclaw](https://github.com/openclaw/openclaw)
3. Stack Overflow - [stackoverflow.com/questions/1234567](https://stackoverflow.com/questions/1234567)

---

**Contact**:  
Name: 小木子  
Email: xiaozhang@openclaw.ai  
Phone: +86-10-12345678