#!/usr/bin/env python

import requests

def createFolder():
    headers = {
        'X-Auth-Token': 'gAAAAABlXrF82p-pRRzRqyp84AbqCNYBkGXAVLE8CQN-Ci0ySmzMJm1NJpsypWsNBYS3ZqgU93b0NxdrUun8XpWJXbGdT1NNySXzfJtyCw7Oo1bz02rNaIEZbwe-1XtkucauSf6gWIq3zOa8nj9lu8Vofs3N99L4_RMZMedMxQvyZAxgI_jE0bfix_YS0DHNvEfxOKBu4wN8',
        'Content-Type': 'application/directory', 
        'X-Object-Meta-Company': 'kakao enterprise'
    }
    res = requests.put('https://objectstorage.kr-central-1.kakaoi.io/v1/f777e1a37017441e9d188f72c0b8c505/s3-create-bucket-api/test-folder', headers=headers)

createFolder()