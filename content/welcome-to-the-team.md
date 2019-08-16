---
title: "Dropdown Menus in Django-CMS"
date: 2019-05-18T12:21:14+03:00
draft: false
---

The most simple way to get dropdowns working in django-cms is to follow this: (In this example I am using Bootstrap styling framework for my menu)

In your base.html file (or any other name that you are using) use this way of showing your menu ```{% show_menu 0 10 10 10 %}``` As an example, this is what i used in my code in base.html to render the menu:
```
<ul>
    {% show_menu 0 10 10 10 "menu/custom-menu.html" %}
</ul>
```

Now create the template in the directory "/templates/menu/custom-menu.html" with these sekizai tags and similar html code that will overwrite your base.html and render your menu with drop-down elements:
```html
<!-- put the menu_tags at the top of the page -->
{% load menu_tags %}

<div class="dropdown">
    {% for child in children %}
<!-- no child pages  -->
        {% if child.is_leaf_node %}
            <li><a href="{{ child.get_absolute_url }}">{{child.get_menu_title }}</a></li>
        {% endif %}
<!-- /no child pages  -->
<!-- has child pages  -->
        {% if not child.is_leaf_node or child.ancestor %}
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                {{child.get_menu_title }}<b class="caret"></b></a>
                <ul class="dropdown-menu">
                    {% if child.get_descendants %}
                        {% for kid in child.get_descendants %}
                            <li>
                                <a href="{{ kid.get_absolute_url }}">
                                    {{kid.get_menu_title }}
                                </a>
                            </li>
                        {% endfor %}
                    {% endif %}
                </ul>
            </li>
        {% endif %}
<!-- /has child pages  -->
    {% endfor %} 
<!-- /end for child -->
</div>
```

