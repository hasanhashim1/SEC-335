

param ($n, $s)

for ($i = 0; $i -le 256; $i++) 
{

    $ip = ($n + "." + $i)
    $hn = (Resolve-DnsName -DnsOnly $ip -Server $s -ErrorAction Ignore)
    if ($hn -ne $null) 

    {
        Write-Host $ip $hn.NameHost
    }
}