// Dark mode toggle functionality
const darkModeToggle = document.getElementById('dark-mode-toggle');

// Check if dark mode is enabled in localStorage and apply it
if (localStorage.getItem('darkMode') === 'true') {
    document.body.classList.toggle('latex-dark');
}

// Add event listener for dark mode toggle button
darkModeToggle.addEventListener('click', () => {
    document.body.classList.toggle('latex-dark');
    if (localStorage.getItem('darkMode') === 'true') {
        localStorage.setItem('darkMode', 'false');
    } else {
        localStorage.setItem('darkMode', 'true');
    }
});
