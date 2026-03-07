$ErrorActionPreference = "Stop"
Set-Location -LiteralPath $PSScriptRoot

Write-Host ""
Write-Host "[1/6] Current repository:"
Write-Host $PSScriptRoot

Write-Host ""
Write-Host "[2/6] Git status:"
git status

$currentBranch = (git branch --show-current).Trim()
Write-Host ""
if ($currentBranch -ne "main") {
    Write-Host "[Notice] Current branch is '$currentBranch'. Push target remains origin main." -ForegroundColor Yellow
} else {
    Write-Host "[Notice] Current branch is 'main'."
}

Write-Host ""
Write-Host "[3/6] Staging changes..."
git add .

Write-Host ""
$commitMessage = Read-Host "Enter commit message (leave blank for default)"
if ([string]::IsNullOrWhiteSpace($commitMessage)) {
    $commitMessage = "chore: update content repository"
}

Write-Host ""
Write-Host "[4/6] Creating commit..."
git commit -m $commitMessage
if ($LASTEXITCODE -ne 0) {
    Write-Host "[Notice] Commit was not created. This usually means there are no staged changes." -ForegroundColor Yellow
}

Write-Host ""
Write-Host "[5/6] Pushing to origin main..."
git push origin main

Write-Host ""
Write-Host "[6/6] Done."
