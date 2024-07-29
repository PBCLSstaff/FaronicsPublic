function RenameFolder
{
    param ($Path = "C:\scripts", $Newfoldername = "scripts.old")
    
    #Rename the folder
    Rename-Item "$Path" "$Newfoldername"

    #Remove the script file from startup for all users
    Remove-Item "C:\Users\*\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\*.bat*" -Force

    #Remove the script shortcut from startup for all users
    Remove-Item "C:\Users\*\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\*shortcut*" -Force

    #Remove Reconnect Drives link from every user's desktop
    Remove-Item "C:\Users\*\Desktop\Reconnect Drives*" -Force
}
RenameFolder
