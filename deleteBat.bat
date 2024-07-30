@echo off
setlocal


set "usersFolder=C:\Users"

for /d %%u in ("%usersFolder%\*") do (
    set "userFolder=%%u"
    set "startupFolder=%userFolder%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"

   
    if exist "%startupFolder%" (
        echo Processing Startup folder for user: %%~nU

   
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

        echo Cleanup complete for user: %%~nU
    ) else (
        echo Startup folder does not exist for user: %%~nU
    )
)

endlocal
exit /b
