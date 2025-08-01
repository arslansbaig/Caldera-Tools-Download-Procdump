# Caldera Tools – Download ProcDump

This repository contains a PowerShell script to assist in adversary emulation by automating the download and extraction of [Microsoft Sysinternals ProcDump](https://learn.microsoft.com/en-us/sysinternals/downloads/procdump) on a target system.

## 📄 Script: `Download-Procdump.ps1`

### 🔍 Description
Checks if `procdump.exe` is running. If not, it:
- Downloads `Procdump.zip` from the official Sysinternals site.
- Extracts it into `C:\Temp\Payloads`.
- Logs the operation results to `C:\Temp\Artifacts\Download-Procdump-Result.txt`.

### ⚙️ Prerequisites
- Internet access
- PowerShell 5.1+
- Admin privileges (recommended for most environments)

### 📂 Folder Structure

```text
C:\
└── Temp\
    ├── Payloads\
    │   └── procdump.exe (and other files)
    └── Artifacts\
        └── Download-Procdump-Result.txt
