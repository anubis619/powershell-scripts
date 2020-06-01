# powershell-scripts

## A collection of PowerShell scripts to manage your AD instance or Okta tenant

***
Content list:
* Add users to groups (Add-ADGroupMember)
   * [Add users from an OU to a group](../add-users-to-groups(AD)/add-user-from-ou-to-group.ps1)
   * [Add users to multiple groups based on CSV](add-users-to-groups(AD)/add-user-to-groups.ps1)
   * [Bulk group add](bulk-group(AD)/ad-bulk-group-creation.ps1)
* Get users from a group with extra fields and dump the result to a CSV
  * [Get user from group](..get-members-of-group/get-full-user-dump.ps1)
* Okta API integration with Powershell

***
## Note
### The Bulk group create has not been created by me but rather found on the internet while searching for a way to reproduce an event.

Script URL: [PowerShell: Bulk AD Group Creation (Based On CSV Input)](https://gallery.technet.microsoft.com/scriptcenter/PowerShell-Bulk-AD-Group-4d873f35)

Description from that page:
This script will create groups in Active Directory based on the settings in the input file (see the CSV file below this script for an example of the input file used). These settings can, of course, be changed or extended.

The script does a check if the group that needs to be created, already exists.

Note #1: This script makes use of the Active Directory Module for PowerShell.  
Note #2: This was created because of a script request in : <http://gallery.technet.microsoft.com/scriptcenter/site/requests>  
Note #3: Added functionality for duplicate OU's. Pay attention that the input file changed slightly (notice the double quotes for the GroupLocation)!

***

## Requirments: Active Directory Module for PowerShell

As on Windows Server 2008 R2, the AD module is already installed on domain controllers on Windows Server 2012, Windows Server 2012 R2, and Windows Server 2016. On member servers, you can add the module as a feature in Server Manager.

* Start Server Manager.
* Click Manage > Add Roles and Features.
* Click Next until you reach Features.
* Enable Active Directory module for Windows PowerShell in Remote Server Administration Tools > Role Administration Tools > AD DS and AD LDS Tools.


```powershell
Install module using PowerShell: Add-WindowsFeature RSAT-AD-PowerShell
```
