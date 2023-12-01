#!/usr/bin/env python

import requests

# Define new data to create
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
post_response_json = post_response.json()

print("Status Code", post_response.status_code)
print(post_response_json)