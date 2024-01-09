#!/bin/bash

sudo cp /etc/pam.d/common-auth /etc/pam.d/common-auth-back
sudo cp /etc/pam.d/common-account /etc/pam.d/common-account-back

sudo bash -c 'cat << ZZZ > /etc/pam.d/common-auth
auth    required                        pam_faillock.so preauth audit silent deny=3 fail_interval=60 unlock_time=120
auth    [success=1 default=ignore]      pam_unix.so nullok
auth    [default=die]                   pam_faillock.so authfail audit deny=3 fail_interval=60 unlock_time=120
auth    sufficient                      pam_faillock.so authsucc audit deny=3 fail_interval=60 unlock_time=120
auth    requisite                       pam_deny.so
auth    required                        pam_permit.so
auth    optional                        pam_cap.so
ZZZ'

echo 'account    required pam_faillock.so' | sudo tee -a /etc/pam.d/common-account >/dev/null