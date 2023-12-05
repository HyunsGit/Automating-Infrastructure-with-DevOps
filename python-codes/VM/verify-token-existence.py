#!/usr/bin/python3

import os
import time
import requests
from dotenv import load_dotenv
from pathlib import Path
from datetime import datetime, timedelta

class color:
   PURPLE = '\033[1;35;48m'
   END = '\033[1;37;0m'

dotenv_path = Path('/object-storage-api/.env')
load_dotenv(dotenv_path=dotenv_path)

X_Subject_Token_Dir = os.getenv('X_Subject_Token_Dir')
ti_m = os.path.getmtime(X_Subject_Token_Dir)
m_ti = time.ctime(ti_m)

if os.path.getsize(X_Subject_Token_Dir) > 0:
    print("token was successfully created!!!")
    print(color.PURPLE + f"{X_Subject_Token_Dir}" + color.END +f" was last modified at {m_ti}")
else:
    print("token was not created!!!")