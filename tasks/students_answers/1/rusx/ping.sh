#!/bin/bash

# i = 1 - Есть соединение
# i = 0 - Соединение отсутствует 
i=1
while true;
do
	ping -c1 8.8.8.8
	result=$?
	echo "$result" "$i"

		if [[ "$result" -eq 0 && "$i" -eq 0 ]];
		then
    echo "$(date +%d-%m-%y) - Соединение потеряно в $(date +%H:%M)" >> journal.txt
    echo "$(date +%d-%m-%y) - Соединение восстановлено в $(date +%H:%M)"
    i=1
			elif [[ "$result" -ne 0 && "$i" -eq 1 ]];
			then
    echo "$(date +%d-%m-%y) - Соединение восстановлено в $(date +%H:%M)" >> journal.txt
    echo "$(date +%d-%m-%y) - Соединение потеряно в $(date +%H:%M)"
    i=0
fi
sleep 10
done
