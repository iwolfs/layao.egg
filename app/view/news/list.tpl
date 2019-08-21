{% extends "../common/_app.tpl" %}

{% block title %}
<title>新闻列表-上海莱耀照明科技有限公司</title>
{% endblock %}

{% block css %}
 <link rel="stylesheet" href="/public/css/news.css" />
{% endblock %}


{% block body %}
<ul class="news-view view">
  {% for item in list %}
    <li class="item">
      <a href="{{ item.url }}">{{ item.title }}</a>
    </li>
  {% endfor %}
</ul>
{% endblock %}

