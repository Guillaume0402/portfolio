# Guide Complet : Création d'un Portfolio avec Node.js, Express, EJS et Sass

## 📋 Table des matières

1. [Prérequis](#prérequis)
2. [Initialisation du projet](#initialisation-du-projet)
3. [Configuration de base](#configuration-de-base)
4. [Structure des dossiers](#structure-des-dossiers)
5. [Configuration d'Express](#configuration-dexpress)
6. [Configuration d'EJS et des layouts](#configuration-dejs-et-des-layouts)
7. [Configuration de Sass](#configuration-de-sass)
8. [Création des templates](#création-des-templates)
9. [Création des routes](#création-des-routes)
10. [Gestion des assets statiques](#gestion-des-assets-statiques)
11. [Scripts npm](#scripts-npm)
12. [Démarrage du projet](#démarrage-du-projet)
13. [Bonnes pratiques](#bonnes-pratiques)

---

## 🔧 Prérequis

Avant de commencer, assurez-vous d'avoir installé :

-   **Node.js** (version 18 ou supérieure)
-   **npm** (installé avec Node.js)
-   Un éditeur de code (VS Code recommandé)
-   Un navigateur web moderne

### Vérification des installations

```bash
node --version
npm --version
```

---

## 🚀 Initialisation du projet

### 1. Créer le dossier du projet

```bash
mkdir portfolio
cd portfolio
```

### 2. Initialiser le projet npm

```bash
npm init -y
```

Cette commande crée un fichier `package.json` avec les informations de base.

### 3. Modifier le package.json

Ouvrez le fichier `package.json` et ajoutez/modifiez :

```json
{
    "name": "portfolio",
    "version": "1.0.0",
    "description": "Portfolio personnel",
    "type": "module",
    "main": "src/server.js",
    "scripts": {
        "dev": "nodemon src/server.js",
        "start": "node src/server.js",
        "sass": "sass scss/main.scss:public/css/main.css",
        "sass:watch": "sass --watch scss:public/css --style expanded",
        "build": "sass scss/main.scss:public/css/main.css --style compressed"
    },
    "keywords": ["portfolio", "developpeur", "web"],
    "author": "Votre Nom",
    "license": "MIT"
}
```

**Explication des champs importants :**

-   `"type": "module"` : Active les modules ES6 (import/export)
-   `"main"` : Point d'entrée de l'application
-   `"scripts"` : Commandes personnalisées

---

## 📦 Installation des dépendances

### Dépendances principales (production)

```bash
npm install express ejs express-ejs-layouts
```

**Explication :**

-   **express** : Framework web pour Node.js
-   **ejs** : Moteur de templates (permet d'écrire du HTML avec du JavaScript)
-   **express-ejs-layouts** : Extension pour créer des layouts réutilisables

### Dépendances de développement

```bash
npm install --save-dev nodemon sass
```

**Explication :**

-   **nodemon** : Redémarre automatiquement le serveur lors des modifications
-   **sass** : Compilateur CSS avec fonctionnalités avancées

---

## 📁 Structure des dossiers

Créez la structure suivante :

```
portfolio/
├── src/
│   ├── server.js
│   ├── routes/
│   │   └── index.js
│   └── views/
│       ├── layouts/
│       │   └── base.ejs
│       ├── partials/
│       │   ├── header.ejs
│       │   └── footer.ejs
│       └── pages/
│           ├── index.ejs
│           ├── cv.ejs
│           └── mentions-legales.ejs
├── public/
│   ├── css/
│   ├── js/
│   └── img/
├── scss/
│   └── main.scss
├── docs/
└── package.json
```

### Création des dossiers

```bash
mkdir -p src/routes src/views/layouts src/views/partials src/views/pages
mkdir -p public/css public/js public/img
mkdir scss docs
```

---

## ⚙️ Configuration d'Express

### 1. Créer le fichier serveur principal

**Fichier : `src/server.js`**

```javascript
import express from "express";
import expressLayouts from "express-ejs-layouts";
import path from "node:path";
import { fileURLToPath } from "node:url";
import routes from "./routes/index.js";

// Configuration des chemins (nécessaire avec ES modules)
const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const app = express();

/* -------- Configuration EJS + Layouts -------- */
app.set("view engine", "ejs");
app.set("views", path.join(__dirname, "views"));

app.use(expressLayouts);
app.set("layout", "layouts/base");

/* -------- Fichiers statiques -------- */
app.use(express.static(path.join(__dirname, "..", "public")));

/* -------- Routes -------- */
app.use("/", routes);

/* -------- Gestion 404 -------- */
app.use((req, res) => {
    res.status(404).render("pages/404", {
        title: "Page introuvable",
        pagePath: req.originalUrl,
    });
});

/* -------- Démarrage du serveur -------- */
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
    console.log(`✅ Serveur démarré sur http://localhost:${PORT}`);
});
```

**Explication ligne par ligne :**

1. **Imports** : Importation des modules nécessaires
2. **\_\_dirname** : Récupération du chemin du dossier actuel (nécessaire avec ES modules)
3. **Configuration EJS** : Définition du moteur de templates et du dossier des vues
4. **Layouts** : Activation des layouts et définition du layout par défaut
5. **Fichiers statiques** : Servir les fichiers CSS, JS, images depuis le dossier `public`
6. **Routes** : Importation des routes
7. **404** : Gestion des pages non trouvées
8. **Démarrage** : Lancement du serveur sur le port 3000

---

## 🎨 Configuration d'EJS et des layouts

### Qu'est-ce qu'EJS ?

EJS (Embedded JavaScript) est un moteur de templates qui permet d'écrire du HTML avec du JavaScript intégré.

**Syntaxe EJS :**

-   `<% code %>` : Exécute du JavaScript (invisible dans le HTML)
-   `<%= variable %>` : Affiche une variable (échappée)
-   `<%- html %>` : Affiche du HTML (non échappé)

### 1. Créer le layout principal

**Fichier : `src/views/layouts/base.ejs`**

```html
<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />

        <!-- Variables SEO -->
        <title><%= title || 'Mon Portfolio' %></title>
        <meta
            name="description"
            content="<%= metaDescription || 'Portfolio personnel' %>"
        />

        <!-- CSS -->
        <link rel="stylesheet" href="/css/main.css" />
    </head>
    <body>
        <!-- Header (commun à toutes les pages) -->
        <%- include('../partials/header') %>

        <!-- Contenu principal (variable selon la page) -->
        <main class="container"><%- body %></main>

        <!-- Footer (commun à toutes les pages) -->
        <%- include('../partials/footer') %>

        <!-- Scripts -->
        <script src="/js/main.js" defer></script>

        <!-- Scripts spécifiques à chaque page -->
        <%- typeof pageScripts !== 'undefined' ? pageScripts : '' %>
    </body>
</html>
```

**Explication :**

-   `<%- body %>` : Emplacement où sera inséré le contenu de chaque page
-   `<%- include() %>` : Inclusion d'autres templates (partiels)
-   `|| 'valeur par défaut'` : Valeur par défaut si la variable n'existe pas

### 2. Créer le header

**Fichier : `src/views/partials/header.ejs`**

```html
<header class="site-header">
    <div class="container">
        <nav class="navbar">
            <!-- Logo -->
            <a href="/" class="logo">
                <img src="/img/logo.png" alt="Logo" />
            </a>

            <!-- Menu -->
            <ul class="nav-menu">
                <li>
                    <a
                        href="/"
                        class="<%= req.originalUrl === '/' ? 'active' : '' %>"
                    >
                        Accueil
                    </a>
                </li>
                <li>
                    <a
                        href="/cv"
                        class="<%= req.originalUrl.startsWith('/cv') ? 'active' : '' %>"
                    >
                        CV
                    </a>
                </li>
                <li>
                    <a href="/mentions-legales"> Mentions légales </a>
                </li>
            </ul>
        </nav>
    </div>
</header>
```

### 3. Créer le footer

**Fichier : `src/views/partials/footer.ejs`**

```html
<footer class="site-footer">
    <div class="container">
        <p>
            &copy; <span id="year"></span> Mon Portfolio. Tous droits réservés.
        </p>
    </div>

    <script>
        document.getElementById("year").textContent = new Date().getFullYear();
    </script>
</footer>
```

---

## 🎯 Création des routes

### Qu'est-ce qu'une route ?

Une route détermine comment l'application répond à une demande client pour un endpoint spécifique (URL + méthode HTTP).

**Fichier : `src/routes/index.js`**

```javascript
import { Router } from "express";
const router = Router();

// Page d'accueil
router.get("/", (req, res) => {
    res.render("pages/index", {
        title: "Accueil",
        metaDescription: "Bienvenue sur mon portfolio",
        req, // Nécessaire pour les templates
    });
});

// Page CV
router.get("/cv", (req, res) => {
    res.render("pages/cv", {
        title: "CV",
        metaDescription: "Mon curriculum vitae",
        req,
    });
});

// Page mentions légales
router.get("/mentions-legales", (req, res) => {
    res.render("pages/mentions-legales", {
        title: "Mentions légales",
        metaDescription: "Informations légales",
        req,
    });
});

export default router;
```

**Explication :**

-   `router.get()` : Définit une route pour les requêtes GET
-   `res.render()` : Rend une vue EJS avec des données
-   `req` : Objet contenant les informations de la requête (nécessaire pour les templates)

---

## 🎨 Configuration de Sass

### Qu'est-ce que Sass ?

Sass est un préprocesseur CSS qui ajoute des fonctionnalités au CSS standard :

-   Variables
-   Imbrication
-   Mixins
-   Fonctions

### 1. Créer le fichier Sass principal

**Fichier : `scss/main.scss`**

```scss
// Variables
$primary-color: #3498db;
$secondary-color: #2c3e50;
$font-family: "Arial", sans-serif;

// Reset CSS
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

// Styles de base
body {
    font-family: $font-family;
    line-height: 1.6;
    color: $secondary-color;
}

// Container
.container {
    max-width: 1200px;
    margin: 0 auto;
    padding: 0 20px;
}

// Header
.site-header {
    background-color: $primary-color;
    padding: 1rem 0;

    .navbar {
        display: flex;
        justify-content: space-between;
        align-items: center;

        .logo img {
            height: 50px;
        }

        .nav-menu {
            display: flex;
            list-style: none;
            gap: 2rem;

            a {
                color: white;
                text-decoration: none;
                transition: color 0.3s;

                &:hover,
                &.active {
                    color: #ecf0f1;
                    text-decoration: underline;
                }
            }
        }
    }
}

// Footer
.site-footer {
    background-color: $secondary-color;
    color: white;
    text-align: center;
    padding: 2rem 0;
    margin-top: 3rem;
}

// Responsive
@media (max-width: 768px) {
    .nav-menu {
        flex-direction: column;
        gap: 1rem;
    }
}
```

### 2. Compiler Sass

```bash
npm run sass
```

Cette commande compile le fichier `scss/main.scss` en `public/css/main.css`.

---

## 📄 Création des pages

### 1. Page d'accueil

**Fichier : `src/views/pages/index.ejs`**

```html
<% // Variables spécifiques à cette page title = 'Accueil | Mon Portfolio';
metaDescription = 'Bienvenue sur mon portfolio de développeur web'; %>

<section class="hero">
    <h1>Bienvenue sur mon portfolio</h1>
    <p>Développeur web passionné</p>
    <a href="/cv" class="btn btn-primary">Voir mon CV</a>
</section>

<section class="about">
    <h2>À propos</h2>
    <p>Je suis un développeur web avec X années d'expérience...</p>
</section>

<section class="contact">
    <h2>Contact</h2>
    <p>Email : contact@monportfolio.com</p>
</section>
```

### 2. Page CV

**Fichier : `src/views/pages/cv.ejs`**

```html
<% // Variables SEO title = 'CV | Mon Portfolio'; metaDescription = 'Mon
curriculum vitae détaillé'; pagePath = req.originalUrl; // Scripts spécifiques
pageScripts = `
<script
    src="https://kit.fontawesome.com/xxxxx.js"
    crossorigin="anonymous"
></script>
`; %>

<section class="cv-header">
    <h1>Mon Curriculum Vitae</h1>
</section>

<section class="experience">
    <h2>Expérience</h2>
    <div class="job">
        <h3>Développeur Web - Entreprise XYZ</h3>
        <p class="period">2020 - Présent</p>
        <p>Description du poste et des responsabilités...</p>
    </div>
</section>

<section class="education">
    <h2>Formation</h2>
    <div class="diploma">
        <h3>Master en Informatique</h3>
        <p class="period">2018 - 2020</p>
        <p>Université XYZ</p>
    </div>
</section>

<section class="skills">
    <h2>Compétences</h2>
    <ul>
        <li>HTML/CSS</li>
        <li>JavaScript</li>
        <li>Node.js</li>
        <li>Express</li>
    </ul>
</section>
```

### 3. Page mentions légales

**Fichier : `src/views/pages/mentions-legales.ejs`**

```html
<% title = 'Mentions légales | Mon Portfolio'; metaDescription = 'Informations
légales du site'; %>

<section class="legal">
    <h1>Mentions légales</h1>

    <h2>Éditeur du site</h2>
    <p>
        Nom : Votre Nom<br />
        Email : contact@monportfolio.com<br />
        Responsable de la publication : Votre Nom
    </p>

    <h2>Hébergement</h2>
    <p>
        Hébergeur : Nom de l'hébergeur<br />
        Adresse : Adresse de l'hébergeur
    </p>

    <h2>Propriété intellectuelle</h2>
    <p>Tous les contenus de ce site sont protégés par les droits d'auteur.</p>
</section>
```

---

## 📁 Gestion des assets statiques

### Structure du dossier public

```
public/
├── css/
│   ├── main.css (généré par Sass)
│   └── main.css.map
├── js/
│   └── main.js
└── img/
    ├── logo.png
    └── autres-images.jpg
```

### Fichier JavaScript principal

**Fichier : `public/js/main.js`**

```javascript
// Code JavaScript commun à toutes les pages

// Exemple : Animation au scroll
window.addEventListener("scroll", () => {
    const header = document.querySelector(".site-header");
    if (window.scrollY > 100) {
        header.classList.add("scrolled");
    } else {
        header.classList.remove("scrolled");
    }
});

// Exemple : Menu burger (mobile)
const toggleMenu = () => {
    const menu = document.querySelector(".nav-menu");
    menu.classList.toggle("active");
};
```

---

## 🔧 Scripts npm

### Scripts définis dans package.json

```json
{
    "scripts": {
        "dev": "nodemon src/server.js",
        "start": "node src/server.js",
        "sass": "sass scss/main.scss:public/css/main.css",
        "sass:watch": "sass --watch scss:public/css --style expanded",
        "build": "sass scss/main.scss:public/css/main.css --style compressed"
    }
}
```

### Utilisation des scripts

```bash
# Développement (redémarrage automatique)
npm run dev

# Production
npm start

# Compiler Sass une fois
npm run sass

# Compiler Sass en continu (watch)
npm run sass:watch

# Compiler Sass pour la production (minifié)
npm run build
```

---

## 🚀 Démarrage du projet

### 1. Première compilation

```bash
npm run sass
```

### 2. Démarrage du serveur

```bash
npm run dev
```

### 3. Accès au site

-   Accueil : http://localhost:3000
-   CV : http://localhost:3000/cv
-   Mentions légales : http://localhost:3000/mentions-legales

---

## 📋 Checklist de vérification

### Avant de démarrer

-   [ ] Node.js installé
-   [ ] Dépendances installées (`npm install`)
-   [ ] Structure de dossiers créée
-   [ ] Fichiers de base créés

### Fonctionnalités à tester

-   [ ] Page d'accueil s'affiche
-   [ ] Navigation entre les pages
-   [ ] Styles CSS appliqués
-   [ ] Images affichées
-   [ ] Menu actif (classe active)
-   [ ] Responsive design

### En cas d'erreur

1. **Erreur "Cannot find module"** : Vérifiez les chemins dans les imports
2. **Erreur "req is not defined"** : Assurez-vous de passer `req` dans `res.render()`
3. **CSS non appliqué** : Vérifiez que Sass est compilé et que le chemin CSS est correct
4. **404 sur les assets** : Vérifiez la configuration des fichiers statiques

---

## 🎯 Bonnes pratiques

### 1. Organisation du code

-   Séparer la logique (routes) de la présentation (views)
-   Utiliser des partiels pour éviter la duplication
-   Organiser les fichiers par type (layouts, partials, pages)

### 2. Performance

-   Minifier le CSS en production (`npm run build`)
-   Optimiser les images
-   Utiliser `defer` pour les scripts non critiques

### 3. Sécurité

-   Valider les données utilisateur
-   Utiliser des variables d'environnement pour les données sensibles
-   Éviter d'exposer les erreurs détaillées en production

### 4. Maintenance

-   Commenter le code complexe
-   Utiliser des noms de variables explicites
-   Maintenir la documentation à jour

---

## 🔄 Évolutions possibles

### Fonctionnalités à ajouter

1. **Formulaire de contact** avec validation
2. **Système de blog** avec articles
3. **Galerie de projets** avec filtres
4. **Mode sombre/clair**
5. **Multi-langue**
6. **API REST** pour les données
7. **Base de données** (MongoDB, PostgreSQL)
8. **Authentification** utilisateur
9. **PWA** (Progressive Web App)
10. **Tests** unitaires et d'intégration

### Technologies complémentaires

-   **Tailwind CSS** : Framework CSS utilitaire
-   **Alpine.js** : Framework JavaScript léger
-   **Socket.io** : Communication temps réel
-   **Helmet** : Sécurité Express
-   **Morgan** : Logging des requêtes

---

## 📚 Ressources utiles

### Documentation officielle

-   [Node.js](https://nodejs.org/docs)
-   [Express](https://expressjs.com/)
-   [EJS](https://ejs.co/)
-   [Sass](https://sass-lang.com/)

### Tutoriels

-   [MDN Web Docs](https://developer.mozilla.org/)
-   [W3Schools](https://www.w3schools.com/)
-   [FreeCodeCamp](https://www.freecodecamp.org/)

### Outils

-   [VS Code](https://code.visualstudio.com/)
-   [Postman](https://www.postman.com/) : Test d'API
-   [Git](https://git-scm.com/) : Versioning

---

## 🎓 Exercices pratiques

### Exercice 1 : Ajouter une page "Projets"

1. Créer la route `/projets`
2. Créer le template `pages/projets.ejs`
3. Ajouter le lien dans le menu
4. Styliser la page avec Sass

### Exercice 2 : Créer un formulaire de contact

1. Ajouter un formulaire HTML
2. Créer la route POST pour traiter les données
3. Valider les données côté serveur
4. Afficher un message de confirmation

### Exercice 3 : Améliorer le responsive

1. Créer un menu burger pour mobile
2. Adapter les tailles de police
3. Optimiser les images pour mobile
4. Tester sur différents appareils

---

**Félicitations ! Vous avez maintenant toutes les connaissances pour créer un portfolio professionnel avec Node.js, Express, EJS et Sass. 🎉**

Ce guide vous servira de référence pour vos futurs projets web. N'hésitez pas à expérimenter et à ajouter vos propres fonctionnalités !
