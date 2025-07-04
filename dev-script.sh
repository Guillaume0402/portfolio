#!/bin/bash

# Script de développement pour le portfolio

echo "🚀 Portfolio - Script de développement"
echo "=================================="

# Fonction pour afficher les options
show_menu() {
    echo ""
    echo "Choisissez une option :"
    echo "1. Compiler le CSS (mode dev)"
    echo "2. Compiler le CSS (mode watch)"
    echo "3. Compiler le CSS (mode production)"
    echo "4. Démarrer le serveur"
    echo "5. Tout démarrer (CSS watch + serveur)"
    echo "6. Nettoyer et recompiler"
    echo "7. Quitter"
    echo ""
}

# Fonction pour compiler le CSS
compile_css() {
    echo "📦 Compilation du CSS..."
    npm run sass
    if [ $? -eq 0 ]; then
        echo "✅ CSS compilé avec succès"
    else
        echo "❌ Erreur lors de la compilation CSS"
    fi
}

# Fonction pour compiler en mode watch
compile_css_watch() {
    echo "👀 Compilation CSS en mode watch..."
    npm run sass:watch
}

# Fonction pour compiler en mode production
compile_css_prod() {
    echo "🏭 Compilation CSS en mode production..."
    npm run build
    if [ $? -eq 0 ]; then
        echo "✅ CSS compilé en mode production"
    else
        echo "❌ Erreur lors de la compilation CSS"
    fi
}

# Fonction pour démarrer le serveur
start_server() {
    echo "🌐 Démarrage du serveur..."
    npm run dev
}

# Fonction pour nettoyer et recompiler
clean_and_compile() {
    echo "🧹 Nettoyage et recompilation..."
    rm -f public/css/main.css
    rm -f public/css/main.css.map
    compile_css
}

# Fonction pour tout démarrer
start_all() {
    echo "🚀 Démarrage complet..."
    echo "CSS en mode watch et serveur de développement"
    
    # Ouvrir deux terminaux (si possible)
    if command -v gnome-terminal &> /dev/null; then
        gnome-terminal --tab --title="CSS Watch" -- bash -c "cd $(pwd) && npm run sass:watch; exec bash"
        gnome-terminal --tab --title="Server" -- bash -c "cd $(pwd) && npm run dev; exec bash"
    elif command -v cmd &> /dev/null; then
        # Windows
        start cmd /k "cd /d $(pwd) && npm run sass:watch"
        start cmd /k "cd /d $(pwd) && npm run dev"
    else
        echo "⚠️  Impossible d'ouvrir automatiquement les terminaux"
        echo "Veuillez ouvrir deux terminaux manuellement :"
        echo "Terminal 1: npm run sass:watch"
        echo "Terminal 2: npm run dev"
    fi
}

# Boucle principale
while true; do
    show_menu
    read -p "Votre choix [1-7]: " choice
    
    case $choice in
        1)
            compile_css
            ;;
        2)
            compile_css_watch
            ;;
        3)
            compile_css_prod
            ;;
        4)
            start_server
            ;;
        5)
            start_all
            ;;
        6)
            clean_and_compile
            ;;
        7)
            echo "👋 Au revoir !"
            exit 0
            ;;
        *)
            echo "❌ Option invalide. Veuillez choisir entre 1 et 7."
            ;;
    esac
    
    echo ""
    read -p "Appuyez sur Entrée pour continuer..."
done
