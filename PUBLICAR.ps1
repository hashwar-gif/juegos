# Publica la tienda HASHWAR Games en https://hashwar-gif.github.io/juegos/
$ErrorActionPreference = "Continue"
Set-Location $PSScriptRoot
if (-not (Test-Path .git)) { git init -q -b main }
# Identidad solo para este repo (git no tenia nombre configurado)
git config user.name "hashwar-gif"
git config user.email "270408705+hashwar-gif@users.noreply.github.com"
git add -A
git commit -q -m "Tienda HASHWAR Games: 5 juegos gratis + 3 de pago" -m "Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>"
gh repo view hashwar-gif/juegos *> $null
if ($LASTEXITCODE -ne 0) {
    gh repo create hashwar-gif/juegos --public --source . --push --description "Juegos hechos en Bolivia - HASHWAR Games"
} else {
    git push -u origin main
}
gh api -X POST repos/hashwar-gif/juegos/pages -f "source[branch]=main" -f "source[path]=/" *> $null
Write-Host ""
Write-Host "LISTO. En 1-2 minutos abre: https://hashwar-gif.github.io/juegos/" -ForegroundColor Green
Read-Host "Presiona Enter para cerrar"
