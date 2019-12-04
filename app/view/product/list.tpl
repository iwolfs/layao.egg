
{% extends "../common/_app.tpl" %}

{% block title %}
<title>产品 - 上海莱耀照明科技有限公司</title>
{% endblock %}

{% block css %}
<link rel="stylesheet" href="/public/css/product.css">
{% endblock %}



{% block body %}
<div class="container">
  <div class="section">
    <ul class="product-list">
      {% for item in products.list %}
      <li class="product-item">
        <div class="product-item-box">
          <div class="product-cover">
            <a href="/product/{{item.id}}"><img src={{item.cover}} alt={{item.title}}></a>
          </div>
          <div class="product-title"><a href="/product/{{item.id}}">{{item.title}}</a></div>
        </div>
      </li>
      {% endfor %}
    </ul>
  </div>
</div>
{% endblock %}




