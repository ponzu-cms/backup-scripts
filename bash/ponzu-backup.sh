#!/bin/bash
set -e

# check for require arguments
if [ -z "$1" ] || [ -z "$2" ]; then
	echo "Ponzu Backup"
	echo "USAGE"
	echo "$ sh ponzu-backup.sh <user:password> <base url>"
	echo ""
	echo "EXAMPLE"
	echo "$ sh ponzu-backup.sh gotoro:th3sush1ch3F https://api.ponzu-cms.org"
	echo ""
	echo "Running this script will initiate an HTTP backup of all 3 components:"
	echo "  - System    (system.db)"
	echo "  - Analytics (analytics.db)"
	echo "  - Uploads   (uploads.tar.gz)"

	exit 1
fi

now=$(date +%N)

mkdir ponzu_bak_$now

cd ponzu_bak_$now

echo "backup sequence started."

# run upload backup
echo "requesting backup: uploads"
curl --user $1 "$2/admin/backup?source=uploads" > uploads.tar.gz
echo "complete."

# run system db backup
echo "requesting backup: system"
curl --user $1 "$2/admin/backup?source=system" > system.db
echo "complete."

# run analytics db backup
echo "requesting backup: analytics"
curl --user $1 "$2/admin/backup?source=analytics" > analytics.db
echo "complete."

if [ ! -e uploads.tar.gz ] || [ ! -e system.db ] || [ ! -e analytics.db ]; then
	echo "backup failed. preserving existing backups."
	exit 1
else 
	rm -rf ../backups/*
fi

cd ..

mv ponzu_bak_$now backups/

echo "backup completed sucessfully" && ls -lh backups/ponzu_bak_$now
echo ""
