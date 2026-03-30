#!/bin/bash

set -euo pipefail

# Install nginx if not present
if ! command -v nginx >/dev/null 2>&1; then
  sudo apt-get update -y
  sudo apt-get install nginx -y
fi

sudo systemctl start nginx || true
sudo systemctl enable nginx || true

cat <<'EOF' | sudo tee /var/www/html/index.html >/dev/null
<h1>This is created by terraform with nginx</h1>
EOF
