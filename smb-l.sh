while read -r user; do
    echo "=== $user ==="
    smbclient -L //TARGET -U "$user"%"" 2>/dev/null
done < users.txt
