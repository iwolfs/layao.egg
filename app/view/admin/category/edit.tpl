{% set currMenu = {main: 'category', sub: 'edit'} %}
{% extends "../layout/_layout.tpl" %}

{% block body%}
  <div class="app-title">
    <div>
      <h1><i class="fa fa-th-list"></i> {{'编辑' if _id else '添加'}}类别</h1>
      <p></p>
    </div>
    <ul class="app-breadcrumb breadcrumb side">
      <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
      <li class="breadcrumb-item">类别</li>
      <li class="breadcrumb-item active"><a href="#">{{'编辑' if _id else '添加'}}类别</a></li>
    </ul>
  </div>
  <div class="row">
    <div class="col-md-12">
      <div class="tile">
        {# <h3 class="tile-title">Vertical Form</h3> #}
        <div class="tile-body">
          <div class="row">
            <div class="col-md-6">
                <form>
                  <div class="form-group">
                    <label for="exampleSelect1">通道</label>
                    <select class="form-control" id="exampleSelect1" name="type" value="{{category.type}}">
                      {% for channel in channels %}
                        {% if channel._id === category.type %}
                          <option value="{{channel._id}}" selected>{{channel.name}}</option>
                        {% else %}
                          <option value="{{channel._id}}">{{channel.name}}</option>
                        {% endif %}
                      {% endfor %}
                    </select>
                  </div>
                  <div class="form-group">
                    <label class="control-label">类别名称</label>
                    <input class="form-control" type="text" name="name" value="{{category.name}}" placeholder="请输入类别名称">
                  </div>
                  {# <div class="form-group">
                    <label class="control-label">Gender</label>
                    <div class="form-check">
                      <label class="form-check-label">
                        <input class="form-check-input" type="radio" name="gender">Male
                      </label>
                    </div>
                    <div class="form-check">
                      <label class="form-check-label">
                        <input class="form-check-input" type="radio" name="gender">Female
                      </label>
                    </div>
                  </div> #}
                  <index type="hidden" name="_id" value="{{_id}}" />
                </form>
              </div>
          </div>
        </div>
        <div class="tile-footer">
          <button id="btn-submit" class="btn btn-primary" type="button"><i class="fa fa-fw fa-lg fa-check-circle"></i>保存</button>&nbsp;&nbsp;&nbsp;<a class="btn btn-secondary" href="/admin/category"><i class="fa fa-fw fa-lg fa-times-circle"></i>取消</a>
        </div>
      </div>
    </div>
  </div>
{% endblock %}

{% block bottom %}
    <script type="text/javascript">
    (function() {
      const _id = {{_id if _id else 'null'}}

      $('#btn-submit').click(function(e) {
        const fieldArr = $('form').serializeArray();
        let fields = {}
        fieldArr.forEach((item, index) => {
          fields[item.name] = item.value
        })
        if (!fields.name || fields.name.trim() === '') {
          $.notify({
            title: '请输入名称',
            message: '',
            icon: 'fa fa-check' 
          })
          return;
        }

        const apiUrl = _id ? '/api/category/' + _id : '/api/category';
        const denoMsg = _id ? '修改成功' : '添加成功';
        const ajaxType = _id ? 'put' : 'post';
        $.ajax({
          url: apiUrl,
          type: ajaxType,
          headers: {authorization: cookie.get('authorization')},
          data: fields,
        }).done(function(data) {
          $.notify({
            title: '',
            message: denoMsg,
            icon: 'fa fa-check' 
          })
        })
      })
    })();</script>
{% endblock %}