$(document).ready(function () {
    $("#sale").load("sale.php");
    $("#main").load("home.php");

    // Delegacja zdarzeń - obsługa kliknięć dla elementów .link, także tych ładowanych dynamicznie
    $(document).on("click", ".link", function (e) {
        e.preventDefault();  // blokujemy domyślną akcję kliknięcia
        $("#main").load($(this).attr("link"));
    });
});