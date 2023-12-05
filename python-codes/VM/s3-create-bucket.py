#!/usr/bin/python3

import os
import json
import requests
from dotenv import load_dotenv
from pathlib import Path

class color:
   PURPLE = '\033[1;35;48m'
   CYAN = '\033[1;36;48m'
   BLUE = '\033[1;34;48m'
   GREEN = '\033[1;32;48m'
   YELLOW = '\033[1;33;48m'
   RED = '\033[1;31;48m'
   END = '\033[1;37;0m'

dotenv_path = Path('/object-storage-api/.env')
load_dotenv(dotenv_path=dotenv_path)

TOKEN = os.getenv('TOKEN')
BUCKET = input(color.GREEN + "Enter bucket name: " + color.END)

def createBucket():
    headers = {
        'X-Auth-Token': TOKEN,
        'Content-Type': 'application/json'
    }
    data = {
        "name": BUCKET, 
        "type": "hot", 
        "use_encryption": False
    }

    res = requests.put('https://objectstorage.kr-central-1.kakaoi.io/v1_ext/bucket', headers=headers, data=json.dumps(data))
    print(res.status_code)

createBucket()