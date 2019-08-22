{% macro getHeader(fixed='')%}
  <div class="header {{fixed}}">
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
{% endmacro %}