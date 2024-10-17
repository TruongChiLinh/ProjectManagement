import time
import datetime
while True:
    #idle for 30s
    time.sleep(30)
    print(f'current log print to stdout at: {datetime.datetime.utcnow()}')