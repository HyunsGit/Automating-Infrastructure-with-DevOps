#!/bin/bash

declare -a USER_LIST=(sysadm security deploy frodo neo)
# 비밀번호 변경 할 부분 하나씩 작성
declare -a USER_PASSWORD=(Tltmxpa! Qhdks! Roqkf! Qheh! Rlxk!)


echo "Change Password User" && sleep 1
for((i=0; i<${#USER_LIST[*]};i++))
do
    echo "${USER_LIST[i]}":"${USER_PASSWORD[i]}" | chpasswd
done
echo "Done." && sleep 1