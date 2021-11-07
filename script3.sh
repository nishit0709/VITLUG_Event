#!/bin/bash

#if doesn't exist then create folder
if [ ! -d "./$2" ] 
then 
    mkdir "$2";
fi

#change pwd to folder and unzip in a temp folder
cd "$2"
unzip "../$1" -d "temp"

for file in temp/*; do
    IFS='_' read -ra arr <<< $file #Read file date
    IFS='-' read -ra folder <<< ${arr[7]} #Read File Month
    if [ ! -d "./${folder[1]}" ] 
    then 
        mkdir "${folder[1]}"
    fi
    mv $file ${folder[1]}/"${folder[0]}_${folder[1]}_${folder[2]}_${file:5}" #move from temp folder to destination folder with file rename
done
rm -r temp ../$1 #delete temp folder and the zip file
exit