var images = ["0.png", "1.png", "2.png", "3.png", "4.png", "5.png"];
var rand = images[Math.floor(Math.random() * images.length)];

$("img").on("error", function() {
  $(this).attr("src", "/images/" + rand);
});

// Or, hide them
$("img").on("error", function() {
  $(this).hide();
});