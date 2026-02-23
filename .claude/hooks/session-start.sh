#!/bin/bash
set -euo pipefail

# Only run in remote (Claude Code on the web) environments
if [ "${CLAUDE_CODE_REMOTE:-}" != "true" ]; then
  exit 0
fi

# This is a static HTML project with no package manager.
# All dependencies are vendored or CDN-loaded — nothing to install.
echo "pokusy: static project, no dependencies to install."
