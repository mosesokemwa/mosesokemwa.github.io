---
title: "Django's session and cookie manipulation"
date: 2020-02-29T12:13:39+03:00
draft: false
---
Django provide direct cookie manipulation methods on the request and response objects (so you don't need a helper function).

Setting a cookie:

```python
def view(request):
  response = HttpResponse('blah')
  response.set_cookie('cookie_name', 'cookie_value')
```

Retrieving a cookie:

```python
def view(request):
  value = request.COOKIES.get('cookie_name')
  if value is None:
    # Cookie is not set

  # OR

  try:
    value = request.COOKIES['cookie_name']
  except KeyError:
```
