# Portfolio Guillaume Maignaut

Portfolio moderne et responsive développé avec Node.js, Express, EJS et Sass.

## 🚀 Fonctionnalités

-   **Design moderne** : Interface utilisateur moderne avec animations et transitions fluides
-   **Responsive** : Adaptation parfaite sur tous les appareils (desktop, tablet, mobile)
-   **Architecture Sass moderne** : Migration complète vers `@use/@forward`
-   **Animations** : Effets visuels et animations CSS avancées
-   **Accessibilité** : Respect des bonnes pratiques d'accessibilité web
-   **SEO optimisé** : Balises meta, Open Graph et structure sémantique

## 🛠️ Technologies

-   **Backend** : Node.js, Express.js
-   **Templates** : EJS (Embedded JavaScript)
-   **CSS** : Sass/SCSS avec architecture moderne
-   **JavaScript** : ES6+ avec animations TypeWriter
-   **Bundling** : Sass compiler natif

## 📋 Prérequis

-   Node.js (version 16 ou supérieure)
-   npm ou yarn
-   Git

## 🔧 Installation

1. **Cloner le repository**

```bash
git clone [url-du-repo]
cd portfolio
```

2. **Installer les dépendances**

```bash
npm install
```

3. **Compiler le CSS**

```bash
npm run sass
```

4. **Démarrer le serveur de développement**

```bash
npm run dev
```

Le site sera accessible à l'adresse `http://localhost:3000`

## 📜 Scripts disponibles

| Script               | Description                           |
| -------------------- | ------------------------------------- |
| `npm run dev`        | Démarre le serveur de développement   |
| `npm run sass`       | Compile le CSS une fois               |
| `npm run sass:watch` | Compile le CSS en mode watch          |
| `npm run build`      | Compile le CSS en mode production     |
| `npm start`          | Démarre le serveur en mode production |

## 🏗️ Structure du projet

```
portfolio/
├── public/                 # Assets statiques
│   ├── css/               # CSS compilé
│   ├── js/                # JavaScript
│   └── img/               # Images et assets
├── src/                   # Code source
│   ├── server.js          # Serveur Express
│   ├── routes/            # Routes Express
│   └── views/             # Templates EJS
│       ├── layouts/       # Layouts de base
│       ├── partials/      # Composants réutilisables
│       └── pages/         # Pages du site
├── scss/                  # Sources Sass
│   ├── main.scss          # Point d'entrée
│   ├── abstracts/         # Variables et mixins
│   ├── base/              # Styles de base
│   ├── layout/            # Mise en page
│   ├── components/        # Composants
│   └── pages/             # Styles spécifiques aux pages
└── docs/                  # Documentation
```

## 🎨 Architecture Sass

Le projet utilise une architecture Sass moderne avec `@use` et `@forward` :

```scss
// Avant (deprecated)
@import "variables";
@import "mixins";

// Après (moderne)
@use "abstracts" as *;
@use "base";
@use "layout";
```

### Fichiers principaux

-   **`scss/main.scss`** : Point d'entrée principal
-   **`scss/abstracts/`** : Variables, mixins et fonctions
-   **`scss/base/`** : Reset CSS, utilitaires et animations
-   **`scss/layout/`** : Header, footer et mise en page
-   **`scss/components/`** : Composants réutilisables
-   **`scss/pages/`** : Styles spécifiques aux pages

## 🌐 Pages disponibles

-   **`/`** : Page d'accueil avec slider et sections
-   **`/cv`** : CV en ligne
-   **`/mentions-legales`** : Mentions légales
-   **`/test.html`** : Page de test pour le développement

## 🔧 Développement

### Compilation CSS

Pour développer avec compilation automatique :

```bash
# Terminal 1 - Compilation CSS automatique
npm run sass:watch

# Terminal 2 - Serveur de développement
npm run dev
```

### Débogage

-   **CSS** : Utiliser les source maps générées
-   **JavaScript** : Ouvrir les outils de développement du navigateur
-   **Templates** : Vérifier les variables EJS et la structure HTML

### Tests

1. **Responsive** : Tester sur différentes tailles d'écran
2. **Performance** : Vérifier les temps de chargement
3. **Accessibilité** : Tester avec un lecteur d'écran
4. **SEO** : Valider les balises meta et la structure

## 🚀 Déploiement

### Mode production

```bash
# Compiler le CSS en mode production
npm run build

# Démarrer le serveur
npm start
```

### Variables d'environnement

```bash
PORT=3000                    # Port du serveur
NODE_ENV=production          # Mode production
```

## 🎯 Optimisations

-   **CSS** : Compilation en mode compressé
-   **Images** : Formats optimisés (WebP, AVIF)
-   **Performance** : Lazy loading et optimisations
-   **SEO** : Balises meta complètes et structure sémantique

## 📱 Responsive Design

Le site est optimisé pour :

-   **Mobile** : < 768px
-   **Tablet** : 768px - 1199px
-   **Desktop** : > 1200px

## 🎨 Personnalisation

### Couleurs

Modifier les variables dans `scss/abstracts/_variables.scss` :

```scss
$primary-color: #6366f1;
$accent-color: #e11d48;
$text-light: #f8fafc;
```

### Animations

Les animations sont définies dans `scss/base/_animations.scss` et peuvent être personnalisées.

## 🐛 Dépannage

### Problèmes courants

1. **CSS non compilé** : Vérifier que Sass est installé
2. **Erreurs JavaScript** : Vérifier que Typewriter.js est chargé
3. **Images manquantes** : Vérifier les chemins d'assets
4. **Menu burger** : Vérifier la structure HTML du header

### Logs utiles

```bash
# Vérifier les erreurs Sass
npm run sass 2>&1 | grep -i error

# Vérifier le serveur
npm run dev
```

## 📚 Documentation

-   **[Guide de migration Sass](docs/MIGRATION_SASS.md)** : Détails sur la migration vers @use/@forward
-   **[Guide de diagnostic](docs/DIAGNOSTIC.md)** : Résolution des problèmes courants

## 🤝 Contribution

1. Fork le projet
2. Créer une branche (`git checkout -b feature/nouvelle-fonctionnalite`)
3. Commit les changements (`git commit -m 'Ajouter nouvelle fonctionnalité'`)
4. Push vers la branche (`git push origin feature/nouvelle-fonctionnalite`)
5. Créer une Pull Request

## 📄 License

Ce projet est sous licence MIT. Voir le fichier [LICENSE](LICENSE) pour plus de détails.

## 👨‍💻 Auteur

**Guillaume Maignaut** - Développeur Full-Stack

-   Portfolio : [guillaumemaignaut.fr](https://guillaumemaignaut.fr)
-   LinkedIn : [YomMgt](https://www.linkedin.com/in/YomMgt)
-   GitHub : [Guillaume0402](https://github.com/Guillaume0402)
-   Email : g.maignaut@gmail.com

---

_Portfolio développé avec ❤️ et beaucoup de ☕_
