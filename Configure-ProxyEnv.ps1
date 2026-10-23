param([switch]$Off)

$proxyUrl = "http://127.0.0.1:10808"
$noProxy = "localhost,127.0.0.1,::1,192.168.0.0"
$vars = "HTTP_PROXY", "HTTPS_PROXY", "ALL_PROXY"

if ($Off) {
    foreach ($v in $vars + "NO_PROXY") {
        Remove-Item "Env:$v" -ErrorAction Silentlycontinue
    }
    Write-Host "Proxy variables cleared"
} else {
    foreach ($v in $vars) {
        Set-Item "Env:$v" $proxyUrl
    }
    $env:NO_PROXY = $noProxy
    Write-Host "Proxy variables set to $ProxyUrl"
}
