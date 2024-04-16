---
title: "Extracting Nested Query Params"
date: 2021-02-10T14:29:14+03:00
draft: false
---

This is a very niche problem I was trying to solve.

```
/api/v1/data?url=https://mysite.com/blog/blopost1?callbackUrl=https://webhook.com/api/me
```

In this link I needed to get the url and nested call back query params, when parsed to the api data endpoint
All this was a scope-creep and needed to ebe solved in the shorted time possible

My take: NodeJs is powerful, you just need to know where to look(documentation) and who to consult(documentation)


```javascript
const url = require('url'); //https://nodejs.org/api/url.html
const querystring = require('querystring'); // https://nodejs.org/api/querystring.html

let rawUrl = ctx.query.url;
let parsedUrl = url.parse(rawUrl);
let parsedQs = querystring.parse(parsedUrl.query);


// parsedQs = { callbackUrl: 'https://webhook.com/api/me' }
```

After calling ```url.parse(rawUrl)``` on our URL, this is what is returned to us:

```javascript
{
    protocol: 'https:',
    slashes: true,
    auth: null,
    host: 'mysite.com',
    port: null,
    hostname: 'mysite.com',
    hash: null,
    search: '?callbackUrl=https://webhook.com/api/me',
    query: 'callbackUrl=https://webhook.com/api/me',
    pathname: '/',
    path: '/?page=2&limit=3',
    href: 'https://mysite.com/blog/blopost1?callbackUrl=https://webhook.com/api/me'
}
```


While the actual act of retrieving this data is very simple, understanding where this info comes from and what it is can be confusing for some beginners. Hopefully this article cleared some things up for you.
