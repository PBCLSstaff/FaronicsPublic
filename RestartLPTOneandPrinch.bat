net stop "LPT:One Job Queue Engine"
net stop lptclient
net stop "Print Delivery Station"
net stop "princhcloudconnector"

net start "LPT:One Job Queue Engine"
timeout /t 5
net start lptclient
net start "Print Delivery Station"
net start "princhcloudconnector"
