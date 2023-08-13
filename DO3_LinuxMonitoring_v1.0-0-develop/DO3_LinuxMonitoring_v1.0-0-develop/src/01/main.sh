#!/bin/bash

if [ $# -ne 1 ]
then
        echo "Attention : need exactly one argument!"
else
        ./check_arg.sh $1
fi

: '
$# - Оболочка bash предоставляет для этого специальную переменную. 
     А именно, переменная $# содержит количество параметров, переданных сценарию при вызове.

n1 -eq n2 - Возвращает истинное значение, если n1 равно n2.
n1 -ge n2 - Возвращает истинное значение, если n1 больше или равно n2.
n1 -gt n2 - Возвращает истинное значение, если n1 больше n2.
n1 -le n2 - Возвращает истинное значение, если n1 меньше или равно n2.
n1 -lt n2 - Возвращает истинное значение, если n1 меньше n2.
n1 -ne n2 - Возвращает истинное значение, если n1 не равно n2.
'

chmod +x ./check_arg.sh