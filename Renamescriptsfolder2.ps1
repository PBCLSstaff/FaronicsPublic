function RenameFolder
{
    param ($Path = "C:\scripts", $Newfoldername = "scripts.old")
    
    #Rename the folder
    Rename-Item "$Path" "$Newfoldername"
    
    Remove-Item "C:\Users\*\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\*.bat*" -Force
   
    #Remove Reconnect Drives link from every user's desktop
    Remove-Item "C:\Users\*\Desktop\Reconnect Drives*" -Force
}
RenameFolder
