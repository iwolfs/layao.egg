

<!DOCTYPE html>
<html lang="en">
<head>
  {% block title %}<title>CMS管理系统-莱耀照明科技有限公司</title>{% endblock %}
  {% block head %} 
    {% include "../includes/_head.tpl" %}
  {% endblock %}
</head>
<body class="app sidebar-mini rtl">
  {% block header %} 
    {% include "../includes/_header.tpl" %}
  {% endblock %}

  {% block sidebar %}
    {% include "../includes/_sidebar.tpl" %}
  {% endblock %}

  <main class="app-content">
    {% block body %} <div>No body</div> {% endblock %}
  </main>

  {% block footer %} 
    
  {% endblock %}

  {% include "../includes/_javascript.tpl" %}
  {% block bottom %} {% endblock %}
</body>
</html>