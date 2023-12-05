#!/usr/bin/python3

import os
import requests
from dotenv import load_dotenv
from pathlib import Path

dotenv_path = Path('/object-storage-api/.env')
load_dotenv(dotenv_path=dotenv_path)

ACCESS_KEY = os.getenv('ACCESS_KEY')
ACCESS_SECRET_KEY = os.getenv('ACCESS_SECRET_KEY')

# Define new data to create
credentials = {
    "auth": {
        "identity": {
            "methods": [
                "application_credential"
            ],
            "application_credential": {
                "id": ACCESS_KEY,
                "secret": ACCESS_SECRET_KEY
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