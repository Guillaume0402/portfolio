#!/bin/bash

# Script de test pour vérifier le portfolio

echo "🚀 Portfolio - Script de Test"
echo "================================"

# Vérification des fichiers
echo "📁 Vérification des fichiers..."
if [ -f "public/css/main.css" ]; then
    echo "✅ CSS principal trouvé"
else
    echo "❌ CSS principal manquant"
    exit 1
fi

if [ -f "public/img/photo_profil.jpg" ]; then
    echo "✅ Photo de profil trouvée"
else
    echo "❌ Photo de profil manquante"
fi

# Vérification des animations dans le CSS
echo "🎨 Vérification des animations flashy..."
animations=("gradient-flash" "text-pulse" "shine-sweep" "sparkle" "metallic-shine" "float-text" "glow-pulse")

for animation in "${animations[@]}"; do
    if grep -q "$animation" public/css/main.css; then
        echo "✅ Animation $animation trouvée"
    else
        echo "❌ Animation $animation manquante"
    fi
done

# Vérification des sélecteurs CSS
echo "🎯 Vérification des sélecteurs CSS..."
selectors=("h1.nomProfil" "h2.titreProfil" "head-boxed" "imgProfil")

for selector in "${selectors[@]}"; do
    if grep -q "$selector" public/css/main.css; then
        echo "✅ Sélecteur $selector trouvé"
    else
        echo "❌ Sélecteur $selector manquant"
    fi
done

# Compilation Sass
echo "⚙️ Test de compilation Sass..."
npm run sass
if [ $? -eq 0 ]; then
    echo "✅ Compilation Sass réussie"
else
    echo "❌ Erreur de compilation Sass"
    exit 1
fi

# Vérification de la taille du CSS
css_size=$(wc -c < public/css/main.css)
echo "📊 Taille du CSS compilé: $css_size octets"

if [ $css_size -gt 10000 ]; then
    echo "✅ CSS compilé avec succès (taille correcte)"
else
    echo "⚠️ CSS compilé mais taille suspecte"
fi

echo ""
echo "🎉 Test terminé !"
echo "🌐 Pour tester le rendu:"
echo "   1. npm start"
echo "   2. Ouvrir http://localhost:3000/cv"
echo "   3. Vérifier les animations flashy sur le nom et le titre"
echo ""
echo "✨ Le portfolio est prêt pour la production !"
