---
title: "Image Unfurling"
date: 2019-12-25T17:58:00+03:00
draft: True
---

It takes a few steps to get the perfect preview for WhatsApp, Twitter, Facebook and bookmark icons for pc's and mobile devices. If you like reading go to ogp.me - but make sure to read steps 1 - 6 in this answer to get the best WhatsApp preview.

Please note: some apps or websites use cache or even store the website preview to their database. This means when you're testing your link in WhatsApp or Facebook for example, you'll most likely not see any difference right away. Using another link (another page) will do the trick. But as soon as you use that link once, this "please note" section starts all over again.

#### Step 1: title

Maximum of 65 characters

```html
<title>your keyword rich title of the website and/or webpage</title>
```
#### Step 2: description
Maximum of 155 characters

```html
<meta name="description" content="description of your website/webpage, make sure you use keywords!">
```
#### Step 3: og:title
Maximum 35 characters

```html
<meta property="og:title" content="short title of your website/webpage" />
```
#### Step 4: og:url
Full link to the current webpage address

```html
<meta property="og:url" content="https://www.example.com/webpage/" />
```

#### Step 5: og:description
Maximum 65 characters

```html
<meta property="og:description" content="description of your website/webpage">
```
#### Step 6: og:image
Image(JPG or PNG) with a size less than 300KB and minimum dimensions of 300 x 200

```html
<meta property="og:image" content="//cdn.example.com/uploads/images/webpage_300x200.png">
```

If you completed the steps above, you can now see your preview in WhatsApp! However, be aware of the ```please note``` section above.

#### Step 7: og:type
In order for your object to be represented within the graph, you need to specify its type. Here's a list of the global types available: http://ogp.me/#types. You can also specify your own types.

```html
<meta property="og:type" content="article" />
```

#### Step 8: og:locale

The locale of the resource. You can also use og:locale:alternate if you have other language translations available.

If you don't specify og:locale, it defaults to en_US.

```html
<meta property="og:locale" content="en_GB" />
<meta property="og:locale:alternate" content="fr_FR" />
<meta property="og:locale:alternate" content="es_ES" />
```
#### Step 9: Twitter

For the best Twitter support read this.

#### Step 10: Facebook

For the best Facebook support read this.

#### Step 11: favicon

For the best favicon support for all browsers and devices read this.

#### Bonus step 12: video/audio

It's also possible to share audio/video. Facebook and twitter for example share videos very well. Read ogp.me.

Original post on Stack Overflow [here](https://stackoverflow.com/a/43154489/7281451)