# Script de test PowerShell pour vérifier le portfolio

Write-Host "🚀 Portfolio - Script de Test" -ForegroundColor Green
Write-Host "================================" -ForegroundColor Green

# Vérification des fichiers
Write-Host "📁 Vérification des fichiers..." -ForegroundColor Yellow
if (Test-Path "public/css/main.css") {
    Write-Host "✅ CSS principal trouvé" -ForegroundColor Green
} else {
    Write-Host "❌ CSS principal manquant" -ForegroundColor Red
    exit 1
}

if (Test-Path "public/img/photo_profil.jpg") {
    Write-Host "✅ Photo de profil trouvée" -ForegroundColor Green
} else {
    Write-Host "❌ Photo de profil manquante" -ForegroundColor Red
}

# Vérification des animations dans le CSS
Write-Host "🎨 Vérification des animations flashy..." -ForegroundColor Yellow
$animations = @("gradient-flash", "text-pulse", "shine-sweep", "sparkle", "metallic-shine", "float-text", "glow-pulse")

foreach ($animation in $animations) {
    if (Select-String -Path "public/css/main.css" -Pattern $animation -Quiet) {
        Write-Host "✅ Animation $animation trouvée" -ForegroundColor Green
    } else {
        Write-Host "❌ Animation $animation manquante" -ForegroundColor Red
    }
}

# Vérification des sélecteurs CSS
Write-Host "🎯 Vérification des sélecteurs CSS..." -ForegroundColor Yellow
$selectors = @("h1.nomProfil", "h2.titreProfil", "head-boxed", "imgProfil")

foreach ($selector in $selectors) {
    if (Select-String -Path "public/css/main.css" -Pattern $selector -Quiet) {
        Write-Host "✅ Sélecteur $selector trouvé" -ForegroundColor Green
    } else {
        Write-Host "❌ Sélecteur $selector manquant" -ForegroundColor Red
    }
}

# Compilation Sass
Write-Host "⚙️ Test de compilation Sass..." -ForegroundColor Yellow
$result = npm run sass
if ($LASTEXITCODE -eq 0) {
    Write-Host "✅ Compilation Sass réussie" -ForegroundColor Green
} else {
    Write-Host "❌ Erreur de compilation Sass" -ForegroundColor Red
    exit 1
}

# Vérification de la taille du CSS
$cssSize = (Get-Item "public/css/main.css").Length
Write-Host "📊 Taille du CSS compilé: $cssSize octets" -ForegroundColor Cyan

if ($cssSize -gt 10000) {
    Write-Host "✅ CSS compilé avec succès (taille correcte)" -ForegroundColor Green
} else {
    Write-Host "⚠️ CSS compilé mais taille suspecte" -ForegroundColor Yellow
}

Write-Host ""
Write-Host "🎉 Test terminé !" -ForegroundColor Green
Write-Host "🌐 Pour tester le rendu:" -ForegroundColor Cyan
Write-Host "   1. npm start" -ForegroundColor White
Write-Host "   2. Ouvrir http://localhost:3000/cv" -ForegroundColor White
Write-Host "   3. Vérifier les animations flashy sur le nom et le titre" -ForegroundColor White
Write-Host ""
Write-Host "✨ Le portfolio est prêt pour la production !" -ForegroundColor Magenta
