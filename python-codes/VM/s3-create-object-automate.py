#!/usr/bin/python3

import os
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
PROJECT_ID = os.getenv('PROJECT_ID')
FILE = os.getenv('FILE')
BUCKET_NAME = os.getenv('BUCKET_NAME')
FOLDER_NAME = os.getenv('FOLDER_NAME')
AS_FILE = os.getenv('AS_FILE')


def uploadFile():
    headers = {
        'X-Auth-Token': TOKEN,
        'Content-Type': 'text/plain'
    }
    data = open(FILE, 'rb')
    res = requests.put('https://objectstorage.kr-central-1.kakaoi.io/v1/'+PROJECT_ID+'/'+BUCKET_NAME+'/'+FOLDER_NAME+'/'+FILE_NAME, headers=headers, data=data)
    data.close()

uploadFile()
