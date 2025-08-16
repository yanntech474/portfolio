// Navigation bar effects on scroll
window.addEventListener("scroll", function () {
    const header = this.document.querySelector("header");
    header.classList.toggle("sticky", window.scrollY > 0);
});
// Services section - Modal
const serviceModals = document.querySelectorAll(".service-modal");
const learnmoreBtns = document.querySelectorAll(".learn-more-btn");
const modalCloseBtns = document.querySelectorAll(".modal-close-btn");
var modal = function (modalClick) {
    serviceModals[modalClick].classList.add("active");
}
learnmoreBtns.forEach((learnmoreBtn, i) => {
    learnmoreBtn.addEventListener("click", () => {
        modal(i);
    });
});
modalCloseBtns.forEach((modalCloseBtn, i) => {
    modalCloseBtn.addEventListener("click", () => {
        serviceModals[i].classList.remove("active");
    });
});


// Portfolio section - Modal
// filter portfolio  cards according to portfolio tabs
document.addEventListener("DOMContentLoaded", function () {
    const portfolioTabs = document.querySelectorAll(".portfolio-tabs");
    const portfolioTabBtns = document.querySelectorAll(".tab-btn");
    const cardsWithModals = document.querySelectorAll(".portfolio-container .card-with-modal");
    portfolioTabBtns.forEach((tabBtn) => {
        tabBtn.addEventListener("click", () => {
            const filter = tabBtn.getAttribute("data-filter");
            cardsWithModals.forEach((cardsWithModal) => {
                if (filter === "all" || cardsWithModal.classList.contains(filter)) {

                    cardsWithModal.classList.remove("hidden");

                    setTimeout(() => {
                        cardsWithModal.style.opacity = 1;
                        cardsWithModal.style.transition = "0.5s ease";
                    }, 1);
                   }
                       
                else {
                    cardsWithModal.classList.add("hidden");
                    setTimeout(() => {
                        cardsWithModal.style.opacity = 0;
                        cardsWithModal.style.transition = "0.5s ease";
                    }, 1);
                }
            });
            // add active class to the clicked tab button
            portfolioTabBtns.forEach((btn) => {
                btn.classList.remove("active");
            });
            tabBtn.classList.add("active"); 
        });
    });
});

// Fonction pour gérer l'animation des modales
const animateModal = (backdrop, modal, isOpening) => {
    if (isOpening) {
        backdrop.style.display = "flex";
        backdrop.classList.add("active");
        modal.style.transform = "scale(1)";
        modal.style.opacity = "1";
    } else {
        backdrop.classList.remove("active");
        setTimeout(() => {
            backdrop.style.display = "none";
            modal.style.transform = "scale(0)";
            modal.style.opacity = "0";
        }, 300);
    }
};

// open and close portfolio modal
const portfolioCardsWithModals = document.querySelectorAll(".portfolio-container .card-with-modal");

portfolioCardsWithModals.forEach((portfolioCardWithModal) => {
    const portfolioCard = portfolioCardWithModal.querySelector(".portfolio-card");
    const portfolioBackdrop = portfolioCardWithModal.querySelector(".portfolio-modal-backdrop");
    const portfolioModal = portfolioCardWithModal.querySelector(".portfolio-modal");
    const modalCloseBtn = portfolioCardWithModal.querySelector(".modal-close-btn");

    // Ouvrir la modale quand on clique sur la carte
    portfolioCard.addEventListener("click", () => {
        portfolioBackdrop.style.display = "flex";
        portfolioBackdrop.classList.add("active");
        portfolioModal.style.transform = "scale(1)";
        portfolioModal.style.opacity = "1";
    });

    // Fermer la modale quand on clique sur le bouton fermer
    modalCloseBtn.addEventListener("click", () => {
        portfolioBackdrop.classList.remove("active");
        setTimeout(() => {
            portfolioBackdrop.style.display = "none";
            portfolioModal.style.transform = "scale(0)";
            portfolioModal.style.opacity = "0";
        }, 300);
    });

    // Fermer la modale quand on clique en dehors
    portfolioBackdrop.addEventListener("click", (e) => {
        if (e.target === portfolioBackdrop) {
            portfolioBackdrop.classList.remove("active");
            setTimeout(() => {
                portfolioBackdrop.style.display = "none";
                portfolioModal.style.transform = "scale(0)";
                portfolioModal.style.opacity = "0";
            }, 300);
        }
    });

    // Gestion des touches clavier
    document.addEventListener("keydown", (e) => {
        if (e.key === "Escape" && portfolioBackdrop.classList.contains("active")) {
            animateModal(portfolioBackdrop, portfolioModal, false);
        }
    });
});

// Our clients - swiper

// website dark/light theme

// Scroll to top button

// Navigation menu item active on page scroll

// responsive navigation menu toggle

// Scroll reveal animations

// Scroll reveal options to create reaveal animations


// Target elements ,and specify options to create reveal animations

