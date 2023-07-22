
// Añadir desplazamiento suave a las anclas
document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function (e) {
        e.preventDefault();

        const offsetTop = document.querySelector(this.getAttribute('href')).offsetTop;

        window.scrollTo({
            top: offsetTop - 70, // Ajusta el valor según sea necesario
            behavior: 'smooth'
        });
    });
});

function redirigirPsicologo() {
    window.location.href = "authentication/loginPsicologo.jsp";
}

function redirigirPaciente() {
    window.location.href = "authentication/loginPaciente.jsp";
}
