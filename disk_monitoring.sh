#!/bin/bash


<< usage
this script is use to check disk uage and 
send alert if disk utilization is above 80%

crontab -e
inser line
* * * * * /home/azureadmin/shell_script/disk_monitoring.sh >> /home/azureadmin/shell_script/disk.log
close cron tab

cat disk.log or tail -f /home/azureadmin/shell_script/disk.log

usage


disk_utilization() {

df -h | awk 'NR==1 || NR==2 {print $1, $2, $3, $4, $5}'

disk_usage=$(df -h | awk 'NR==2 {print $5}'|tr -d '%')

echo "$disk_usage"

if [ "$disk_usage" -eq 7 ]; then
	echo "disk usage is 7 sending alert"
else
	echo "disk usage is below 7"

fi
}
disk_utilization
	
