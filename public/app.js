document.addEventListener('DOMContentLoaded', () => {
    const buyButtons = document.querySelectorAll('.buy-btn');

    buyButtons.forEach(button => {
        button.addEventListener('click', (e) => {
            const plan = e.target.getAttribute('data-plan');
            alert(`Thanks for choosing the ${plan} plan! We are setting up your cart.`);
        });
    });
});
