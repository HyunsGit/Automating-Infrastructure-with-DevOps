#!/bin/bash
function_value="U48"
pmind="^PASS_MIN_DAYS.*"
pmind_pass="PASS_MIN_DAYS 1"
config="/etc/login.defs"

function U48 {
if [ $(grep -ic "$pmind" "$config") -eq 1 ]
then
sudo sed -i "s/$pmind/$pmind_pass/" "$config"
fi
}
$function_value
