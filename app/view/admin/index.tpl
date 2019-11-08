{% set currMenu = {main: 'home', sub: 'home'} %}
{% set pageTitle = 'This is Index Page' %}
{% extends "./layout/_layout.tpl" %}

{% block body%}
  index page: {{ pageTitle }} {{pageName}}
{% endblock %}