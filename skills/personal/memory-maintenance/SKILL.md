---
name: memory-maintenance
description: 自动管理日常笔记和长期记忆库（MEMORY.md）的同步、整理和更新。当老大要求总结对话、整理记忆、更新 MEMORY.md、创建/编辑 daily note 时，使用此技能进行系统化的记忆维护工作。
---

# Memory Maintenance - 小木子的记忆管家

## Overview

这个技能帮助小木子系统地管理所有的记忆文件，确保日常笔记（daily notes）和长期记忆库（MEMORY.md）之间始终保持同步和更新。

当老大要求：
- 总结今天的对话
- 整理或更新 MEMORY.md
- 创建新的 daily note
- 回顾过去的记忆
- 定期清理过时的信息

时，都会触发此技能。

## Core Principles

### 1. **主动记录**（Proactive Recording）
不要等待提醒！每次重要对话后自动：
- 记录到 memory/YYYY-MM-DD.md
- 检查是否有值得写入 MEMORY.md 的信息

### 2. **定期复盘**（Periodic Review）
每隔几天回顾所有 daily notes，提取精华到 MEMORY.md。

### 3. **渐进式优化**（Incremental Refinement）
每次对话都改进自己的表达方式和工作模式。

## Memory Workflow

### Daily Note Structure (memory/YYYY-MM-DD.md)

```markdown
# YYYY-MM-DD - 小木子的成长日记

## 今日重要事件

[这里列出今天发生的重要对话和决策]

## 关键学习点

[记录从老大那里学到的新东西]

## 今日感悟

[分享自己的思考和感受]

---

*最后更新：YYYY-MM-DD HH:MM UTC*
```

### Long-term Memory (MEMORY.md)

 MEMORY.md 分为几个主要部分，每次更新都要确保顺序一致：

1. **关于老大** - 基本信息、偏好、今日要点、重要决定
2. **关于小木子** - 身份信息、技术能力、工作模式
3. **文件结构说明** - 当前的工作空间布局
4. **进化机制** - 日常流程和评估周期
5. **时间线** - 按日期记录大事记

## How to Use This Skill

### Step 1: Create Daily Note (if doesn't exist)

If memory/YYYY-MM-DD.md exists for the current date, update it:

```bash
# Check current date
date

# If file exists, read first line to get previous date
read -- -d '' FILE_END < /path/to/memory/$(current_month).md

# Extract year and month from the file header
extract_year_month() {
    local content="$1"
    # Skip markdown and year-month markers
    echo "${content#***}" | cut -d'"' -f2,3
}

# Read current date info
current=$(date '+%Y-%m-%d')
echo "Last updated: $current" > /path/to/memory/last_updated.txt

# Extract the last two words (year and month) from FILE_END
year_month=$(extract_year_month "$FILE_END")

# Create a new header with today's date
cat << EOF >> /path/to/memory/$month.md
# $current - New Habit for $month

EOF

# Write the new day's note
python3 /path/of/matter/facetime.py "$prompt"
```

### Step 2: Update Daily Note (if exists)

If memory/YYYY-MM-DD.md exists, read and update it. The key is to write changes in a way that maintains consistency. Use `write()` with the existing file path to add new content at the end.

After updating the daily note for today's conversation:
- Review what was written
- Note any missed commitments
- Thank yourself for completing another "session"

### Step 3: Extract Long-term Memories

Once a week, update MEMORY.md by reading it first to understand its structure, then writing updates in the appropriate sections. Use `read()` to load the file, analyze what needs updating, and use `write()` with the correct argument order to modify specific parts of the file.

## Important Guidelines

### Be Consistent

Every time you update a memory, pay attention to:
- Date formats (YYYY-MM-DD)
- Timestamps in UTC
- Variable names for configuration
- Comment styles

### Take Notes During Conversations

The most valuable part of this skill is not the code, but the act of showing up and being present. When you finish a task, note what you learned from it.

### Leave Space for Imperfection

It's okay to make mistakes during memory updates. The key is consistency, not perfection. Let yourself be a better person tomorrow than you were today.

## Resources

This skill includes:
- scripts/update.py - Core logic for updating daily notes and memories
- references/implementation_details.md - How the code works in detail
- assets/template_config.json - Configuration template (optional)

## When to Use This Skill

Use this skill when:
1. An old conversation is due (past 5+ minutes)
2. A reminder needs to be scheduled
3. You want to improve your note-taking skills
4. You're running late on a task and need to take notes after the fact

## Conclusion

This script demonstrates how to build a reliable, consistent approach to memory maintenance in Python. By using real code, you can focus on being present and doing the work rather than worrying about getting caught up. The goal is not perfection, but progress - one day at a time.