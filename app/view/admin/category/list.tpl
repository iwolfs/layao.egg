{% extends "../layout/_layout.tpl" %}

{% block body%}
  <div class="app-title">
    <div>
      <h1><i class="fa fa-th-list"></i> 类别列表</h1>
      <p></p>
    </div>
    <ul class="app-breadcrumb breadcrumb side">
      <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
      <li class="breadcrumb-item">类别</li>
      <li class="breadcrumb-item active"><a href="#">类别列表</a></li>
    </ul>
  </div>
  <div class="row">
    <div class="col-md-12">
      <div class="tile">
        <div class="tile-body">
          <table class="table table-hover table-bordered" id="sampleTable">
            <thead>
              <tr>
                <th>ID</th>
                <th>名称</th>
                <th>状态</th>
                <th>创建时间</th>
                <th>操作</th>
              </tr>
            </thead>
          </table>
        </div>
      </div>
    </div>
  </div>
{% endblock %}

{% block bottom %}
    <!-- Page specific javascripts-->
    {# <script src="https://cdn.bootcss.com/moment.js/2.24.0/locale/zh-cn.js"></script> #}
    <script src="https://cdn.bootcss.com/moment.js/2.24.0/moment.min.js"></script>
    <!-- Data table plugin-->
    <script type="text/javascript" src="/public/admin/js/plugins/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="/public/admin/js/plugins/dataTables.bootstrap.min.js"></script>
    <script type="text/javascript">
    $('#sampleTable').DataTable({
      //表示翻页时是否显示 processing信息（正在加载中），这个信息可以修改
      processing: true,
      // 服务器端处理方式
      serverSide: true,
      
      ajax(data, callback, settings) {
          console.log(data);
          //封装请求参数
          var param = {};
          param.pageSize = data.length;       //页面显示记录条数，在页面显示每页显示多少项的时候
          param.pageIndex = data.start + 1;   //开始的记录序号
          $.ajax({
              type: 'get',
              url: '/api/category',
              cache: false,  //禁用缓存
              data: param,
              dataType: 'json',
              success: function(res) {
                  setTimeout( function () {
                      var out = {};
                      out.draw = data.draw;
                      out.recordsTotal = res.total;
                      out.recordsFiltered = res.total;
                      out.data =  res.list;
                      callback( out );
                  }, 50 );
              },
              error() {
                  alert('error');
              }
          })
      },
      columns: [
          { data: '_id'},
          { data: 'name'},
          { data: 'status'},
          { data: 'createAt', render: function(data, type, row) { return moment(data).format('YYYY-MM-DD HH:mm')}},
          { data: '', render: function(data, type, row) {
            return `<a href="/admin/category/edit/${row._id}">编辑</a>`
          }},
      ],
      iDisplayLength: 10,
      //pagingType: 'full_numbers',
    });</script>
{% endblock %}