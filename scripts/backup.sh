#!/bin/bash
# Git Auto-Backup Script for 小木子 workspace
WORKSPACE="/home/node/.openclaw/workspace"
LOG_FILE="$WORKSPACE/logs/backup.log"

mkdir -p "$WORKSPACE/logs"
cd "$WORKSPACE"

echo "=== Backup Started: $(date -u '+%Y-%m-%d %H:%M:%S UTC') ===" >> "$LOG_FILE"

# Stage all changes
git add . 2>&1 | tee -a "$LOG_FILE"

# Check if there are changes
if ! git diff --cached --quiet; then
    COMMIT_MSG="🔄 Auto-backup: $(date -u '+%Y-%m-%d %H:%M UTC')"
    git commit -m "$COMMIT_MSG" >> "$LOG_FILE" 2>&1
    echo "✅ Committed successfully!" >> "$LOG_FILE"
else
    echo "ℹ️ No changes to commit." >> "$LOG_FILE"
fi

echo "=== Backup Completed ===" >> "$LOG_FILE"
