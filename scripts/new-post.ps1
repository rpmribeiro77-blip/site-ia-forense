param(
  [Parameter(Mandatory = $true)]
  [ValidateSet("ia-forense", "processo-civil")]
  [string]$Pilar,

  [Parameter(Mandatory = $true)]
  [string]$Slug,

  [Parameter(Mandatory = $true)]
  [string]$Title,

  [string]$Description = "Descreva aqui o objetivo do artigo.",
  [string]$Nivel = "Iniciante"
)

$ErrorActionPreference = "Stop"

$root = Split-Path -Parent $PSScriptRoot
$templatePath = Join-Path $root "templates\\post-template.md"
$targetDir = Join-Path $root ("src\\pages\\" + $Pilar)
$targetPath = Join-Path $targetDir ($Slug + ".md")

if (-not (Test-Path -LiteralPath $templatePath)) {
  throw "Template não encontrado em $templatePath"
}

if (-not (Test-Path -LiteralPath $targetDir)) {
  New-Item -ItemType Directory -Path $targetDir -Force | Out-Null
}

if (Test-Path -LiteralPath $targetPath) {
  throw "Já existe um post com esse slug: $targetPath"
}

$template = Get-Content -LiteralPath $templatePath -Raw
$date = Get-Date -Format "dd/MM/yyyy"
$pillarLabel = if ($Pilar -eq "ia-forense") { "IA Forense" } else { "Processo Civil" }

$content = $template.
  Replace("{{TITLE}}", $Title).
  Replace("{{DESCRIPTION}}", $Description).
  Replace("{{PILAR}}", $pillarLabel).
  Replace("{{NIVEL}}", $Nivel).
  Replace("{{DATE}}", $date)

Set-Content -LiteralPath $targetPath -Value $content -Encoding UTF8

Write-Output "Post criado: $targetPath"
