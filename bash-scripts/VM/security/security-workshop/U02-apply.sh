#!/bin/bash
function_value="U02"
pw_pol="/etc/security/pwquality.conf"
pw_pol_config_list="lcredit ucredit dcredit ocredit minlen difok"
lc="# lcredit = 0"
uc="# ucredit = 0"
dc="# dcredit = 0"
oc="# ocredit = 0"
ml="# minlen = 8"
df="# difok = 1"
lc_m="lcredit = -1"
uc_m="ucredit = -1"
dc_m="dcredit = -1"
oc_m="ocredit = -1"
ml_m="minlen = 8"
df_m="difok = N"

sudo apt-get install libpam-pwquality -y

function U02 {
    for i in $pw_pol_config_list
      do
        for j in $pw_pol_config_list
          do
            if grep -q "$lc" $pw_pol 
              then
                sudo sed -i "s/$lc/$lc_m/g" $pw_pol
                break
            elif grep -q "$uc" $pw_pol
              then
                sudo sed -i "s/$uc/$uc_m/g" $pw_pol
                break
            elif grep -q "$dc" $pw_pol
              then
                sudo sed -i "s/$dc/$dc_m/g" $pw_pol
                break
            elif grep -q "$oc" $pw_pol;
              then
                sudo sed -i "s/$oc/$oc_m/g" $pw_pol
                break
            elif grep -q "$ml" $pw_pol
              then
                sudo sed -i "s/$ml/$ml_m/g" $pw_pol
                break
            elif grep -q "$df" $pw_pol
              then
                sudo sed -i "s/$df/$df_m/g" $pw_pol
                break
            fi
        done
    done
}
$function_value

sudo cp /etc/pam.d/common-password /etc/pam.d/common-password-back

sudo bash -c 'cat << ZZZ > /etc/pam.d/common-password
password        requisite                       pam_pwquality.so retry=3 minlen=8 lcredit=-1 ucredit=-1 dcredit=-1 ocredit=-1
password        [success=1 default=ignore]      pam_unix.so obscure use_authtok try_first_pass yescrypt
password        requisite                       pam_deny.so
password        required                        pam_permit.so
ZZZ'