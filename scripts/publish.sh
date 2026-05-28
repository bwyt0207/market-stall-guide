#!/bin/bash
# publish.sh — 自動發布文章至目標平台

set -e

ARTICLES_DIR="$(dirname "$0")/../articles"
TRACKER="$(dirname "$0")/../data/tracker.md"

echo "=== Market Stall Guide — Publisher ==="
echo "掃描待發布文章..."

# 找出所有 _optimized.md 文章
READY=$(find "$ARTICLES_DIR" -name "*_optimized.md" | sort)

if [ -z "$READY" ]; then
  echo "沒有待發布文章（需命名為 *_optimized.md）"
  exit 0
fi

echo "找到以下文章："
echo "$READY"
echo ""

# TODO: 接入實際發布 API（WordPress / Ghost / 自建平台）
# 範例佔位符：
for f in $READY; do
  TITLE=$(head -1 "$f" | sed 's/# //')
  DATE=$(date +%Y-%m-%d)
  echo "[$DATE] 發布: $TITLE"
  # curl -X POST "$PUBLISH_API" --data-binary @"$f" ...
done

echo ""
echo "發布完成。請更新 data/tracker.md 紀錄成效。"
