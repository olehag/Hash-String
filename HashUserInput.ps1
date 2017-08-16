#Lord Hagen / olehag04@nfk.no


#Userinput one algorithm: MD5, RIPEMD160, SHA1, SHA256, SHA384 and SHA512
Write-Host "`tChoose one of the following algorithms:" -ForegroundColor Green
Write-Host "`t`tMD5, RIPEMD160, SHA1, SHA256, SHA384 and SHA512" -ForegroundColor Yellow
Write-Host
$HashName = Read-Host -Prompt "`tAlgorithm"

Function Get-StringHash([String] $String,$HashName = $HashName)
{
$StringBuilder = New-Object System.Text.StringBuilder
[System.Security.Cryptography.HashAlgorithm]::Create($HashName).ComputeHash([System.Text.Encoding]::UTF8.GetBytes($String))|%{
    #Change "X2" to "x2" if you want the hash in lowercase.
    [Void]$StringBuilder.Append($_.ToString("X2"))
}
$StringBuilder.ToString()
}

Clear-Host
Write-Host

#Get user-input.
$myvar = Read-Host -Prompt "`tEnter string to hash using $HashName algorithm"
$hashedstring = Get-StringHash $myvar
Write-Host

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

<#
Original script shamelessly stolen from:
https://gallery.technet.microsoft.com/scriptcenter/Get-StringHash-aa843f71

Added abit of functionality
#>