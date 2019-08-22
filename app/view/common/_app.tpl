
{% import "./header.tpl" as header %}

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  {% block title %}<title>莱耀照明科技有限公司</title>{% endblock %}
  <link rel="stylesheet" href="/public/css/iconfont.css">
  <link rel="stylesheet" href="/public/css/common.css">
  {% block css %} {% endblock %}
</head>
<body>
  {% block header %} 
    {{header.getHeader()}}
  {% endblock %}

  {% block body %} <div>No body</div> {% endblock %}

  {% block footer %} 
    {% include "./footer.tpl" %} 
  {% endblock %}

  {% block bottom %} {% endblock %}
</body>
</html>