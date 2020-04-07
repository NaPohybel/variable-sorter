#!/bin/bash
#loop
zero=0
while IFD= read -r variable
do
        context=$(awk "/^$variable$/,0" variable.fix | sed "1 d") #get all lines after checked $variable line
        repeats=$(echo $context | grep -c "$variable") #check if there are any repetitions in the $context
        if [ $repeats -gt $zero ] #if there are repetitions, delete the line and write it to the end of file
        then
                sed "/^$variable$/d" variable.fix
                echo $variable >> variable.fix
        fi
done < variable.fix
mv variable.fixed
