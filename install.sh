#!/usr/bin/env bash
# 将仓库中的配置文件软链接到各软件的实际配置路径。
# 可重复执行；目标已是正确链接则跳过，已存在的普通文件会先备份为 *.bak。
set -euo pipefail

repo="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
config="${XDG_CONFIG_HOME:-$HOME/.config}"

# "仓库内路径:目标路径"，新增软件时在此追加一行
links=(
  "starship/starship.toml:$config/starship.toml"
  "helix/config.toml:$config/helix/config.toml"
  "fastfetch/config.jsonc:$config/fastfetch/config.jsonc"
)

for entry in "${links[@]}"; do
  src="$repo/${entry%%:*}"
  dst="${entry#*:}"

  if [[ -L "$dst" && "$(readlink "$dst")" == "$src" ]]; then
    echo "skip   $dst"
    continue
  fi

  mkdir -p "$(dirname "$dst")"
  if [[ -e "$dst" || -L "$dst" ]]; then
    mv "$dst" "$dst.bak"
    echo "backup $dst -> $dst.bak"
  fi
  ln -s "$src" "$dst"
  echo "link   $dst -> $src"
done
