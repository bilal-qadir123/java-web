

const wrapper = document.querySelector('.wrapper');
const loginLink = document.querySelector('.login-link');
const registerLink = document.querySelector('.register-link');

const aboutLink = document.getElementById("about-link");
const servicesLink = document.getElementById("services-link");
const contactLink = document.getElementById("contact-link");

const aboutModal = document.getElementById("about-modal");
const servicesModal = document.getElementById("services-modal");
const contactModal = document.getElementById("contact-modal");

registerLink.addEventListener('click', () => {
    wrapper.classList.add('active');
});

loginLink.addEventListener('click', () => {
    wrapper.classList.remove('active');
});

aboutLink.addEventListener("click", () => {
    aboutModal.style.display = "block";
});

servicesLink.addEventListener("click", () => {
    servicesModal.style.display = "block";
});

contactLink.addEventListener("click", () => {
    contactModal.style.display = "block";
});

document.querySelectorAll(".close").forEach(closeButton => {
    closeButton.addEventListener("click", () => {
        aboutModal.style.display = "none";
        servicesModal.style.display = "none";
        contactModal.style.display = "none";
    });
});

window.onclick = function(event) {
    if (event.target == aboutModal || event.target == servicesModal || event.target == contactModal) {
        aboutModal.style.display = "none";
        servicesModal.style.display = "none";
        contactModal.style.display = "none";
    }
};

