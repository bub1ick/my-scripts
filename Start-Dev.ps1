param(
    [ValidateSet(2022, 2026)]
    [Int32]$VSVer = 2026,

    [ValidateSet("amd64", "x86")]
    [string]$HostArch = "amd64",

    [ValidateSet("amd64", "x86", "arm", "arm64")]
    [string]$Arch = "amd64"
)

$launchVsDevShell = switch ($VSVer)
{
    2026
    {
        "C:\Program Files\Microsoft Visual Studio\18\Community\Common7\Tools\Launch-VsDevShell.ps1"
    }
    2022
    {
        "C:\Program Files\Microsoft Visual Studio\2022\Community\Common7\Tools\Launch-VsDevShell.ps1"
    }
    default
    {
        throw "Unsupported Visual Studio version: $VSVer"
    }
}

Write-Host "Calling: & `"${launchVsDevShell}`" -Arch $Arch -HostArch $HostArch -SkipAutomaticLocation"
& $launchVsDevShell -Arch $Arch -HostArch $HostArch -SkipAutomaticLocation
