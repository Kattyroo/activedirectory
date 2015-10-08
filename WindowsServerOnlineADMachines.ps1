Import-Module ActiveDirectory
 
Remove-Item 'C:\temp\PCList.txt'
 
$computers = Get-ADComputer -Filter { OperatingSystem -Like '*Windows Server*' }
ForEach ($computer in $computers) {
$client = $Computer.Name
if (Test-Connection -Computername $client -BufferSize 16 -Count 1 -Quiet) {
Out-File -filepath 'C:\temp\PCList.txt' -inputobject $client -Append
    } 
}
