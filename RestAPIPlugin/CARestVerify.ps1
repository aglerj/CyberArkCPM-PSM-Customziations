#Read-Host is not compatable with TPC
Write-Host "Address:"
$url = [Console]::ReadLine()
Write-Host "TargetUser:"
$TargetUser = [Console]::ReadLine()
Write-Host "CurrentPassword:"
$CurPass = [Console]::ReadLine()

$uri = "$url/PasswordVault/api/Auth/cyberark/Logon"

$headers = @{
    "Content-Type" = "application/json"
}
$body = @{
    "username" = $Targetuser
    "password" = $CurPass
} | ConvertTo-Json

try{
    $response = Invoke-RestMethod -uri $uri -Method "POST" -Headers $headers -Body $body
    write-host "Login Successful"
} catch {
    write-host "Login Failed"
}

