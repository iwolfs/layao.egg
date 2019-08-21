{% macro css() %}
<link href="https://cdn.bootcss.com/Swiper/4.5.0/css/swiper.min.css" rel="stylesheet">
{% endmacro %}

{% macro html() %}
<!-- Swiper -->
<div class="swiper-container">
  <div class="swiper-wrapper">
    <div class="swiper-slide"><img class="swiper-lazy" data-src="/public/images/banner/奥克斯长沙洋湖垸.jpg" alt=""></div>
    <div class="swiper-slide"><img class="swiper-lazy" data-src="/public/images/banner/海龙海鲜舫1.jpg" alt=""></div>
    <div class="swiper-slide"><img class="swiper-lazy" data-src="/public/images/banner/济宁恒信公馆.jpg" alt=""></div>
    <div class="swiper-slide"><img class="swiper-lazy" data-src="/public/images/banner/浦东新希望产业园鸟瞰.jpg" alt=""></div>
    <div class="swiper-slide"><img class="swiper-lazy" data-src="/public/images/banner/上海马戏城.jpg" alt=""></div>
    <div class="swiper-slide"><img class="swiper-lazy" data-src="/public/images/banner/西安环普工业园.jpg" alt=""></div>
    <div class="swiper-slide"><img class="swiper-lazy" data-src="/public/images/banner/振石酒店.jpg" alt=""></div>
    
  </div>
  <div class="swiper-button-prev"></div><!--左箭头。如果放置在swiper-container外面，需要自定义样式。-->
  <div class="swiper-button-next"></div><!--右箭头。如果放置在swiper-container外面，需要自定义样式。-->
  <!-- Add Pagination -->
  <div class="swiper-pagination"></div>
</div>
{% endmacro %}

{% macro js() %}
<!-- Swiper JS -->
<script class="swiper-lazy" src="https://cdn.bootcss.com/Swiper/4.5.0/js/swiper.min.js"></script>
<!-- Initialize Swiper -->
<script>
  var swiper = new Swiper('.swiper-container', {
    autoplay: {
      delay: 5000,
    },
    lazy: {
      loadPrevNext: true,
    },
    navigation: {
      nextEl: '.swiper-button-next',
      prevEl: '.swiper-button-prev',
    },
    pagination: {
      el: '.swiper-pagination',
      dynamicBullets: true,
    },
    
  });
</script>
{% endmacro %}