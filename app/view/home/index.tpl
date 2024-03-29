
{% extends "../common/_app.tpl" %}
{% import "./banner.tpl" as banner %}
{% import "../common/header.tpl" as header %}

{% block title %}
<title>首页-上海莱耀照明科技有限公司</title>
{% endblock %}

{% block css %}
{{banner.css()}}
<link rel="stylesheet" href="/public/css/home.css">
{% endblock %}

{% block header %}
{{header.getHeader('fixed')}}
{% endblock %}

{% block body %}
{{banner.html()}}
{% include "./about.tpl" %}
{% include "./case.tpl" %}
{% include "./select.tpl" %}
{% endblock %}


{% block bottom %}
{{banner.js()}}
{% endblock %}


