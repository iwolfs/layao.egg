<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Main CSS-->
    <link rel="stylesheet" type="text/css" href="/public/admin/css/main.css">
    <!-- Font-icon css-->
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>登录 - 莱耀照明管理系统</title>
  </head>
  <body>
    <section class="material-half-bg">
      <div class="cover"></div>
    </section>
    <section class="login-content">
      <div class="logo">
        <h1>Layao</h1>
      </div>
      <div class="login-box">
        <form class="login-form">
          <h3 class="login-head"><i class="fa fa-lg fa-fw fa-user"></i>登录</h3>
          <div class="form-group">
            <label class="control-label">用户名</label>
            <input class="form-control" type="text" name="userName" placeholder="Your Username" autofocus>
          </div>
          <div class="form-group">
            <label class="control-label">密码</label>
            <input class="form-control" type="password" name="password" placeholder="Your Password">
          </div>
          <div class="form-group">
            <div class="utility">
              <div class="animated-checkbox">
                <label>
                  <input type="checkbox" name="remember"><span class="label-text">记住密码</span>
                </label>
              </div>
              {# <p class="semibold-text mb-2"><a href="#" data-toggle="flip">忘记密码 ?</a></p> #}
            </div>
          </div>
          <div class="form-group btn-container">
            <button id="btn-signin" type="button" class="btn btn-primary btn-block"><i class="fa fa-sign-in fa-lg fa-fw"></i>登录</button>
          </div>
        </form>
        <form class="forget-form" action="index.html">
          <h3 class="login-head"><i class="fa fa-lg fa-fw fa-lock"></i>忘记密码 ?</h3>
          <div class="form-group">
            <label class="control-label">邮箱</label>
            <input class="form-control" type="text" placeholder="Email">
          </div>
          <div class="form-group btn-container">
            <button class="btn btn-primary btn-block"><i class="fa fa-unlock fa-lg fa-fw"></i>设置</button>
          </div>
          <div class="form-group mt-3">
            <p class="semibold-text mb-0"><a href="#" data-toggle="flip"><i class="fa fa-angle-left fa-fw"></i> 返回登录</a></p>
          </div>
        </form>
      </div>
    </section>
    <!-- Essential javascripts for application to work-->
    <script src="/public/admin/js/jquery-3.2.1.min.js"></script>
    <script src="/public/admin/js/popper.min.js"></script>
    <script src="/public/admin/js/bootstrap.min.js"></script>
    <script src="/public/admin/js/cookie.js"></script>
    <script src="/public/admin/js/main.js"></script>
    <!-- The javascript plugin to display page loading on top-->
    <script src="/public/admin/js/plugins/pace.min.js"></script>
    <script type="text/javascript" src="/public/admin/js/plugins/bootstrap-notify.min.js"></script>
    <script type="text/javascript">
      // Login Page Flipbox control
      $('.login-content [data-toggle="flip"]').click(function() {
      	$('.login-box').toggleClass('flipped');
      	return false;
      });
      (function() {
      $('#btn-signin').click(function(e) {
        const fieldArr = $('form').serializeArray();
        let fields = {}
        fieldArr.forEach((item, index) => {
          fields[item.name] = item.value
        });
        
        if (!fields.userName || fields.userName.trim() === '') {
          $.notify({
            title: '请输入用户名',
            message: '',
            icon: 'fa fa-check' 
          })
          return false;
        } else if (!fields.password || fields.password.trim() === '') {
          $.notify({
            title: '请输入密码',
            message: '',
            icon: 'fa fa-check' 
          })
          return false;
        }

        $.ajax({
          url: '/api/user/signin',
          type: 'POST',
          data: fields,
        }).done(function(data) {
          if (data.success) {
            $.notify({
              title: '',
              message: '登录成功',
              icon: 'fa fa-check' 
            })
            const expires = !!fields.remember ? 7 : undefined
            cookie.set('authorization', data.data.token, {expires: expires, path: '/'})
            location.href = '/admin'
          } else {
            $.notify({
              title: '',
              message: '登录失败: ' + data.data.msg,
              icon: 'fa fa-check' 
            })
          }
        })
      })
    })();
    </script>
  </body>
</html>