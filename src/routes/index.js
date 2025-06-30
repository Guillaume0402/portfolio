import { Router } from "express";
const router = Router();

router.get("/", (req, res) =>
    res.render("pages/index", { title: "Accueil", req })
);

router.get("/cv", (req, res) => res.render("pages/cv", { title: "CV", req }));

router.get("/mentions-legales", (req, res) =>
    res.render("pages/mentions-legales", { title: "Mentions légales", req })
);

export default router;
