<div class="container">
  <div class="section odd">
    <div class="section-title">客户案例</div>
    <div class="section-intro">彰显不凡气质，缔造经典空间</div>
    <div class="section-content home-case">
      <ul class="case-list">
        {% for item in cases %}
        <li class="case-item">
          <div class="case-item-box">
            <a href="/case/{{item.id}}"><img src={{item.img}} alt={{item.title}}></a>
            <div class="case-title"><a href="/case/{{item.id}}">{{item.title}}</a></div>
          </div>
        </li>
        {% endfor %}
      </ul>
    </div>
  </div>
</div>