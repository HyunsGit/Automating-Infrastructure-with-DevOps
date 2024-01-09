#!/bin/bash
function_value="U46"
pminlen="#PASS_MIN_LEN"
pminlen_pass="PASS_MIN_LEN 8"
login_defs="/etc/login.defs"


function U46 {
if [ $(grep -ic "$pminlen" "$login_defs") -eq 1 ]
then
sudo sed -i "s/$pminlen/$pminlen_pass/" "$login_defs"
fi
}
$function_value
