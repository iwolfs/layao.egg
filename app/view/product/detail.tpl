
{% extends "../common/_app.tpl" %}

{% block title %}
<title>{{product.title}} - 上海莱耀照明科技有限公司</title>
{% endblock %}

{% block css %}
<link rel="stylesheet" href="/public/css/product.css">
{% endblock %}



{% block body %}
<div class="container">
  <div class="product-detail">
    <h1 class="product-title">{{product.title}}</h1>
    <div class="product-summary">{{product.summary}}</div>
    <div class="product-content">{{product.content | safe}}</div>
  </div>
</div>
{% endblock %}




