#!/bin/bash

# get project variable
PROJECT_ID=$(curl -s -X POST https://iam.kakaoi.io/identity/v3/auth/tokens -H "Content-Type: application/json" -d \
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
}' | jq -r ".token.project.id")
echo $PROJECT_ID