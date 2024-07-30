function RenameFolder {
    param (
        [string]$Path = "C:\scripts",
        [string]$NewFolderName = "scripts.old"
    )
    
    # Rename the folder
    if (Test-Path -Path $Path) {
        Rename-Item -Path $Path -NewName $NewFolderName
    } else {
        Write-Host "The folder does not exist: $Path"
        return
    }

    # Define the startup path
    $startupPath = "AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"

    # Remove .bat files and shortcuts from startup for all users
    $userProfiles = Get-ChildItem -Path C:\Users -Directory

    foreach ($user in $userProfiles) {
        $startupFolder = Join-Path -Path $user.FullName -ChildPath $startupPath
        if (Test-Path -Path $startupFolder) {
            # Remove .bat files
            Get-ChildItem -Path $startupFolder -Filter "*.bat*" -ErrorAction SilentlyContinue | Remove-Item -Force
            
            # Remove shortcuts
            Get-ChildItem -Path $startupFolder -Filter "*shortcut*" -ErrorAction SilentlyContinue | Remove-Item -Force
        }
    }

    # Remove Reconnect Drives link from every user's desktop
    foreach ($user in $userProfiles) {
        $desktopPath = Join-Path -Path $user.FullName -ChildPath "Desktop"
        if (Test-Path -Path $desktopPath) {
            Get-ChildItem -Path $desktopPath -Filter "Reconnect Drives*" -ErrorAction SilentlyContinue | Remove-Item -Force
        }
    }
}

RenameFolder
