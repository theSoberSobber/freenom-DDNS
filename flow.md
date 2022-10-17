We'll be using crontab to schedule the script to run every minute. <br />

# Script (checkAndUpdate)
- get current ip from ipapi.co/json
- check the log file for last recorded IP
  - same
    - do nothing
  - different
    - call the changeDns(IP, domainId) function from the freenomInteraction script
    - dump the new IP in the log file     
