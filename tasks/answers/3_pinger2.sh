#!/bin/bash

# i = 1 - интернет есть
# i = 0 - интернета нет 
i=0
while true; do
# делаем пинг и перенаправляем вывод в никуда
ping -c1 8.8.8.8 &> /dev/null
result=$?
echo "$result" "$i"

date_now=$(date +%d-%m-%y)
time_now=$(date +%H:%M)

if [[ "$result" -eq 0 && "$i" -eq 0 ]];
then
    mes="$date_now - интеренет появлися в $time_now"
    echo "$mes" >> journal.txt
    echo "$mes"
    i=1
elif [[ "$result" -ne 0 && "$i" -eq 1 ]];
then
    mes="$date_now - интеренет пропал в $time_now"
    echo "$mes" >> journal.txt
    echo "$mes"
    i=0
fi
sleep 5
done
