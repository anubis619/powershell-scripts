<#
Script to dump all users from the group and export them as a CSV
#>

Get-ADGroupMember 'test_group_1' -Recursive | Get-ADUser -Property cn, displayName, sn, givenName | Select Name, DistinguishedName, sn, givenName | Export-Csv -Path .\test.csv