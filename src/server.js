import express           from 'express';
import expressLayouts    from 'express-ejs-layouts';   // ← NEW
import path              from 'node:path';
import { fileURLToPath } from 'node:url';
import routes            from './routes/index.js';

const __filename = fileURLToPath(import.meta.url);
const __dirname  = path.dirname(__filename);

const app = express();

/* -------- EJS + Layouts -------- */
app.set('view engine', 'ejs');
app.set('views', path.join(__dirname, 'views'));

app.use(expressLayouts);                  // ← NEW
app.set('layout', 'layouts/base');        // ← layout par défaut (views/layouts/base.ejs)

/* -------- Assets publics -------- */
app.use(express.static(path.join(__dirname, '..', 'public')));

/* -------- Routes -------- */
app.use('/', routes);

/* -------- 404 (optionnel) -------- */
app.use((req, res) => {
  res.status(404).render('pages/404', { title: 'Page introuvable', pagePath: req.originalUrl });
});

/* -------- Démarrage -------- */
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => console.log(`✅  Server ready on http://localhost:${PORT}`));
