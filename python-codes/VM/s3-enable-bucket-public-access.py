#!/usr/bin/python3

import os
import requests
import json
from dotenv import load_dotenv
from pathlib import Path

class color:
   GREEN = '\033[1;32;48m'
   END = '\033[1;37;0m'

dotenv_path = Path('/object-storage-api/.env')
load_dotenv(dotenv_path=dotenv_path)

TOKEN = os.getenv('TOKEN')
BUCKET_NAME = input(color.GREEN + "Enter bucket name to apply bucket policy 'public access:read only'" + color.END)

def manageBucketAccess():
    headers = {
        'X-Auth-Token': TOKEN,
        'Content-Type': 'application/json'
    }
    data = {
        "name": BUCKET_NAME, 
        "acl": {
            "public": "read-only"
        }
    }

    res = requests.post('https://objectstorage.kr-central-1.kakaoi.io/v1_ext/bucket/'+BUCKET_NAME, headers=headers, data=json.dumps(data))
    print(res.status_code)

manageBucketAccess()