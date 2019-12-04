
{% extends "../common/_app.tpl" %}

{% block title %}
<title>{{caseDetail.title}} - 上海莱耀照明科技有限公司</title>
{% endblock %}

{% block css %}
<link rel="stylesheet" href="/public/css/case.css">
{% endblock %}



{% block body %}
<div class="container">
  <div class="case-detail">
    <h1 class="case-title">{{caseDetail.title}}</h1>
    <div class="case-summary">{{caseDetail.summary}}</div>
    <div class="case-content">{{caseDetail.content | safe}}</div>
  </div>
</div>
{% endblock %}




