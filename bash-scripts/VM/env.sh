#!/bin/bash

# access key & access secret key variable
ACCESS_KEY="60178ebe559b4875bc0ef5f55b3b60af"
ACCESS_SECRET_KEY="GQqvm10mfViScBVq3M9ps5oj-mKPYhjuqOGc6n-kaaBYr3OY1ijmhbgheerb5Y5r_VC_k3ac6U6DmDKgswXgJA"

# bucket name & file variable
export BUCKET_NAME="centralized-log-via-NFS-1130"
export FILE="/NFS/log/X-Subject-Token.txt"
export AS_FILE="X-Subject-Token.txt"

# font color variable(bolded green & bolded blue)
export G="\033[1;32m"
export B="\033[1;34m"
export E="\033[0m"

# token variable
TOKEN=$(curl -s -X POST -i https://iam.kakaoi.io/identity/v3/auth/tokens -H "Content-Type: application/json" -d \
'{
    "auth": {
        "identity": {
            "methods": [
                "application_credential"
            ],
            "application_credential": {
                "id": "'${ACCESS_KEY}'",
                "secret": "'${ACCESS_SECRET_KEY}'"
            }
        }
    }
}' | grep x-subject-token | awk -v RS='\r\n' '{print $2}')
echo $TOKEN > /home/ubuntu/token.txt


# project variable
export PROJECT_ID=$(curl -s -X POST https://iam.kakaoi.io/identity/v3/auth/tokens -H "Content-Type: application/json" -d \
'{
    "auth": {
        "identity": {
            "methods": [
                "application_credential"
            ],
            "application_credential": {
                "id": "'${ACCESS_KEY}'",
                "secret": "'${ACCESS_SECRET_KEY}'"
            }
        }
    }
}' | jq -r ".token.project.id")

# list for access_key, access_secret_key, bucket_name and file
varName=("ACCESS_KEY:" "ACCESS_SECRET_KEY:" "BUCKET_NAME:" "FILE:" "AS_FILE:")
varEnv=("$ACCESS_KEY" "$ACCESS_SECRET_KEY" "$BUCKET_NAME" "$FILE" "$AS_FILE")

# for loop(ln. 49-50)
for ((i=0; i<"${#varName[@]}"; i++)) do
   echo -e "$G ${varName[i]}$E" "${varEnv[i]}"
done


# if statement(ln. 12-25)
if [ -z $TOKEN ]
then
    echo "TOKEN is null..."
else
    echo -e "$B TOKEN:$E" "$TOKEN" 
fi

# if statement(ln. 28-41)
if [ -z $PROJECT_ID ]
then
    echo " PROJECT_ID is null..."
else
    echo -e "$B PROJECT_ID:$E" "$PROJECT_ID"
fi
