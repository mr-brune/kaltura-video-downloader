function Get-RandomAlphanumericString
{
    [CmdletBinding()]
    Param ([int] $length = 4)
 
    Begin {}
 
    Process
    {
        Write-Output (-join ((0x30..0x39) + ( 0x41..0x5A) + ( 0x61..0x7A) | Get-Random -Count $length  | % {[char]$_}))
    }
}
$random = Get-RandomAlphanumericString
$nomevideo = Read-Host 'nome video output:'
$urlvideo = Read-Host 'url video:'


$path_to_file = "$PSScriptRoot\$nomevideo ($random).m3u8"
$path_to_file1 = "$PSScriptRoot\$nomevideo ($random).mp4"

$path_to_file1

Invoke-WebRequest $urlvideo -OutFile $path_to_file



.\ffmpeg -protocol_whitelist file,http,https,tcp,tls,crypto -i $path_to_file -c copy $path_to_file1

