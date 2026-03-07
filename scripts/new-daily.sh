#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TEMPLATE_PATH="$REPO_ROOT/模板/日志模板.md"

usage() {
  cat <<'USAGE'
用法:
  scripts/new-daily.sh                # 生成今天的日志文件
  scripts/new-daily.sh YYYY-MM-DD     # 生成指定日期的日志文件

示例:
  scripts/new-daily.sh
  scripts/new-daily.sh 2026-03-09
USAGE
}

if [[ "${1:-}" == "-h" || "${1:-}" == "--help" ]]; then
  usage
  exit 0
fi

INPUT_DATE="${1:-$(date +%F)}"

if ! [[ "$INPUT_DATE" =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}$ ]]; then
  echo "❌ 日期格式错误：$INPUT_DATE（应为 YYYY-MM-DD）" >&2
  exit 1
fi

YEAR="${INPUT_DATE:0:4}"
TARGET_DIR="$REPO_ROOT/日志/$YEAR"
TARGET_FILE="$TARGET_DIR/$INPUT_DATE.md"

if [[ ! -f "$TEMPLATE_PATH" ]]; then
  echo "❌ 模板不存在：$TEMPLATE_PATH" >&2
  exit 1
fi

mkdir -p "$TARGET_DIR"

if [[ -f "$TARGET_FILE" ]]; then
  echo "⚠️ 文件已存在：$TARGET_FILE"
  exit 0
fi

cp "$TEMPLATE_PATH" "$TARGET_FILE"
sed -i "1s/YYYY-MM-DD/$INPUT_DATE/" "$TARGET_FILE"

echo "✅ 已生成：$TARGET_FILE"
