# Ponzu Backup

## [Bash](https://github.com/ponzu-cms/backup-scripts/blob/master/bash/ponzu-backup.sh)
#### Usage
```bash
$ sh ponzu-backup.sh <user:password> <base url>
```

#### Example
```bash
$ sh ponzu-backup.sh gotoro:th3sush1ch3F https://api.ponzu-cms.org
```

Running this script will initiate an HTTP backup of **all 3** components:
  - System    (`system.db`)
  - Analytics (`analytics.db`)
  - Uploads   (`uploads.tar.gz`)

---

Please feel free to add your own platform/shell specific scripts here within a 
top-level directory describing the platform or shell in which the script should 
be run. Then add the usage/docs above this as shown in the `Bash` section.

Thanks!