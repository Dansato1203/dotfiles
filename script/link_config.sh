#! /bin/bash

set -eux

readonly BASE_DIR="$PWD/conf"
readonly CONFIG_DIR="$HOME/.config"

readonly VIM_DIR="$HOME/.vim"
if [[ -d "$VIM_DIR" ]]; then
  unlink "$VIM_DIR" || true
  rm -rf "$VIM_DIR" || true
fi

for dir in "$BASE_DIR/".*; do
  # . ディレクトリはスキップ
  base="$(basename "$dir")"
  if [[ "$base" =~ ^(\.config|\.{1,2})$ ]]; then
    continue
  fi

  # .gitconfigはシンボリックリンクしない
  if [[ "$base" =~ ^\.gitconfig$ ]]; then
    continue
  fi

  ln -sfn "$dir" "$HOME/"
done

for dir in "$BASE_DIR/".vim/.*; do
  if [[ "$dir" = .vimrc ]]; then
    ln -sfn "dir" "$HOME/"
  fi
done

# .gitconfigはコピーで配置
cp "$BASE_DIR/.gitconfig" "$HOME/"
