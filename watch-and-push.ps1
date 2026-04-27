# Auto-publish watcher for Jackson Lab Antibody Tracker
# Watches antibody-tracker.html for changes and auto-commits + pushes to GitHub Pages

$repoPath = Split-Path -Parent $MyInvocation.MyCommand.Path
$watchFile = Join-Path $repoPath "antibody-tracker.html"

Write-Host "Watching for changes to antibody-tracker.html..."
Write-Host "Press Ctrl+C to stop."
Write-Host ""

$lastHash = ""

while ($true) {
    if (Test-Path $watchFile) {
        $currentHash = (Get-FileHash $watchFile -Algorithm MD5).Hash

        if ($currentHash -ne $lastHash -and $lastHash -ne "") {
            Write-Host "[$(Get-Date -Format 'HH:mm:ss')] Change detected - pushing to GitHub..."

            Set-Location $repoPath
            git add antibody-tracker.html
            git commit -m "Auto-publish: update antibody data $(Get-Date -Format 'yyyy-MM-dd HH:mm')"
            git push

            if ($LASTEXITCODE -eq 0) {
                Write-Host "[$(Get-Date -Format 'HH:mm:ss')] Done. Site will update in ~1-2 minutes."
            } else {
                Write-Host "[$(Get-Date -Format 'HH:mm:ss')] Push failed - check git credentials."
            }
            Write-Host ""
        }

        $lastHash = $currentHash
    }

    Start-Sleep -Seconds 10
}
