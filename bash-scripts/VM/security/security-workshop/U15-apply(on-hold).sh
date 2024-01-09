#!/bin/bash

sudo find / -xdev -perm -2 -ls | grep -v 'lrwxrwxrwx' | grep -v 'srwxrwxrwx' | grep -v 'srw-rw-rw-' | awk '{print $11}' > $HOME/temp_file.txt

for i in $(cat /home/ubuntu/temp_file.txt)
do
sudo rm -rf "$i"
done
