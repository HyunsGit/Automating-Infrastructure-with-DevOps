#!/usr/bin/env python

import requests
import sys

X_Subject_Token_Dir = "/object-storage-api/log/X-Subject-Token.txt"

# Define credential to create
credentials = {
    "auth": {
        "identity": {
            "methods": [
                "application_credential"
            ],
            "application_credential": {
                "id": "60178ebe559b4875bc0ef5f55b3b60af",
                "secret": "GQqvm10mfViScBVq3M9ps5oj-mKPYhjuqOGc6n-kaaBYr3OY1ijmhbgheerb5Y5r_VC_k3ac6U6DmDKgswXgJA"
            }
        }
    }
}
# The API endpoint to communicate with
url_post = "https://iam.kakaoi.io/identity/v3/auth/tokens"

# A POST request to the API
post_response = requests.post(url_post, json=credentials)

# Print the response JSON
#post_response_json = post_response.json()
#print(post_response_json)


# Extracting X-Subject-Token from the response headers
x_subject_token = post_response.headers.get('X-Subject-Token')
sys.stdout = open(X_Subject_Token_Dir, 'w')
print(x_subject_token)
sys.stdout.close()