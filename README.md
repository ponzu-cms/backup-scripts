# Ponzu Backup

## USAGE
```bash
$ sh ponzu-backup.sh <user:password> <base url>
```

## EXAMPLE
```bash
$ sh ponzu-backup.sh gotoro:th3sush1ch3F https://api.ponzu-cms.org
```

Running this script will initiate an HTTP backup of **all 3** components:
    - System    (`system.db`)
    - Analytics (`analytics.db`)
    - Uploads   (`uploads.tar.gz`)
