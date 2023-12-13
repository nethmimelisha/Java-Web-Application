// script.js
function animateLoginSignUp() {
    const loginSignUp = document.querySelector('.menu li:nth-child(3) a');
    loginSignUp.addEventListener('mouseover', () => {
        loginSignUp.style.transform = 'scale(1.1)';
    });

    loginSignUp.addEventListener('mouseout', () => {
        loginSignUp.style.transform = 'scale(1)';
    });
}

function search() {
    const searchTerm = document.getElementById('searchBar').value;
    // Implement your search functionality here
    console.log(`Searching for: ${searchTerm}`);
}

// Call the animation function
animateLoginSignUp();

const sign_in_btn=document.querySelector("#sign-in-btn");
const sign_up_btn=document.querySelector("#sign-up-btn");
const container=document.querySelector(".container");

sign_up_btn.addEventListener('click', () => {
    container.classList.add("sign-up-mode");
});

sign_in_btn.addEventListener('click', () => {
    container.classList.remove("sign-up-mode");
});
