@echo off
cls

rem Navigate to the root directory to avoid confusion
cd\

rem Use xcopy to copy the specific file from network to local directory
xcopy "\\staff.pbclibrary.org\it-ftp\#Copy Admin Desktop.bat" "C:\SysAdmin\" /Y /C /H /R /K /O /X

rem Check Status
if errorlevel 1 (
    echo Failed to copy file.
) else (
   echo File copied successfully.
    
	cd %C:\SysAdmin\%


)

rem End 
exit
