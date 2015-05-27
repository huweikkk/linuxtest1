#!/bin/bash
logs_path="/usr/local/nginx/logs/"
DAYS=30
mv ${logs_path}access.log ${logs_path}access_$(date -d "yesterday" +"%Y%m%d%H%M%S").log
#mv ${logs_path}access.log ${logs_path}access_$(date +"%Y年%m月%d日%H时%M分%S秒星期%w").log
kill -USR1 `cat /usr/local/nginx/logs/nginx.pid`
find ${logs_path} -name "access_*.log" -type f -mtime +$DAYS -exec rm {} \;
