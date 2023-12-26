#!/bin/bash

# 対象ディレクトリ（ここではカレントディレクトリを指定）
TARGET_DIR="."

# Prettier を適用したいファイルの拡張子を指定（例：.js, .jsx, .ts, .tsx）
FILE_EXTENSIONS=("js" "jsx" "ts" "tsx")

# Prettier コマンド（ローカルにインストールされた Prettier を使用）
PRETTIER_CMD="./node_modules/.bin/prettier"

# ファイル拡張子ごとにループし、Prettier を適用
for ext in "${FILE_EXTENSIONS[@]}"; do
    find $TARGET_DIR -type d \( -path "*/node_modules" -o -path "*/.next" \) -prune -o -name "*.$ext" -exec $PRETTIER_CMD --write {} \;
done
