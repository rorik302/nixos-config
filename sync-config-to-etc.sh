#!/usr/bin/env bash
set -e

echo "Синхронизация ~/nixos-config -> /etc/nixos"
sudo rsync -av --delete ~/nixos-config/ /etc/nixos/
echo "Готово"
