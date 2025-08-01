<#
.SYNOPSIS
    Checks if 'procdump' is running. If not, downloads it from the given URL, extracts it, and logs the result.
.DESCRIPTION
    This script automates the download and extraction of Sysinternals Procdump tool if it is not already running.
.NOTES
    Author  : YourName
    Tested  : Windows 10/11, PowerShell 5.1+
#>

# Define variables
$procdumpURL     = "https://download.sysinternals.com/files/Procdump.zip"
$payloadsPath    = "C:\Temp\Payloads"
$artifactPath    = "C:\Temp\Artifacts"
$zipFilePath     = "$payloadsPath\Procdump.zip"
$logFilePath     = "$artifactPath\DownloadLog.txt"
$logTime         = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

# Ensure folders exist
New-Item -Path $payloadsPath -ItemType Directory -Force | Out-Null
New-Item -Path $artifactPath -ItemType Directory -Force | Out-Null

# Start log
Add-Content -Path $logFilePath -Value "`n[$logTime] Script execution started.`n"

try {
    # Step 1: Check if any procdump process is running
    $procCheck = Get-Process -Name "procdump" -ErrorAction SilentlyContinue

    if ($procCheck) {
        Add-Content -Path $logFilePath -Value "Procdump process is already running. No download needed.`n"
    } else {
        Add-Content -Path $logFilePath -Value "Procdump process not found. Proceeding with download and extraction...`n"

        # Step 2: Download Procdump.zip
        Add-Content -Path $logFilePath -Value "Downloading Procdump from $procdumpURL..."
        Invoke-WebRequest -Uri $procdumpURL -OutFile $zipFilePath -UseBasicParsing
        Add-Content -Path $logFilePath -Value "Download complete.`n"

        # Step 3: Extract ZIP
        Add-Content -Path $logFilePath -Value "Extracting Procdump.zip to $payloadsPath..."
        Expand-Archive -LiteralPath $zipFilePath -DestinationPath $payloadsPath -Force
        Add-Content -Path $logFilePath -Value "Extraction complete.`n"
    }

} catch {
    # Catch and log any errors
    Add-Content -Path $logFilePath -Value "ERROR: $_`n"
}

# End log
$logEndTime = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
Add-Content -Path $logFilePath -Value "[$logEndTime] Script execution finished.`n"
