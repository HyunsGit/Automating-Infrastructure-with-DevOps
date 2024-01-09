#!/bin/bash
function_value="U54"
var1="TMOUT"
config="/etc/profile"
list="1"

function U54 {
    for i in $list 
    do
    if [ $(sudo grep -ic "$var1" "$config") -eq 0 ]
    then
        sudo bash -c 'cat << EOF >> /etc/profile
TMOUT=300
export TMOUT
EOF'
        else
            break
        fi
    done      
}
$function_value

