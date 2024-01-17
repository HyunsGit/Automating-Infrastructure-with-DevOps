# BEGIN ANSIBLE MANAGED BLOCK
#!/bin/bash
publicIP=`wget http://ipecho.net/plain -O - -q ; echo 2> /dev/null`
TotalPMem=`free -m | grep -v total | grep -v Swap | awk '{print $2}'`
UsingPMem=`free -m | grep -v total | grep -v Swap | awk '{print $3}'`
UsingPMemPer=`expr \( ${UsingPMem} \* 100 \/ ${TotalPMem} \)`
TotalVMem=`free -m | grep -v total | grep -v Mem | awk '{print $2}'`
UsingVMem=`free -m | grep -v total | grep -v Mem | awk '{print $3}'`
UsingVMemPer=`expr \( ${UsingVMem} \* 100 \/ ${TotalVMem} \)`
TotalHDD=`df -h | grep -w vda1 | awk '{print $2}'`
UsingHDD=`df -h | grep -w vda1 | awk '{print $3}'`
UsingHDDPer=`df -h | grep -w vda1 | awk '{print $5}'`

#color
W="\033[47;30m"
YU="\033[43;31m"
Y="\033[1;33m"
R="\033[43;31m"
G="\033[0;32m"
E="\033[0m"
B="\033[0;34m"
M="\033[0;35m"
C="\033[0;36m"

echo "=================================================================================="
echo "||"
printf "||   ${Y}DKTECHIN ${M}카엔IDC팀 TAM의 ${G}관리 대상 서버${E}입니다.\n||\n"
printf "||    = ${C}작업 환경${E} =\n"
echo "||        배포판 정보    : `cat /etc/issue | awk '{print $1,$2,$3}'`"
echo "||        커널 정보    : `uname -r`"
echo "||        메모리 사용량    : ${UsingPMem}M / ${TotalPMem}M (${UsingPMemPer}%)"
echo "||        SWAP 사용량    : ${UsingVMem}M / ${TotalVMem}M (${UsingVMemPer}%)"
echo "||        HDD 사용량    : ${UsingHDD} / ${TotalHDD} (${UsingHDDPer})"
echo "||"
printf "||    = ${C}기타 정보${E} =\n"
echo "||        마지막 재부팅     : `uptime -s`"
echo "||        공인 IP     : ${publicIP}"
echo "||"
printf "||    * ${YU}필요한 패키지가 설치되지 않은 경우 TAM에게 알려주세요.${E}\n"
echo "||"
printf "||                        ${B}last modified : 240116-hans${E}\n"
echo "||"
echo "=================================================================================="
# END ANSIBLE MANAGED BLOCK