@echo off
setlocal

set "startupFolder=C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"


for %%i in ("%startupFolder%\*.bat") do (
    echo Deleting file: %%i
    del "%%i"
)


for %%i in ("%startupFolder%\*bat*.lnk") do (
    echo Deleting shortcut: %%i
    del "%%i"
)

set "textFile=%startupFolder%\empty_file.txt"


echo Creating empty text document: %textFile%
type nul > "%textFile%"

echo Cleanup complete.

endlocal
exit /b
