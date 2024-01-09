#!/bin/bash
function_value="U01"
sshd_config="/etc/ssh/sshd_config"

prl_yes="PermitRootLogin yes"
prl_yes_cm="#PermitRootLogin yes"
prl_no="PermitRootLogin no"
prl_no_cm="#PermitRootLogin no"
prl_prohib="PermitRootLogin prohibit-password"
prl_prohib_cm="#PermitRootLogin prohibit-password"

function U01 {
#    if grep "$prl_yes\|$prl_yes_cm" <<< $inspect_sshd_config;
    if [ $(grep -ic "$prl_yes" "$sshd_config") -eq 1 ]
    then
        sudo sed -i "s/$prl_yes/$prl_no/g" "$sshd_config" || sudo sed -i "s/$prl_yes_cm/$prl_no/g" "$sshd_config"            
    elif [ $(grep -ic "$prl_prohib" "$sshd_config") -eq 1 ]
    then
        sudo sed -i "s/$prl_prohib_cm/$prl_no/g" "$sshd_config" || sudo sed -i "s/$prl_prohib/$prl_no/g" "$sshd_config"
    elif [ $(grep -ic "$prl_no_cm" "$sshd_config") -eq 1 ]
    then
        sudo sed -i "s/$prl_no_cm/$prl_no/g" "$sshd_config"
    else
        printf "$function_value Requirements fulfilled"
fi
}
$function_value