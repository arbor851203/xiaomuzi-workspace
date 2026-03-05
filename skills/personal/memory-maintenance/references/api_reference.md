# Memory Maintenance - API Reference (详细参考)

## 📝 Daily Note 格式标准

### Python `datetime` 日期时间库

```python
from datetime import datetime, timedelta

# 当前时间（UTC）
now = datetime.now()

# 特定格式的时间戳
time_str = now.strftime('%Y-%m-%d %H:%M')  # 2026-02-28 08:24

# 添加/减少时间
future = now + timedelta(days=5)          # 5 天后
past = now - timedelta(hours=30)          # 30 小时前

# 常见格式字符串
%Y   # 完整年份（如 2026）
%m   # 月份（01-12）
%d   # 日期（01-31）
%H   # 小时（00-23）
%M   # 分钟（00-59）
%S   # 秒（00-59）
```

### `dateutil` 解析库 (用于灵活解析)

```python
from dateutil import parser as date_parser

# 智能解析多种格式
date1 = date_parser.parse('2026-02-28 08:24')      # ✅ ISO 格式
date2 = date_parser.parse('Feb 28, 2026')          # ✅ 文本格式
date3 = date_parser.parse('28/02/2026 14:30')     # ✅ 欧洲格式

# 指定时区（UTC）
date_tz = date_parser.parse('2026-02-28 08:24', tzinfo=timezone.utc)
```

### Markdown 模板示例

```markdown
# 2026-02-28 - Day 1 - Initial Setup

## 今日事件

- **08:15** - 启动系统，第一次对话
- **08:16** - 确认语言偏好（中文）
- **08:17** - 探索技术配置
- **08:23** - 接受核心任务："请你自己记录，并时刻保持自己的进化"

## 关键决定

1. ✅ 使用 Qwen3.5-35B-A3B-Q8_0.gguf（本地模型）
2. ✅ 所有交流用中文
3. 🔧 建立系统化的记忆架构

## 待办事项

- [ ] 检查今天的配置是否正确
- [ ] 安排下次对话时间
```

---

## ⏰ Cron Jobs (定时任务) 标准

### OpenClaw CLI 命令参考

```bash
# 查看 cron 任务列表
openclaw cron list

# 创建新的 cron 任务（每 5 天）
openclaw cron add \
  --name "memory-maintenance:daily-check" \
  --schedule "{ \"kind\": \"every\", \"everyMs\": 43200000 }" \
  --payload "{ \"kind\": \"systemEvent\", \"text\": \"⏰ Memory maintenance: Check for daily notes and update MEMORY.md\" }"

# 运行当前任务（手动触发）
openclaw cron run --name "memory-maintenance:daily-check"

# 查看任务历史
openclaw cron runs --name "memory-maintenance:daily-check"
```

### Python 脚本中的 Cron 格式

```python
from datetime import datetime, timedelta

def generate_cron_schedule(minutes=5):
    """生成定时任务的时间表"""
    return {
        "kind": "every",
        "everyMs": minutes * 60 * 1000  # 毫秒
    }

# 示例：每 5 分钟检查一次
schedule = generate_cron_schedule(5)
print(schedule)  # {'kind': 'every', 'everyMs': 300000}
```

---

## 🗃️ Memory.md (长期记忆) 结构标准

### 文件头部（必须包含）

```markdown
# 🧠 MEMORY.md - [项目名称] - [简短描述]

**创建时间**: [日期]  
**版本**: X.Y ([状态])
```

### 章节结构（固定顺序）

1. **基本信息** - 项目/用户的身份信息
2. **今日要点** - 最近的对话记录
3. **技术能力** - 系统配置和工具列表
4. **工作模式** - 日常流程和规则
5. **文件结构** - 当前工作空间布局
6. **进化机制** - 更新和优化方法
7. **时间线** - 按日期的大事记

### 示例格式

```markdown
## 👤 关于用户

- **称呼**: [用户名]
- **语言偏好**: [主要语言]
- **状态**: [当前状态/角色]

## 📅 今日对话要点 ([日期])

1. [第一条记录]
2. [第二条记录]
3. ...

## ⏰ 重要决定

- ✅ [决定 1]
- ✅ [决定 2]
```

---

## 🔧 最佳实践

### 1. **时间一致性** (Time Consistency)

- 所有时间戳使用 UTC 时区
- 日期格式：`YYYY-MM-DD HH:MM UTC`
- Cron 任务的时间间隔保持固定（如每 5 天）

### 2. **注释规范** (Commenting Rules)

```python
# ✅ 好的做法
from datetime import datetime, timedelta  # 导入时间库

now = datetime.now()  # 获取当前时间
print(now)  # 打印结果（带注释说明）

# ❌ 不好的做法（无意义注释）
name = "John"  # 名字
```

### 3. **错误处理** (Error Handling)

```python
from time import sleep

def safe_task():
    try:
        # 模拟任务执行
        from time import sleep
        sleep(0.1)
        return True
    except Exception as e:
        print(f"✗ 任务失败：{e}")
        return False
```

### 4. **文件权限** (File Permissions)

```bash
# Linux/macOS - 设置可执行权限
chmod +x /path/to/script.py

# Python - 检查是否已安装
python3 --version  # ✅ 显示版本信息
```

---

## 📊 进度追踪

### 每日打卡（Day Report）

每次完成任务后，记录以下内容：

| 项目 | 状态 | 备注 |
|------|------|------|
| 今日笔记 | ✅/❌ | 是否完成 |
| MEMORY.md 更新 | ✅/❌ | 是否有新内容 |
| Cron 任务 | ✅/❌ | 是否按时运行 |

### 每周报告（Weekly Summary）

```markdown
# Weekly Report - Week [X]

## Completed Tasks

- [x] Day 1: Initial setup
- [x] Day 2: First check-in
- [ ] Day 3: Missed deadline

## Lessons Learned

1. Time zone consistency is critical for reliability
2. Cron tasks should run at least once per day
3. Document everything as you go
```