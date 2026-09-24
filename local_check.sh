#!/bin/sh

# 使い方: ./find_backups.sh <username>
if [ -z "$1" ]; then
    echo "Usage: $0 <username>"
    exit 1
fi

USER="$1"

# チェック対象のディレクトリ一覧
TARGETS="
/tmp/
/var/tmp/
/dev/shm/
/var/www/html/backup/
/var/www/html/backups/
/var/www/html/bak/
/var/www/html/old/
/root/
/home/$USER/
/home/$USER/backups/
/var/backups/
/opt/backup/
/mnt/
/media/
/home/$USER/public_www #nostromo
"

for dir in $TARGETS; do
    if [ -d "$dir" ]; then
        echo "========================================"
        echo "[+] Directory: $dir"
        echo "========================================"
        ls -la "$dir" 2>/dev/null
        echo ""
    fi
done
