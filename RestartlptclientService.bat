REM Restart the LPTOne print client service that runs on the public computers

net stop lptclient
timeout /t 5
net start lptclient

