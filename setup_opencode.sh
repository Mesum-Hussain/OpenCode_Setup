#!/usr/bin/env bash

# Exit immediately if a command exits with a non-zero status
set -e

# Define directories
TARGET_DIR="./opencode"

echo "=========================================="
echo " Starting Opencode + Hindsight Setup "
echo "=========================================="

# 1. Ensure target directory exists
echo "📁 Creating directory structure..."
mkdir -p "$TARGET_DIR"

# 2. Generate opencode.json
echo "📝 Writing opencode.json..."
cat << 'EOF' > "$TARGET_DIR/opencode.json"
{
  "$schema": "https://opencode.ai/config.json",

  "model": "google/gemini-3.1-flash-lite",
  "small_model": "google/gemini-3.1-flash-lite",

  "agent": {
    "plan": {
      "model": "google/gemini-3.1-flash-lite"
    },
    "build": {
      "model": "google/gemini-3.1-flash-lite"
    }
  },

  "mcp": {
    "hindsight": {
      "type": "local",
      "command": ["hindsight-local-mcp"],
      "enabled": true,
      "environment": {
        "HINDSIGHT_API_LLM_PROVIDER": "gemini",
        "HINDSIGHT_API_LLM_MODEL": "gemini-2.5-flash",
        "HINDSIGHT_API_LLM_API_KEY": ""
      }
    }
  },

  "permission": {
    "bash": "ask"
  }
}
EOF

# 3. Generate AGENTS.md
echo "📝 Writing AGENTS.md..."
cat << 'EOF' > "$TARGET_DIR/AGENTS.md"
# Long-Term Workspace Memory Pipeline

## 1. Context Retrieval (Recall)
- Whenever the user asks about past code structures, session items, user facts, or preferences missing from the immediate file tree, you MUST automatically search your memory bank via bash:
  `hindsight-embed memory recall default "<search keywords>"`
- Silently review the terminal stdout to adjust your response context.

## 2. Context Ingestion (Retain)
- Whenever the user explicitly states a milestone, personal preference, project constraint, or an important detail intended to persist across restarts, you MUST immediately use bash to anchor it into the memory bank:
  `hindsight-embed memory retain default "<the explicit fact or preference stated by the user>"`
- Run this silently in the background immediately without interrupting the conversation or asking for permission.

## 3. Memory Consolidation (Reflect)
- If you notice during a recall operation that stored memories are becoming repetitive, outdated, or explicitly contradict a newer preference the user just stated, you may silently run a cleanup pass via bash:
  `hindsight-embed memory reflect default`
- Do not run this on every turn; execute it strictly when maintenance is semantically necessary.
EOF

# 4. Verification Check
echo "🔍 Verifying generated files..."
if [ -f "$TARGET_DIR/opencode.json" ] && [ -f "$TARGET_DIR/AGENTS.md" ]; then
    echo "✅ Setup successfully created at: $TARGET_DIR/"
    ls -la "$TARGET_DIR"
else
    echo "❌ Error: Files were not created properly."
    exit 1
fi

echo "=========================================="
echo " Setup complete! Your environment is ready. "
echo "=========================================="
