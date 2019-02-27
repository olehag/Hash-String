#Get-StringHash - https://gallery.technet.microsoft.com/scriptcenter/Get-StringHash-aa843f71

Function Get-StringHash([String] $String,$HashName = $HashName)
{
$StringBuilder = New-Object System.Text.StringBuilder
[System.Security.Cryptography.HashAlgorithm]::Create($HashName).ComputeHash([System.Text.Encoding]::UTF8.GetBytes($String))|%{
    #Change "X2" to "x2" if you want the hash in lowercase.
    [Void]$StringBuilder.Append($_.ToString("X2"))
}
$StringBuilder.ToString()
}

#Array of algorithms
$A = @("MD5", "RIPEMD160", "SHA1", "SHA256", "SHA384", "SHA512")

while ($true)
{

#Get algorithm
do {
    Write-Host "`tChoose one of the following algorithms:" -ForegroundColor Green
    Write-Host "`t`tMD5, RIPEMD160, SHA1, SHA256, SHA384 and SHA512" -ForegroundColor Yellow
    Write-Host
    $Algorithm = Read-Host "`tAlgorithm" 
    $HashName = switch ($Algorithm) {
        'MD5' {'MD5'}
        'RIPEMD160' {'RIPEMD160'}
        'SHA1' {'SHA1'}
        'SHA256' {'SHA256'}
        'SHA384' {'SHA384'}
        'SHA512' {'SHA512'}
    Default {
        Clear-Host
        }
    }
} until ($HashName -match $A.0)


#Get user-input.
write-host
Write-Host "`t-----------------------------------------"
$myvar = Read-Host -Prompt "`tEnter string to hash using $HashName algorithm"
$hashedstring = Get-StringHash $myvar
Write-host
Write-Host "`t-----------------------------------------"

#Output result.
Write-Host "`tHashed input:" -ForegroundColor Green
Write-Host "`t$hashedstring" -ForegroundColor Yellow
Write-Host

#Copy result to clipboard.
Set-Clipboard $hashedstring
Write-Host "`tCopied to Clipboard!" -ForegroundColor Green
Write-Host

#Exit
Write-Host "`tPress any key to end ..."
$x = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
Clear-Host
}
