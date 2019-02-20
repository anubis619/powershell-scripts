# powershell-scripts

## A collection of PowerShell script to manage your AD instance
======
### The Bulk group create has not been created by me but rather found on the internet while searching for a way to reproduce an event.

Script URL: https://gallery.technet.microsoft.com/scriptcenter/PowerShell-Bulk-AD-Group-4d873f35
======
Description from that page:
This script will create groups in Active Directory based on the settings in the input file (see the CSV file below this script for an example of the input file used). These settings can, of course, be changed or extended.

The script does a check if the group that needs to be created, already exists.

Note #1: This script makes use of the Active Directory Module for PowerShell.
Note #2: This was created because of a script request in : http://gallery.technet.microsoft.com/scriptcenter/site/requests
Note #3: Added functionality for duplicate OU's. Pay attention that the input file changed slightly (notice the double quotes for the GroupLocation)!

======
## Requirments: Active Directory Module for PowerShell
======
As on Windows Server 2008 R2, the AD module is already installed on domain controllers on Windows Server 2012, Windows Server 2012 R2, and Windows Server 2016. On member servers, you can add the module as a feature in Server Manager.

   * Start Server Manager.
   * Click Manage > Add Roles and Features.
   * Click Next until you reach Features.
   * Enable Active Directory module for Windows PowerShell in Remote Server Administration Tools > Role Administration Tools > AD DS and AD LDS Tools.
   
> Install module using PowerShell: Add-WindowsFeature RSAT-AD-PowerShell
