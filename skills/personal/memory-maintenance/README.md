# Memory Maintenance - 记忆维护工具

## 📝 Overview

这是一个为小木子设计的个人技能，用于系统化地管理日常笔记（daily notes）和长期记忆库（MEMORY.md）。它结合了真实的 Python 代码实现、详细的 API 参考文档和实用的配置模板。

## ✨ Features

- **自动记录**: 创建每日对话日志
- **定期同步**: 每 5 天检查一次，确保 daily note 和 MEMORY.md 保持一致
- **灵活处理**: 支持多种日期格式和时区
- **离线可用**: 无需网络连接即可运行

## 📦 Installation

1. 复制当前目录到用户路径：
   ```bash
   cp /home/node/.openclaw/workspace/skills/personal/memory-maintenance /path/to/skill
   ```

2. 安装依赖（如果需要）：
   ```bash
   pip install pyyaml
   ```

3. 设置可执行权限：
   ```bash
   chmod +x scripts/update.py
   ```

4. 创建连接文件（用户会被提示）：
   ```bash
   cp assets/sample_config.json config.json
   ```

## 🔧 Usage

### 基本用法

```python
from scripts.update import MemoryMaintenance

# 初始化
mm = timezoned()

# 加载今天的笔记
mm.load_daily_note()

# 创建新笔记
mm.create_new_day_report()

# 设置定时任务
mm.setup_cron_job(interval_days=5)
```

### Cron Job 配置

| 参数 | 说明 | 默认值 |
|------|------|--------|
| `interval_days` | 检查间隔（天） | 5 |
| `update_deadline` | 更新截止日期（天） | 7 |
| `timezone` | 时区 | UTC |

### API Reference

详细的 API 文档在 `references/api_reference.md`。

## 📅 Daily Note Structure

```markdown
# YYYY-MM-DD - Day X - Summary

## Today's Events

- [时间] 事件描述

## Key Decisions

1. 决定内容
2. ...

## Pending Tasks

- [ ] Task description
```

## 🗃️ Memory.md Format

长期记忆文件（MEMORY.md）应该包含：

1. **关于用户** - 基本信息和偏好
2. **技术能力** - 系统配置详情
3. **工作模式** - 日常流程和规则
4. **时间线** - 按日期记录大事记

## 🎯 Example Commands

### 创建新的 daily note

```bash
python scripts/update.py --action create-day-report
```

### 同步到 MEMORY.md

```bash
python scripts/update.py --action sync-to-memory
```

### 设置定时任务

```bash
openclaw cron add \
  --name "memory-maintenance" \
  --port 1234 \
  --config '{"key": "value"}' \
  --format json \
  --skip-annotations=true
```

## 💡 Tips

- ✅ 确保所有时间戳使用 UTC 格式（`08:24 UTC`）
- ✅ 日期格式应该一致：`YYYY-MM-DD HH:MM`
- ✅ Cron 任务的时间间隔应保持固定
- ⚠️ 不要将用户密码或敏感信息写入笔记

## 📋 License

MIT License - 可以自由使用，但请尊重用户的隐私和选择。