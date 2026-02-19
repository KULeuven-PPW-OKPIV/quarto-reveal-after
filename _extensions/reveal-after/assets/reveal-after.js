document.addEventListener("DOMContentLoaded", function() {
    const solutionElements = document.querySelectorAll(".reveal-after");
    let today = new Date();
    let releaseDate = new Date(reveal_after_date_string);

    if (reveal_after_override.toLowerCase() == "yes" || (today >= releaseDate && reveal_after_date_string.length > 0)) {
        solutionElements.forEach(el => {
            el.style.display = "block";
        });
    }
});