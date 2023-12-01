#!/usr/bin/env python

import os
import requests
from dotenv import load_dotenv
from pathlib import Path
#from os import environ

dotenv_path = Path('/home/ubuntu/.local/bin/.env')
load_dotenv(dotenv_path=dotenv_path)

TOKEN = os.getenv('TOKEN')
#TOKEN = environ.get('TOKEN')
print(TOKEN)


#print(os.environ)
#export="export TOKEN="
#os.environ['BETA_TOKEN']=()
x_subject_token=os.environ.get('TOKEN')
#token=open('/NFS/log/X-Subject-Token.txt', 'r')
#print(token.read(2048))
#story_token=(token.read(2048))
#print(x_subject_token)
print("---------------------------------")
#print(story_token)


def uploadFileBeta():
    headers = {
        'X-Auth-Token': TOKEN,
        'Content-Type': 'text/plain'
    }
    data = open('/NFS/log/X-Subject-Token.txt', 'rb')
    res = requests.put('https://objectstorage.kr-central-1.kakaoi.io/v1/f777e1a37017441e9d188f72c0b8c505/s3-create-bucket-api/test-folder/x-subject-token-1129', headers=headers, data=data)
    data.close()

uploadFileBeta()



#def uploadFile():
#    headers = {
#        'X-Auth-Token': x_subject_token,
#        'Content-Type': 'text/plain'
#    }
#    data = open('/NFS/log/X-Subject-Token.txt', 'rb')
#    res = requests.put('https://objectstorage.kr-central-1.kakaoi.io/v1/f777e1a37017441e9d188f72c0b8c505/s3-create-bucket-api/test-folder/x-subject-token-1129', headers=headers, data=data)
#    data.close()

#uploadFile()
