# Define variables
$installerUrl = "https://mylibrary.pbclibrary.org/DeepInstinct3650/InstallerManaged_deep5.0.0.11.exe"
$exeFile = "$env:TEMP\InstallerManaged_deep5.0.0.11.exe"
$installPath = "C:\Program Files\DeepInstinct"
$commandLineArgs = "pbc.customers.deepinstinctweb.com /token 4936109d-863f-4892-ba15-df270810d945 /nfs"

# Function to check if installation path exists and download installer if not
Function Check-InstallationPath {
    param (
        [string]$path,
        [string]$url,
        [string]$outputFile
    )
    
    if (Test-Path $path) {
        Write-Output "Deep Instinct is already installed. Exiting..."
        exit
    } else {
        Write-Output "Downloading file from $url to $outputFile..."
        Invoke-WebRequest -Uri $url -OutFile $outputFile
    }
}

# Call the function to check and potentially download the installer
Check-InstallationPath -path $installPath -url $installerUrl -outputFile $exeFile

# Execute the installer with the specified command line arguments
Write-Output "Executing the installer..."
Start-Process -FilePath $exeFile -ArgumentList $commandLineArgs -Wait

# Wait for 3 minutes
Write-Output "Waiting for 3 minutes..."
Start-Sleep -Seconds 180

# Check if the installation path exists again after installation
if (Test-Path $installPath) {
    Write-Output "DeepInstinct seems to have installed as the Program files path exists"
} else {
    Write-Output "Installation might have failed, as the Program files path does not exist"
}

# Cleanup
Remove-Item -Path $exeFile -Force