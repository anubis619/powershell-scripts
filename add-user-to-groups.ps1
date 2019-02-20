$user=read-host 'Enter the username: '
$groups =  Get-ADgroup -Filter * | Select-Object -Property Name| Out-GridView -PassThru -Title "Select the Groups you want to add the user (note you can Sfhit + Click)" | Select-Object -ExpandProperty Name
 

foreach($group in $groups){
    Add-ADGroupMember -Identity $group -Members $user
}