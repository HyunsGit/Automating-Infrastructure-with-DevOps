#!/usr/bin/env python

import os
from dotenv import load_dotenv
from pathlib import Path
from os import environ

dotenv_path = Path('/home/ubuntu/.local/bin/.senv')
load_dotenv(dotenv_path=dotenv_path)

ACCESS_KEY = os.getenv('ACCESS_KEY')
print(ACCESS_KEY)
ACCESS_SECRET_KEY = environ.get('ACCESS_SECRET_KEY')
print(ACCESS_SECRET_KEY)
BUCKET_NAME = environ.get('BUCKET_NAME')
print(BUCKET_NAME)
FILE = os.getenv('FILE')
print(FILE)
AS_FILE = os.getenv('AS_FILE')
print(AS_FILE)
G = environ.get('G')
print(G)
B = environ.get('B')
print(B)
E = environ.get('E')
print(E)
    
print(ACCESS_KEY)

varName=["ACCESS_KEY:", "ACCESS_SECRET_KEY:", "BUCKET_NAME:", "FILE:", "AS_FILE:"]
varEnv=[ ACCESS_KEY, ACCESS_SECRET_KEY, BUCKET_NAME, FILE, AS_FILE]

#print(varName[0:4])
#print(varEnv[0:4])


#for (i, j) in iterate_together(varName, varEnv):
#    print(varName, varEnv)

for i in range(len(varName)):
    print(varName[i], varEnv[i])

#for i, j in [(0, 1), ('a', 'b')]:
#   print('i:', i, 'j:', j)