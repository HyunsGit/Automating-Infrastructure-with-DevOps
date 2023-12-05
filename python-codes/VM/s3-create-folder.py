#!/usr/bin/python3

import os
import requests
from dotenv import load_dotenv
from pathlib import Path

class color:
   GREEN = '\033[1;32;48m'
   END = '\033[1;37;0m'

dotenv_path = Path('/object-storage-api/.env')
load_dotenv(dotenv_path=dotenv_path)

TOKEN = os.getenv('TOKEN')
PROJECT_ID = os.getenv('PROJECT_ID')
BUCKET = input(color.GREEN + "Enter Bucket Name: " + color.END)
FOLDER = input(color.GREEN + "Enter Folder Name: " + color.END)

def createFolder():
    headers = {
        'X-Auth-Token': TOKEN,
        'Content-Type': 'application/directory', 
        'X-Object-Meta-Company': 'kakao enterprise'
    }
    res = requests.put('https://objectstorage.kr-central-1.kakaoi.io/v1/'+PROJECT_ID+'/'+BUCKET+'/'+FOLDER, headers=headers)

createFolder()