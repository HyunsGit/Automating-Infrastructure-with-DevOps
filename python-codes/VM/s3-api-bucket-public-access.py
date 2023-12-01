#!/usr/bin/env python

import requests
import json

def manageBucketAccess():
    headers = {
        'X-Auth-Token': 'gAAAAABlXrF82p-pRRzRqyp84AbqCNYBkGXAVLE8CQN-Ci0ySmzMJm1NJpsypWsNBYS3ZqgU93b0NxdrUun8XpWJXbGdT1NNySXzfJtyCw7Oo1bz02rNaIEZbwe-1XtkucauSf6gWIq3zOa8nj9lu8Vofs3N99L4_RMZMedMxQvyZAxgI_jE0bfix_YS0DHNvEfxOKBu4wN8',
        'Content-Type': 'application/json'
    }
    data = {
        "name": "s3-create-bucket-api", 
        "acl": {
            "public": "read-only"
        }
    }

    res = requests.post('https://objectstorage.kr-central-1.kakaoi.io/v1_ext/bucket/s3-create-bucket-api', headers=headers, data=json.dumps(data))
    print(res.status_code)

manageBucketAccess()