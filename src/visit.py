import urllib.request
import time
import os
import sys

pid = os.fork()
if pid:
    sys.exit(0)
os.chdir('/')
os.setsid()

url = "http://www.irran.top:8080/starbooks"
while True:
    html = urllib.request.urlopen(url)
    # print(html)
    time.sleep(60 * 60) # visit this website every 1 hour