#!/usr/bin/env python


import requests
import json

def createBucket():
    headers = {
        'X-Auth-Token': 'gAAAAABlZpR7xoK0iejh6MWUVpuSMfCjX1wwPKAdaE1_UydEQ55hco7canb7-iU4LPpu7UlrUA0svMVMmtRP-rB4NfQ-46fry75bahGjVo3-I-GpYJPOh9TjzeX0FeBILHdgzNvHONDSe8zUIIzXXY_45Px-RpYKQXzOFwTngVxcpWaqREEQQ33U8csYPYrC8SGqm1PpZvK3',
        'Content-Type': 'application/json'
    }
    data = {
        "name": "s3-create-bucket-api-v2", 
        "type": "hot", 
        "use_encryption": False
    }

    res = requests.put('https://objectstorage.kr-central-1.kakaoi.io/v1_ext/bucket', headers=headers, data=json.dumps(data))
    print(res.status_code)

createBucket()