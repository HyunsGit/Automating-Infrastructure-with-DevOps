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
                "id": "'60178ebe559b4875bc0ef5f55b3b60af'",
                "secret": "'GQqvm10mfViScBVq3M9ps5oj-mKPYhjuqOGc6n-kaaBYr3OY1ijmhbgheerb5Y5r_VC_k3ac6U6DmDKgswXgJA'"
            }
        }
    }
}' | grep x-subject-token | awk -v RS='\r\n' '{print $2}')
sed '$d' -i /object-storage-api/.env
echo "TOKEN=\"$TOKEN\"" >> /object-storage-api/.env