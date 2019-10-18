# log-archive
Shell script/Utility to archive log directory.\
This script should be scheduled using cron.

__Command:__ 0 0 * * * <GIT_REPO_LOCATION>/backup_log.sh <LOG_FOLDER_LOCATION> >> cron.log 2>&1

__<GIT_REPO_LOCATION>__ is where the project log-archive has been cloned.\
__<LOG_FOLDER_LOCATION>__ is where the log files are available that needs to be archived. The script will create a archive folder inside the __<LOG_FOLDER_LOCATION>__ and stores the archives of the log files.

The above command can be configured via crontab.\
This will schedule the backup script to run everyday at 12:00AM
