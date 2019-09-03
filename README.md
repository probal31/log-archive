# log-archive
Shell script to archive log directory. This script should be scheduled using cron.

Command: 0 0 * * * <GIT_REPO_LOCATION>/backup_log.sh <LOG_FOLDER_LOCATION> >> cron.log 2>&1

The above command can be configured via crontab.
This will schedule the backup script to run everyday at 12:00AM

<GIT_REPO_LOCATION> is where the project log-archive has been cloned.
<LOG_FOLDER_LOCATION> is where the log files are available that needs to be archived. The script will create a archive folder inside the <LOG_FOLDER_LOCATION> and stores the archives of the log files.
