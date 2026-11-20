#!/bin/bash
set -e

# 1. Install npm-based coding agents
npm install -g @anthropic-ai/claude-code @github/copilot @opencode/cli

# 2. Install Herdr TUI binary (places binary in ~/.local/bin)
curl -fsSL https://herdr.dev/install.sh | sh

# 3. Ensure ~/.local/bin is in PATH for this session and future shells
export PATH="$HOME/.local/bin:$PATH"
if ! grep -q 'HOME/.local/bin' ~/.bashrc; then
  echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
fi

# 4. Install Herdr hooks/integrations for your agents
herdr integration install claude
herdr integration install copilot
herdr integration install opencode
