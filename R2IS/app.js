$(document).ready(function () {
    $("#sale").load("sale.php");
    $("#main").load("home.php");

    $(document).on("click", ".link", function (e) {
        e.preventDefault();  // blokada domyslnej akcjis
        $("#main").load($(this).attr("link"));
    });
});