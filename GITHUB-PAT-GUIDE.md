# 📋 GitHub PAT Setup Instructions for 小木子

**Purpose**: Enable auto-push backup to GitHub via HTTPS + PAT authentication.

## ✅ Step-by-Step: Generate PAT (if you need to regenerate)

### 1. Go to GitHub Settings:
   - https://github.com/settings/tokens

### 2. Generate New Token (Classic):
   - Click "Generate new token" → "Generate new token (classic)"

### 3. Fill in the Form:
   - **Note**: `xiaomuzi-backup-token`
   - **Expiration**: 30 days (or longer)
   - **Permissions**: 
     - ✅ Check `repo` (full repository access)
     - ✅ Uncheck all others

### 4. Generate Token:
   - Click "Generate token" at the bottom
   - Copy the generated token (it will only show once!)

## 🔧 Step-by-Step: Configure Git in Container

### In this container, execute:
```bash
cd /home/node/.openclaw/workspace

# Set PAT as environment variable (replace with your actual token):
export GITHUB_PAT="YOUR_TOKEN_HERE"

# Push the workspace to GitHub using HTTPS:
git add .
git commit -m "🔄 Auto-backup from小木子 $(date)"
GIT_TERMINAL_PROMPT=0 git push origin main <<EOF
${GITHUB_PAT}
arbor851203
EOF
```

## 📌 Note:
- Replace `YOUR_TOKEN_HERE` with the actual PAT you generated.
- The token must be valid and have `repo` permission.
- If push fails, check if the token is expired and regenerate it.