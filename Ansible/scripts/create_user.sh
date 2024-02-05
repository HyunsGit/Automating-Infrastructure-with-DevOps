#!/bin/bash

declare -a USER_LIST=(sysadm security deploy frodo neo)
declare -a USER_UID=(200 201 202 203 204)

declare -a GROUP_LIST=(dktadm dktdev)
declare -a GROUP_UID=(200 201)

declare -a ADMIN_LIST=(sysadm security)

INITIAL_PASSWORD=Dktechin123#


# sshd Setup
echo "Setup PasswordAuthentication" && sleep 1
sudo sed -i 's/PasswordAuthentication\ no/PasswordAuthentication\ yes/g' /etc/ssh/sshd_config || exit 1
echo "Done." && sleep 1



echo "Setup motd Banner" && sleep 1
echo "Banner /etc/issue" | sudo tee -a /etc/ssh/sshd_config || exit 1
echo "Done." && sleep 1


echo "Setup AllowUsers" && sleep 1

# AllowUsers 설정한 계정만 ID/PW 접근 가능함.
# ubuntu pem키 로그인
echo "AllowUsers ${USER_LIST[@]} ubuntu" | sudo tee -a /etc/ssh/sshd_config || exit 1
sudo systemctl restart sshd && sudo systemctl status sshd | cat
echo "Done." && sleep 1



echo "Setup Banner" && sleep 1
sudo cat > /etc/issue << EOF
----------   ----    ---- ------------ ------------ ------------ ----    ---- --------  ----    ----
************ ****   ****  ************ ************ ************ ****    **** ********  *****   ****
--        -- ----  ----   ------------ ----         ---          ----    ----   ----    ------  ----
**        ** *********        ****     ************ ***          ************   ****    ************
--        -- ---------        ----     ------------ ---          ------------   ----    ------------
**        ** ****  ****       ****     ****         ***          ****    ****   ****    ****  ******
------------ ----   ----      ----     ------------ ------------ ----    ---- --------  ----   -----

####################################################################################################

                            인가되지 않은 사용자의 접근 시 처벌을 받을 수 있습니다.
                                      지정된 이용자만 접근 부탁드립니다.
                                            @dktechin.com

####################################################################################################
EOF
echo "Done." && sleep 1


# Setup Group
echo "Setup Add Groups" && sleep 1
for GROUP in ${GROUP_LIST[@]};
do
    sudo groupadd $GROUP || exit 1
done
echo "Done." && sleep 1



# Setup Group GID
echo "Setup Group UID" && sleep 1
for((i=0; i<${#GROUP_UID[*]};i++))
do
    groupmod -g ${GROUP_UID[i]} ${GROUP_LIST[i]} || exit 1
done
echo "Done." && sleep 1



# Setup User
echo "Setup Add Users" && sleep 1
for USER in ${USER_LIST[@]};
do
    if [[ $USER == ${ADMIN_LIST[0]} || $USER == ${ADMIN_LIST[1]} ]];
    then
        sudo useradd $USER -g ${GROUP_LIST[0]} -m -s /bin/bash && \
        sudo touch /home/$USER/.hushlogin || exit 1
        echo "$USER":"$INITIAL_PASSWORD" | sudo chpasswd
    else
        sudo useradd $USER -g ${GROUP_LIST[1]} -m -s /bin/bash && \
        sudo touch /home/$USER/.hushlogin || exit 1
        echo "$USER":"$INITIAL_PASSWORD" | sudo chpasswd 
    fi
done
echo "Done." && sleep 1



# Setup UID
echo "Setup User UID" && sleep 1
for((i=0; i<${#USER_LIST[*]}; i++))
do
    usermod -u ${USER_UID[i]} ${USER_LIST[i]} || exit 1
done
echo "Done." && sleep 1



# Setup User sudo permission
echo "Setup Admin User" && sleep 1
for ADMIN in ${ADMIN_LIST[@]};
do
    echo "$ADMIN  ALL=(ALL) NOPASSWD:ALL" | sudo tee -a /etc/sudoers || exit 1
done
echo "Done." && sleep 1