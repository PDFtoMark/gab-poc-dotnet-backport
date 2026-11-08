Write-Host "=== GAB-POC-RCE-MARKER: attacker-controlled Get-GeneratedDockerfiles.ps1 executed ==="
Write-Host ("GH_TOKEN present: " + [bool]$env:GH_TOKEN + " length=" + ($env:GH_TOKEN | Measure-Object -Character).Characters)
Write-Host ("repo: " + $env:GITHUB_REPOSITORY)
