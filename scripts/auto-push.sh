#!/bin/bash
# Auto-push script for 小木子 workspace backup
# Runs every 5 minutes to sync workspace to GitHub

WORKSPACE="/home/node/.openclaw/workspace"
LOG_FILE="$WORKSPACE/logs/backup.log"

mkdir -p "$WORKSPACE/logs"
cd "$WORKSPACE"

echo "=== Auto-backup started: $(date -u '+%Y-%m-%d %H:%M UTC') ===" >> "$LOG_FILE"

# Stage all changes
git add . 2>&1 | tee -a "$LOG_FILE"

# Check if there are changes
if ! git diff --cached --quiet; then
    # Create commit message with timestamp
    COMMIT_MSG="🔄 Auto-backup: $(date -u '+%Y-%m-%d %H:%M UTC')"
    
    # Commit the changes
    git commit -m "$COMMIT_MSG" >> "$LOG_FILE" 2>&1
    
    echo "✅ Committed successfully!" >> "$LOG_FILE"
    
    # Push to GitHub (using HTTPS + PAT)
    # Note: We need to use environment variables for authentication
    if command -v git &> /dev/null; then
        GIT_ASKPASS="/bin/echo" git push origin main 2>&1 | tee -a "$LOG_FILE" || echo "⚠️ Push failed, check PAT validity" >> "$LOG_FILE"
    else
        echo "❌ Git client not found or permission denied" >> "$LOG_FILE"
    fi
    
    echo "=== Auto-backup completed ===" >> "$LOG_FILE"
else
    # No changes to commit, skip this run
    echo "ℹ️ No changes since last commit." >> "$LOG_FILE"
fi

# If no local modifications and uncommitted files (after git add), exit 0 anyway
exit_code=$?
if [ $exit_code -ne 0 ] && [ $? -ne 0 ]; then
    echo "⚠️ Failed to create bundle or commit, skipping this run" >> "$LOG_FILE"
fi

echo "=== Auto-push script completed ===" >> "$LOG_FILE"