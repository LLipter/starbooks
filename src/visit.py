import urllib.request
import time

url = "http://www.irran.top:8080/starbooks"
while True:
    html = urllib.request.urlopen(url)
    # print(html)
    time.sleep(60 * 60) # visit this website every 1 hour

# execute it in background
# python3 visit.py &