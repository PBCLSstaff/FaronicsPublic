@echo off
setlocal


set "startupFolder=C:\Users\%username%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"


for %%i in ("%startupFolder%\*.bat") do (
    echo Deleting file: %%i
    del "%%i"
)


for %%i in ("%startupFolder%\*bat*.lnk") do (
    echo Deleting shortcut: %%i
    del "%%i"
)


set "textFile=C:\Users\%username%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\empty_file.txt"
echo Creating empty text document: %textFile%
type nul > "%textFile%"


echo Cleanup complete.

endlocal
exit /b
