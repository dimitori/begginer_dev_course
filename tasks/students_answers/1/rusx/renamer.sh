#!/bin/bash
chmod +x ./renamer
# Изменение расширений в именах файлов текущего каталога.
# Первый аргумент - старое расширение
# Второй аргумент - новое расширение
#
#         ./script.sh old_extension new_extension
#
# Меняются только файлы, у который раширение = old_extension
# 
# при этом измененные файлы копируются в папку answer, а исходные остаются на месте
# Пример:
# Изменить все расширения *.jpg в именах файлов на *.gif
#          ./script.sh jpg gif


ARGS=2 # Ожидаемое число аргументов.
E_BADARGS=65 # Код завершения, если число аргументов меньше ожидаемого.

if [ $# -ne "$ARGS" ]
then
  echo "Порядок использования: `basename $0` old_extension new_extension"
  exit $E_BADARGS
fi

#очищаем содержимое папки answer
rm -rf answer/*

# Цикл прохода по списку имен файлов, имеющих расширение равное первому аргументу.
for filename in *
do
  # cp $filename answer/${filename%$1}$2
  echo "$filename"
done
 
exit 0
