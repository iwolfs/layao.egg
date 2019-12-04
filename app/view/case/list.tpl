
{% extends "../common/_app.tpl" %}

{% block title %}
<title>客户案例-上海莱耀照明科技有限公司</title>
{% endblock %}

{% block css %}
<link rel="stylesheet" href="/public/css/case.css">
{% endblock %}

{% block body %}
  <div class="container">
    <div class="section">
      <ul class="case-list">
        {% for item in cases.list %}
        <li class="case-item">
          <div class="case-item-box">
            <div class="case-cover">
              <a href="/case/{{item.id}}" target="_blank"><img src={{item.cover}} alt={{item.title}}></a>
            </div>
            <div class="case-title"><a href="/case/{{item.id}}" target="_blank">{{item.title}}</a></div>
          </div>
        </li>
        {% endfor %}
      </ul>
    </div>
  </div>
{% endblock %}




