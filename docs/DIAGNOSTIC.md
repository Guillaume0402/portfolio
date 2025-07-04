# Guide de diagnostic et correction des problèmes d'affichage

## Problèmes identifiés et solutions

### 1. Footer - Alignement des colonnes

**Problème :** Le footer peut avoir des problèmes d'alignement entre les colonnes.

**Solution :** Vérifier la structure CSS Grid du footer.

```scss
.footer-content {
    display: grid;
    grid-template-columns: 1fr 1fr 1fr;
    gap: 60px;
    margin-bottom: 40px;

    @media screen and (max-width: 991px) {
        grid-template-columns: 1fr 1fr;
        gap: 40px;
    }

    @media screen and (max-width: 768px) {
        grid-template-columns: 1fr;
        gap: 40px;
        text-align: center;
    }
}
```

### 2. Header - Menu responsive

**Problème :** Le menu burger peut ne pas fonctionner correctement.

**Solution :** Vérifier la structure HTML et CSS du menu burger.

Structure HTML correcte :

```html
<input type="checkbox" id="toggle" />
<nav>
    <label class="burger" for="toggle">☰</label>
    <!-- reste du menu -->
</nav>
```

### 3. Slider - Responsive et affichage

**Problème :** Le slider peut déborder ou ne pas être responsive.

**Solution :** Utiliser des unités viewport et limiter la hauteur.

```scss
.slider {
    width: 100%;
    height: 70vh;
    max-height: 800px;

    @media screen and (max-width: 768px) {
        height: 60vh;
        max-height: 600px;
    }
}
```

### 4. JavaScript - Librairies manquantes

**Problème :** Les animations JavaScript peuvent ne pas fonctionner.

**Solution :** Vérifier que Typewriter.js est chargé.

```html
<script
    src="https://unpkg.com/typewriter-effect@latest/dist/core.js"
    defer
></script>
```

## Checklist de vérification

### CSS

-   [ ] Le CSS est compilé sans erreurs
-   [ ] Les variables Sass sont correctement importées
-   [ ] Les mixins responsive fonctionnent
-   [ ] Les gradients et animations sont actifs

### HTML/EJS

-   [ ] Les templates EJS sont correctement structurés
-   [ ] Les variables sont accessibles (req, title, etc.)
-   [ ] Les liens d'assets sont corrects (/css/main.css, /js/app.js)
-   [ ] Les images sont accessibles

### JavaScript

-   [ ] Les librairies externes sont chargées
-   [ ] Les fichiers JavaScript sont accessibles
-   [ ] Les sélecteurs DOM sont corrects
-   [ ] Les événements sont correctement attachés

### Responsive

-   [ ] Le header est fonctionnel sur mobile
-   [ ] Le slider s'adapte aux petits écrans
-   [ ] Le footer passe en colonne unique sur mobile
-   [ ] Les espacements sont cohérents

## Commandes utiles

```bash
# Compiler le CSS
npm run sass

# Compiler en mode watch
npm run sass:watch

# Démarrer le serveur
npm run dev

# Compiler en mode production
npm run build
```

## Tests à effectuer

1. **Desktop (1920px+)** : Vérifier l'affichage sur grand écran
2. **Tablet (768px - 1199px)** : Vérifier la grille 2 colonnes
3. **Mobile (< 768px)** : Vérifier la colonne unique et le menu burger
4. **Navigation** : Tester tous les liens et ancres
5. **Animations** : Vérifier les effets de hover et les animations

## Corrections spécifiques appliquées

### Migration Sass

-   Migration complète de `@import` vers `@use/@forward`
-   Création des fichiers `_index.scss` pour chaque dossier
-   Correction des références aux variables dans les mixins

### Footer moderne

-   Structure HTML sémantique avec `<nav>` et `aria-label`
-   Grid CSS 3 colonnes responsive
-   Hover effects colorés sur les réseaux sociaux
-   Ligne décorative en haut du footer

### Slider amélioré

-   Hauteur responsive avec `vh` et `max-height`
-   Titre avec gradient animé et effets visuels
-   Suppression des animations problématiques
-   Effet de parallaxe subtil

### Header fixe

-   Position fixe avec backdrop-filter
-   Menu burger fonctionnel
-   Logo avec effet de survol
-   Navigation responsive

## Validation finale

1. Vérifier le site sur différentes tailles d'écran
2. Tester la navigation et les liens
3. Vérifier les animations et transitions
4. Contrôler les performances et l'accessibilité
5. Valider le HTML et CSS
