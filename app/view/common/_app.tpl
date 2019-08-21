

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  {% block title %}<title>莱耀照明科技有限公司</title>{% endblock %}
  <link rel="stylesheet" href="/public/css/common.css">
  {% block css %} {% endblock %}
</head>
<body>
  {% block header %} 
    <div class="header">
      <div class="header-container">
        <div class="logo"><img src="/public/images/logo.png" alt=""></div>
        <ul class="navigation">
          <li class="nav-item"><a href="/">首页</a></li>
          <li class="nav-item"><a href="/about">关于我们</a></li>
          <li class="nav-item"><a href="/case">案例展示</a></li>
          <li class="nav-item"><a href="/contact">联系我们</a></li>
        </ul>
      </div>
    </div>
  {% endblock %}
  {% block body %} <div>No body</div> {% endblock %}
  {% block footer %} {% endblock %}
  {% block bottom %} {% endblock %}
</body>
</html>