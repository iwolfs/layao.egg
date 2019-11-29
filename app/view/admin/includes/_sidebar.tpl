{% set menus = [
  {
    name: 'home',
    label: '首页',
    icon: 'dashboard',
    path: '/admin'
  }, {
    name: 'product',
    label: '产品',
    icon: 'lightbulb-o',
    path: '',
    children: [{
      name: 'edit',
      label: '添加产品',
      icon: 'circle-o',
      path: '/admin/product/edit'
    },{
      name: 'list',
      label: '产品列表',
      icon: 'circle-o',
      path: '/admin/product'
    }]
  }, {
    name: 'case',
    label: '案例',
    icon: 'star',
    path: '',
    children: [{
      name: 'edit',
      label: '添加案例',
      icon: 'circle-o',
      path: '/admin/case/edit'
    },{
      name: 'list',
      label: '案例列表',
      icon: 'circle-o',
      path: '/admin/case'
    }]
  }, {
    name: 'category',
    label: '类别',
    icon: 'clone',
    path: '',
    children: [{
      name: 'edit',
      label: '添加类别',
      icon: 'circle-o',
      path: '/admin/category/edit'
    },{
      name: 'list',
      label: '类别列表',
      icon: 'circle-o',
      path: '/admin/category'
    }]
  }
]%}
<!-- Sidebar menu-->
    <div class="app-sidebar__overlay" data-toggle="sidebar"></div>
    <aside class="app-sidebar">
      <div class="app-sidebar__user"><img class="app-sidebar__user-avatar" src="https://s3.amazonaws.com/uifaces/faces/twitter/jsa/48.jpg" alt="User Image">
        <div>
          <p class="app-sidebar__user-name">Admin {{currentPath}}</p>
          <p class="app-sidebar__user-designation">管理员</p>
        </div>
      </div>
      <ul class="app-menu">
        {% for menu in menus %}
          {% if not menu.children %}
            <li><a class="app-menu__item{{' active' if currMenu.main === menu.name else ''}}" href="{{menu.path}}"><i class="app-menu__icon fa fa-{{menu.icon}}"></i><span class="app-menu__label">{{menu.label}}</span></a></li>
          {% else %}
            <li class="treeview{{' is-expanded' if currMenu.main === menu.name else ''}}"><a class="app-menu__item" href="#" data-toggle="treeview"><i class="app-menu__icon fa fa-{{menu.icon}}"></i><span class="app-menu__label">{{menu.label}}</span><i class="treeview-indicator fa fa-angle-right"></i></a>
              <ul class="treeview-menu">
                {% for subMenu in menu.children %}
                <li><a class="treeview-item{{' active' if (currMenu.main + '-' + currMenu.sub) === (menu.name + '-' + subMenu.name) else ''}}" href="{{subMenu.path}}"><i class="icon fa fa-{{subMenu.icon}}"></i> {{subMenu.label}}</a></li>
                {% endfor %}
              </ul>
            </li>
          {% endif %}
        {% endfor %}
        {# <li class="treeview{{' is-expanded' if currMenu.main === 'product' else ''}}"><a class="app-menu__item" href="#" data-toggle="treeview"><i class="app-menu__icon fa fa-laptop"></i><span class="app-menu__label">产品</span><i class="treeview-indicator fa fa-angle-right"></i></a>
          <ul class="treeview-menu">
            <li><a class="treeview-item{{' active' if (currMenu.main + '-' + currMenu.sub) === 'product-edit' else ''}}" href="/admin/product/edit"><i class="icon fa fa-circle-o"></i> 添加产品</a></li>
            <li><a class="treeview-item{{' active' if (currMenu.main + '-' + currMenu.sub) === 'product-list' else ''}}" href="/admin/product"><i class="icon fa fa-circle-o"></i> 产品列表</a></li>
          </ul>
        </li>
        <li class="treeview{{' is-expanded' if currMenu.main === 'category' else ''}}"><a class="app-menu__item" href="#" data-toggle="treeview"><i class="app-menu__icon fa fa-laptop"></i><span class="app-menu__label">类别</span><i class="treeview-indicator fa fa-angle-right"></i></a>
          <ul class="treeview-menu">
            <li><a class="treeview-item{{' active' if (currMenu.main + '-' + currMenu.sub) === 'category-edit' else ''}}" href="/admin/category/edit"><i class="icon fa fa-circle-o"></i> 添加类别</a></li>
            <li><a class="treeview-item{{' active' if (currMenu.main + '-' + currMenu.sub) === 'category-list' else ''}}" href="/admin/category"><i class="icon fa fa-circle-o"></i> 类别列表</a></li>
          </ul>
        </li> #}
        {# <li class="treeview"><a class="app-menu__item" href="#" data-toggle="treeview"><i class="app-menu__icon fa fa-laptop"></i><span class="app-menu__label">UI Elements</span><i class="treeview-indicator fa fa-angle-right"></i></a>
          <ul class="treeview-menu">
            <li><a class="treeview-item" href="bootstrap-components.html"><i class="icon fa fa-circle-o"></i> Bootstrap Elements</a></li>
            <li><a class="treeview-item" href="https://fontawesome.com/v4.7.0/icons/" target="_blank" rel="noopener"><i class="icon fa fa-circle-o"></i> Font Icons</a></li>
            <li><a class="treeview-item" href="ui-cards.html"><i class="icon fa fa-circle-o"></i> Cards</a></li>
            <li><a class="treeview-item" href="widgets.html"><i class="icon fa fa-circle-o"></i> Widgets</a></li>
          </ul>
        </li>
        <li><a class="app-menu__item" href="charts.html"><i class="app-menu__icon fa fa-pie-chart"></i><span class="app-menu__label">Charts</span></a></li>
        <li class="treeview"><a class="app-menu__item" href="#" data-toggle="treeview"><i class="app-menu__icon fa fa-edit"></i><span class="app-menu__label">Forms</span><i class="treeview-indicator fa fa-angle-right"></i></a>
          <ul class="treeview-menu">
            <li><a class="treeview-item" href="form-components.html"><i class="icon fa fa-circle-o"></i> Form Components</a></li>
            <li><a class="treeview-item" href="form-custom.html"><i class="icon fa fa-circle-o"></i> Custom Components</a></li>
            <li><a class="treeview-item" href="form-samples.html"><i class="icon fa fa-circle-o"></i> Form Samples</a></li>
            <li><a class="treeview-item" href="form-notifications.html"><i class="icon fa fa-circle-o"></i> Form Notifications</a></li>
          </ul>
        </li>
        <li class="treeview"><a class="app-menu__item" href="#" data-toggle="treeview"><i class="app-menu__icon fa fa-th-list"></i><span class="app-menu__label">Tables</span><i class="treeview-indicator fa fa-angle-right"></i></a>
          <ul class="treeview-menu">
            <li><a class="treeview-item" href="table-basic.html"><i class="icon fa fa-circle-o"></i> Basic Tables</a></li>
            <li><a class="treeview-item" href="table-data-table.html"><i class="icon fa fa-circle-o"></i> Data Tables</a></li>
          </ul>
        </li>
        <li class="treeview"><a class="app-menu__item" href="#" data-toggle="treeview"><i class="app-menu__icon fa fa-file-text"></i><span class="app-menu__label">Pages</span><i class="treeview-indicator fa fa-angle-right"></i></a>
          <ul class="treeview-menu">
            <li><a class="treeview-item" href="blank-page.html"><i class="icon fa fa-circle-o"></i> Blank Page</a></li>
            <li><a class="treeview-item" href="page-login.html"><i class="icon fa fa-circle-o"></i> Login Page</a></li>
            <li><a class="treeview-item" href="page-lockscreen.html"><i class="icon fa fa-circle-o"></i> Lockscreen Page</a></li>
            <li><a class="treeview-item" href="page-user.html"><i class="icon fa fa-circle-o"></i> User Page</a></li>
            <li><a class="treeview-item" href="page-invoice.html"><i class="icon fa fa-circle-o"></i> Invoice Page</a></li>
            <li><a class="treeview-item" href="page-calendar.html"><i class="icon fa fa-circle-o"></i> Calendar Page</a></li>
            <li><a class="treeview-item" href="page-mailbox.html"><i class="icon fa fa-circle-o"></i> Mailbox</a></li>
            <li><a class="treeview-item" href="page-error.html"><i class="icon fa fa-circle-o"></i> Error Page</a></li>
          </ul>
        </li> #}
      </ul>
    </aside>