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


// Our clients - swiper

// website dark/light theme

// Scroll to top button

// Navigation menu item active on page scroll

// responsive navigation menu toggle

// Scroll reveal animations

// Scroll reveal options to create reaveal animations


// Target elements ,and specify options to create reveal animations

