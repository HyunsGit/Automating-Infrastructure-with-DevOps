#!/bin/bash
function_value="U47"
pmaxd="^PASS_MAX_DAYS.*"
pmaxd_pass="PASS_MAX_DAYS 90"
config="/etc/login.defs"


function U47 {
if [ $(grep -ic "$pmaxd" "$config") -eq 1 ]
then
sudo sed -i "s/$pmaxd/$pmaxd_pass/" "$config"
fi
}
$function_value
