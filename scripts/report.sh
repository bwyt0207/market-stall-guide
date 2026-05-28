#!/bin/bash
# report.sh — 產生本週內容生產進度報告

set -e

ROOT="$(dirname "$0")/.."

echo "=== Market Stall Guide — 週報 $(date +%Y-%m-%d) ==="
echo ""

echo "--- 文章產出 ---"
TOTAL=$(find "$ROOT/articles" -name "*.md" | wc -l | tr -d ' ')
OPTIMIZED=$(find "$ROOT/articles" -name "*_optimized.md" | wc -l | tr -d ' ')
DRAFT=$((TOTAL - OPTIMIZED))
echo "草稿：$DRAFT 篇"
echo "已優化（待發布）：$OPTIMIZED 篇"
echo "合計：$TOTAL 篇"
echo ""

echo "--- 關鍵字庫 ---"
KW=$(grep -c '|' "$ROOT/data/keywords.md" 2>/dev/null || echo 0)
echo "關鍵字紀錄行數：$KW"
echo ""

echo "--- 近期文章列表 ---"
find "$ROOT/articles" -name "*.md" | sort -r | head -10 | while read f; do
  echo "  $(basename $f)"
done

echo ""
echo "詳細成效請查看 data/tracker.md"
