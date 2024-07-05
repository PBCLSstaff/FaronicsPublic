function RenameFolder
{
    param ($Path = "C:\scripts", $Newfoldername = "scripts.old")

    #Rename the folder
    Rename-Item "$Path" "$Newfoldername"

    #Remove Reconnect Drives link from every user's desktop
    Remove-Item C:\Users\*\Desktop\Reconnect*.lnk -Force
}
RenameFolder