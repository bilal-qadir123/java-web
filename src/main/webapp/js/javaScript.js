

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


function checkPasswordStrength() {
    var password = document.getElementById("password").value;
    var meter = document.getElementById("password-strength-text");
    var message = document.getElementById("password-strength-message");
    var strength = 0;

    if (password.length >= 8) {
        strength += 2;
    }

    if (password.match(/[a-z]+/) && (password.length >= 6)) {
        strength += 1;
    }

    if (password.match(/[A-Z]+/) && (password.length >= 6)) {
        strength += 1;
    }

    if (password.match(/[0-9]+/) && (password.length >= 6)) {
        strength += 1;
    }

    if (password.match(/[@$!%*?&]+/) && (password.length >= 6)) {
        strength += 3;
    }

    if (password.length === 0) {
        meter.style.width = "0%";
        message.textContent = "";
    } else if (strength === 1) {
        meter.style.width = "20%";
        meter.style.backgroundColor = "#ff0015";
        message.textContent = "Password may contain '@, $, &' to improve strength";
    }
    else if (strength === 2) {
        meter.style.width = "40%";
        meter.style.backgroundColor = "#ff8800";
        message.textContent = "Your password is weak";
    }
    else if (strength === 3) {
        meter.style.width = "60%";
        meter.style.backgroundColor = "#fffb00";
        message.textContent = "Your password is medium";
    } else if (strength === 4) {
        meter.style.width = "80%";
        meter.style.backgroundColor = "#c8ff00b9";
        message.textContent = "Your password is strong";
    } else if (strength === 5) {
        meter.style.width = "100%";
        meter.style.backgroundColor = "#66ff00";
        message.textContent = "Your password is very strong";
    }
 }
