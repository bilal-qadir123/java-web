

const notifications = document.querySelector(".notifications");

const toastDetails = {
    timer: 5000,
    info: {
        icon: 'fa-circle-info',
        text: 'Click here to track your calories.',
    },
}

const removeToast = (toast) => {
    toast.classList.add("hide");
    if (toast.timeoutId) clearTimeout(toast.timeoutId);
    setTimeout(() => toast.remove(), 500);
}

const createToast = (id) => {
    const { icon, text } = toastDetails[id];
    const toast = document.createElement("li");
    toast.className = `toast ${id}`;
    toast.innerHTML = `<div class="column">
                            <i class="fa-solid ${icon}"></i>
                            <span>${text}</span>
                        </div>
                        <i class="fa-solid fa-xmark" onclick="removeToast(this.parentElement)"></i>`;
    notifications.appendChild(toast);

    toast.addEventListener('click', (event) => {
        if (!event.target.classList.contains('fa-xmark')) {
            window.location.href = 'calorie.jsp';
        }
    });

    toast.timeoutId = setTimeout(() => removeToast(toast), toastDetails.timer);
}

const startToastNotifications = () => {
    setTimeout(() => {
        createToast('info');

        setTimeout(() => {
            createToast('info');

            setTimeout(() => {
                createToast('info');
            }, 30000);

        }, 30000);

    }, 30000);
}

document.addEventListener("DOMContentLoaded", startToastNotifications);
