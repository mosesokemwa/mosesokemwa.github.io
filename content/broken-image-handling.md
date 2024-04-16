---
title: "Broken image handling with jQuery"
date: 2019-02-03T14:28:14+03:00
draft: false
---

Missing images will either just display nothing, or display a [ ? ] style box when their source cannot be found. Instead, you may want to replace that with a "missing image" graphic that you are sure exists so there is better visual feedback that something is wrong. Or, you might want to hide it entirely. This is possible because images that a browser can't find fire off an "error" JavaScript event we can watch for.

```javascript
// Jquery
// Replace source
$("img").on("error", function() {
  $(this).attr("src", "/images/missing.png");
});

// Or, hide them
$("img").on("error", function() {
  $(this).hide();
});
```

But what if you have thousands of images, seeing the same image when handling the missing image error can be boring to the user. So to make it fun, why not a bit further and select random images in an array.

```javascript
// Jquery
// Replace source

var images = ["0.png", "1.png", "2.png", "3.png", "4.png", "5.png"];
var rand = images[Math.floor(Math.random() * images.length)];

$("img").on("error", function() {
  $(this).attr("src", "/images/" + rand);
});

// Or, hide them
$("img").on("error", function() {
  $(this).hide();
});
```

the expansion potential for this piece of code is endless, so I'm going to have fun finding out what I can do with this
