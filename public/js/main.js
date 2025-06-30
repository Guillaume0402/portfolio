// public/js/main.js
/* ---------------------------------------------------------
   Script global (chargé sur toutes les pages)
   - Burger menu
   - Scroll fluide
   - Mise à jour de l’année
---------------------------------------------------------- */
document.addEventListener("DOMContentLoaded", () => {
    /* ------------------ Burger menu ------------------ */
    const burger = document.querySelector(".burger");
    const checkbox = document.querySelector("#toggle");
    const menu = document.querySelector(".header-menu");

    if (burger && checkbox && menu) {
        burger.addEventListener("click", () => {
            checkbox.checked = !checkbox.checked;
        });

        // Ferme le menu après clic sur un lien
        menu.querySelectorAll("a").forEach((link) => {
            link.addEventListener("click", () => (checkbox.checked = false));
        });
    }

    /* --------- Scroll fluide vers les ancres --------- */
    document.querySelectorAll('a[href^="/#"], a[href^="#"]').forEach((link) => {
        link.addEventListener("click", (e) => {
            const href = link.getAttribute("href");
            const id = href.replace(/^\/?#/, "");
            const target = document.getElementById(id);
            if (target) {
                e.preventDefault();
                target.scrollIntoView({ behavior: "smooth", block: "start" });
                history.pushState(null, "", `/#${id}`); // met à jour l’URL
            }
        });
    });

    /* ---------- Lien actif dans la nav header --------- */
    const currentPath = window.location.pathname;
    document.querySelectorAll(".header-menu a").forEach((a) => {
        if (
            a.getAttribute("href") === currentPath ||
            a.getAttribute("href") === `${currentPath}#`
        ) {
            a.classList.add("is-active");
        }
    });

    /* -------------- Année dynamique footer ------------ */
    document
        .querySelectorAll("#year")
        .forEach((el) => (el.textContent = new Date().getFullYear()));
});
