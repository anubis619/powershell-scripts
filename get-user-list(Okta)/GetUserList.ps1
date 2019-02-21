$baseUri = "https://avagoext.okta.com/api/v1"
$apiToken = "***" #Prod

$groupId = "***"

$headers = @{"Accept"="application/json";"Content-Type"="application/json";"Authorization"="SSWS ${apiToken}"}
$epochTime = New-Object -Type DateTime -ArgumentList 1970, 1, 1, 0, 0, 0, 0

function Validate-Limits{
    param(
        [int]$RateLimitRemaining,
        [int]$RateLimitReset,
        $CallingUri
    )

    if($RateLimitRemaining -lt 5)
    {
        Write-Host -ForegroundColor Yellow -Object ("Waiting till {0} when limits reset for uri {1}" -f $epochTime.AddSeconds($RateLimitReset).ToLocalTime(),$callingUri)
        do{
            Start-Sleep -Seconds 1
        }
        while((Get-Date).AddSeconds($secondsOffSet) -lt $epochTime.AddSeconds($RateLimitReset).ToLocalTime())
    }
}

function Get-OktaPagedItems{
    param(
        $uri=""
    )
    do{
        $response = Invoke-WebRequest -Headers $headers -Method Get -Uri $uri
    
        Validate-Limits -RateLimitRemaining $response.Headers.'X-Rate-Limit-Remaining' -RateLimitReset $response.Headers.'X-Rate-Limit-Reset' -CallingUri $uri

        $links = @{}
        if ($response.Headers.Link) 
        {
            foreach ($link in $response.Headers.Link.split(",")) 
            {
                if ($link -match '<(.*)>; rel="(.*)"') 
                {
                    $links[$matches[2]] = $matches[1]
                }
            }
        }
    
        ConvertFrom-Json $response.content | 
        % { 
    
            $_ 
        
        }
        $uri = $links.next
    }while($links.next)
}


Write-Host -Object ("Getting Okta Users...") -ForegroundColor Yellow
#$users = Get-OktaPagedItems -uri ($baseUri + "/users?limit=500")
$users=  Get-OktaPagedItems -uri ($baseUri + “/groups/“ + $groupId + “/users?limit=500”)
Write-Host -Object ("Retrieved {0} Okta Users" -f $users.Count) -ForegroundColor Yellow



$users | select Id,status,lastLogin,created,@{n="profile.firstName"; e={ $_.profile.firstName}},@{n="profile.lastName"; e={ $_.profile.lastName }},@{n="profile.employeeNumber"; e={ $_.profile.employeeNumber}},@{n="profile.email"; e={ $_.profile.email }} | export-csv -path “C:\Users\ss888355\data.csv” -notypeinformation


