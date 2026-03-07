$ErrorActionPreference = "Stop"

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$repoRoot = Split-Path -Parent $scriptDir
$today = Get-Date
$year = $today.ToString("yyyy")
$dateString = $today.ToString("yyyy-MM-dd")

$templatePath = Join-Path $repoRoot "docs\templates\daily-template.md"
$targetDir = Join-Path $repoRoot ("docs\daily\" + $year)
$targetPath = Join-Path $targetDir ($dateString + ".md")

if (-not (Test-Path -LiteralPath $templatePath)) {
    Write-Host "Template not found: $templatePath" -ForegroundColor Red
    exit 1
}

if (-not (Test-Path -LiteralPath $targetDir)) {
    New-Item -ItemType Directory -Path $targetDir -Force | Out-Null
}

if (Test-Path -LiteralPath $targetPath) {
    Write-Host "Daily file already exists: $targetPath" -ForegroundColor Yellow
    exit 0
}

$content = Get-Content -LiteralPath $templatePath -Raw
$content = $content.Replace("{{date}}", $dateString)
Set-Content -LiteralPath $targetPath -Value $content -Encoding UTF8

Write-Host "Created: $targetPath" -ForegroundColor Green
