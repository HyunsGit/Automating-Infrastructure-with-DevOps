#!/bin/bash

# get token variable
TOKEN=$(curl -s -X POST -i https://iam.kakaoi.io/identity/v3/auth/tokens -H "Content-Type: application/json" -d \
'{
    "auth": {
        "identity": {
            "methods": [
                "application_credential"
            ],
            "application_credential": {
                "id": "'"$ACCESS_KEY"'",       
                "secret": "'"$ACCESS_SECRET_KEY"'"
            }
        }
    }
}' | grep x-subject-token | awk -v RS='\r\n' '{print $2}')
sed '$d' -i /object-storage-api/.env
echo "TOKEN=\"$TOKEN\"" >> /object-storage-api/.env