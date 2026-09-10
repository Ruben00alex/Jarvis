#!/bin/sh
set -eu
TASK_TMP=$(mktemp -d)
cd "$TASK_TMP"
curl -fsSLO https://nodejs.org/dist/v24.21.0/node-v24.21.0-linux-x64.tar.xz
printf '%s\n' 'fd8e59d5a511510f6a298afb548f18c7d2b1be404d8b4a27d94fbe49f56cb2d6  node-v24.21.0-linux-x64.tar.xz' | sha256sum -c -
sudo tar -xJf node-v24.21.0-linux-x64.tar.xz -C /opt
for binary in node npm npx corepack; do
  if [ -e "/opt/node-v24.21.0-linux-x64/bin/$binary" ]; then
    if [ ! -e "/usr/local/bin/$binary" ]; then
      sudo ln -s "/opt/node-v24.21.0-linux-x64/bin/$binary" "/usr/local/bin/$binary"
    fi
  fi
done
mkdir -p "$HOME/.local" "$HOME/code"
sudo apt-get update -qq
sudo env DEBIAN_FRONTEND=noninteractive NEEDRESTART_MODE=l apt-get install -y build-essential gh
/usr/local/bin/npm install --global --prefix "$HOME/.local" t3@latest @openai/codex@latest
export PATH="$HOME/.local/bin:/usr/local/bin:/usr/bin:/bin"
node --version
t3 --version
t3 service install --help
t3 pair --help
