const spanContainers = document.querySelectorAll(".span-container span");

spanContainers.forEach((span) => {
    const text = span.textContent;
    span.innerHTML = ""; // On vide le texte original

    text.split("").forEach((char, index) => {
        // Vérifie si c'est un espace et insère un "espace insécable"
        const spanChar = document.createElement("span");
        spanChar.textContent = char === " " ? "\u00A0" : char;
        spanChar.style.transitionDelay = `${0.07 * index}s`;
        span.appendChild(spanChar);
    });
});

const txtAnim = document.getElementById("para");

new Typewriter(txtAnim, {
    deleteSpeed: 10,
})

    .changeDelay(30)
    .typeString("Développeur web")
    .pauseFor(500)
    .typeString("<strong> Full-Stack</strong> !")
    .pauseFor(500)
    .typeString(
        '<span style="color:rgb(247, 119, 0);"><strong> HTML</strong></span> '
    )
    .pauseFor(500)

    .typeString('<span style="color: #27ae60;"><strong>, CSS</strong></span> ')
    .pauseFor(500)

    .typeString(
        '<span style="color:rgb(94, 76, 252);"><strong>, PHP</strong></span> '
    )
    .pauseFor(500)

    .typeString(
        '<span style="color:rgb(236, 178, 18);"><strong>, JavaScript</strong></span> !'
    )
    .start();

document.addEventListener("DOMContentLoaded", () => {
    const elements = document.querySelectorAll(
        ".section, .section-a-propos, .from-left, .from-right"
    );

    const observer = new IntersectionObserver(
        (entries) => {
            entries.forEach((entry) => {
                if (entry.isIntersecting) {
                    entry.target.classList.add("visible");
                    observer.unobserve(entry.target);
                }
            });
        },
        { threshold: 0.3 }
    );

    elements.forEach((el) => observer.observe(el));

    // Configuration des liens de réseaux sociaux
    configureSocialLinks();
});

// Fonction pour configurer les liens des réseaux sociaux
function configureSocialLinks() {
    // Email
    const emailLink = document.querySelector(".contact:nth-child(1) a");
    if (emailLink) {
        emailLink.href = "mailto:g.maignaut@gmail.com";
        emailLink.setAttribute("aria-label", "Envoyer un email");
    }

    // Twitter
    const twitterLink = document.querySelector(".contact:nth-child(2) a");
    if (twitterLink) {
        twitterLink.href = "https://twitter.com/GMaignaut";
        twitterLink.target = "_blank";
        twitterLink.rel = "noopener noreferrer";
        twitterLink.setAttribute("aria-label", "Visiter mon profil Twitter");
    }

    // LinkedIn
    const linkedinLink = document.querySelector(".contact:nth-child(3) a");
    if (linkedinLink) {
        linkedinLink.href = "https://www.linkedin.com/in/YomMgt";
        linkedinLink.target = "_blank";
        linkedinLink.rel = "noopener noreferrer";
        linkedinLink.setAttribute("aria-label", "Visiter mon profil LinkedIn");
    }

    // GitHub
    const githubLink = document.querySelector(".contact:nth-child(4) a");
    if (githubLink) {
        githubLink.href = "https://github.com/Guillaume0402";
        githubLink.target = "_blank";
        githubLink.rel = "noopener noreferrer";
        githubLink.setAttribute("aria-label", "Visiter mon profil GitHub");
    }
}
