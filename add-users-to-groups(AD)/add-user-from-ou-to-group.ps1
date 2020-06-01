<#
Script to add users to a group based on the OU they are in
#>
Get-ADUser -SearchBase 'OU=Bfn Global Users,DC=BFN,DC=GLOBAL,DC=IO' -Filter * | ForEach-Object {Add-ADGroupMember -Identity 'test_group_1' -Members $_ }