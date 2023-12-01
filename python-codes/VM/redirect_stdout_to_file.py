#!/usr/bin/env python
import sys


sys.stdout = open('./file', 'w')
print('test')
sys.stdout.close()