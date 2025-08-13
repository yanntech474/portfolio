// Navigation bar effects on scroll
window.addEventListener("scroll",function(){
    const header = this.document.querySelector("header");
    header.classList.toggle("sticky", window.scrollY > 0);
});
// Services section - Modal
const serviceModals = document.querySelectorAll(".service-modal");
const learnmoreBtns = document.querySelectorAll(".learn-more-btn");
const modalCloseBtns = document.querySelectorAll(".modal-close-btn");
var modal = function(modalClick) {
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

// Our clients - swiper

// website dark/light theme

// Scroll to top button

// Navigation menu item active on page scroll

// responsive navigation menu toggle

// Scroll reveal animations 

// Scroll reveal options to create reaveal animations


// Target elements ,and specify options to create reveal animations

