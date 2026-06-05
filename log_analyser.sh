#!/bin/bash


<< usage

this file is use to analyze log from bing log file

usage

log_filter() {

        echo "Total line count is: $(wc -l < $filename)"
        echo "Total authentication failure $(awk ' /authentication failure/ {print $0}' $filename | wc -l)"
        echo "Total session closed $(awk ' /session closed/ {print $0}' $filename | wc -l)"
        echo "Total session opened for user cyrus $(awk '/session opened for user cyrus/ {print $0}' $filename | wc -l)"

}


read -p "Enter filename:" filename

if [ -f $filename ]; then
	log_filter
else
	echo " $filename doesnot exist"
	
fi	
	



#log_filter() {
#
#	echo "Total line count is: $(wc -l < $filename)"
#	echo "Total authentication failure $(awk ' /authentication failure/ {print $0}' $filename | wc -l)"
#	echo "Total session closed $(awk ' /session closed/ {print $0}' $filename | wc -l)"
#	echo "Total session opened for user cyrus $(awk '/session opened for user cyrus/ {print $0}' $filename | wc -l)"		
#
#}

#log_filter
