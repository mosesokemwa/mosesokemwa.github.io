---
title: "Getting Django models into admin"
date: 2020-12-10T22:17:14+03:00
draft: false
---

I needed a shortcut to register all my models in Django admin, spent a few hours tinkering and finllay found a shortcut.

The only downside is it registers everything, does not provide the custom options of including/excluding fields by putting fields that you need in the admin. If you feel creative, feel free to extend the functionality.

```python
from django.apps import apps
from django.contrib import admin


class ListAdminMixin(object):
    def __init__(self, model, admin_site):
        self.list_display = [field.name for field in model._meta.fields]
        super(ListAdminMixin, self).__init__(model, admin_site)


models = apps.get_models()
for model in models:
    admin_class = type('AdminClass', (ListAdminMixin, admin.ModelAdmin), {})
    try:
        admin.site.register(model, admin_class)
    except admin.sites.AlreadyRegistered:
        pass
```