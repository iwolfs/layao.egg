{% extends "../layout/_layout.tpl" %}

{% block body%}
  <div class="app-title">
    <div>
      <h1><i class="fa fa-th-list"></i> {{'编辑' if _id else '添加'}}产品</h1>
      <p></p>
    </div>
    <ul class="app-breadcrumb breadcrumb side">
      <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
      <li class="breadcrumb-item">产品</li>
      <li class="breadcrumb-item active"><a href="#">{{'编辑' if _id else '添加'}}产品</a></li>
    </ul>
  </div>
  <div class="row">
    <div class="col-md-12">
      <div class="tile">
        {# <h3 class="tile-title">Vertical Form</h3> #}
        <div class="tile-body">
          <div class="row">
            <div class="col-md-8">
                <form>
                  <div class="form-group">
                    <label for="exampleSelect1">产品类别</label>
                    <select class="form-control" id="exampleSelect1" name="category" value="{{product.category}}">
                      {% for category in categories %}
                        {% if category._id === product.category %}
                          <option value="{{category._id}}" selected>{{category.name}}</option>
                        {% else %}
                          <option value="{{category._id}}">{{category.name}}</option>
                        {% endif %}
                      {% endfor %}
                    </select>
                  </div>
                  <div class="form-group">
                    <label class="control-label">产品名称</label>
                    <input class="form-control" type="text" name="title" value="{{product.title}}" placeholder="请输入产品名称">
                  </div>
                  <div class="form-group">
                    <label for="coverInputFile">产品内容</label>
                    <div id="content">{{product.content | safe}}</div>
                  </div>
                  <div class="form-group">
                    <label for="coverInputFile">File input</label>
                    <input class="form-control-file" id="coverInputFile" name="file" type="file" aria-describedby="fileHelp"><small class="form-text text-muted" id="fileHelp">This is some placeholder block-level help text for the above input. It's a bit lighter and easily wraps to a new line.</small>
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
          <button id="btn-submit" class="btn btn-primary" type="button"><i class="fa fa-fw fa-lg fa-check-circle"></i>保存</button>&nbsp;&nbsp;&nbsp;<a class="btn btn-secondary" href="/admin/product"><i class="fa fa-fw fa-lg fa-times-circle"></i>取消</a>
        </div>
      </div>
    </div>
  </div>
{% endblock %}

{% block bottom %}
<script type="text/javascript" src="/public/plugins/wangEditor-3.1-2.1/wangEditor.js"></script>
    <script type="text/javascript">
    (function() {
      const _id = {{_id if _id else 'null'}}

      var E = window.wangEditor
      var editor = new E('#content');
      editor.customConfig.uploadImgServer = '/api/upload'
      editor.customConfig.customUploadImg = function (files, insert) {
          // files 是 input 中选中的文件列表
          // insert 是获取图片 url 后，插入到编辑器的方法

          // 上传代码返回结果之后，将图片插入到编辑器中
          //insert(imgUrl)
        const fields = getFormFields()
        const formData = new FormData();
          files.forEach(file => {
            formData.append('filename',file.name);
            formData.append('file',file);
          })
          $.ajax({
            url: `/api/upload?_csrf=${fields['_csrf']}`,
            dataType:'json',
            type:'post',
            data: formData,
            processData : false, // 使数据不做处理
            contentType : false, // 不要设置Content-Type请求头
            success: function(data){
                console.log(data);
                if (data.status == 'ok') {
                    //alert('上传成功！');
                    const urls = data.data || [];
                    urls.forEach(item => {
                      insert(item.url)
                    })
                }

            },
            error:function(response){
                console.log(response);
            }
        });
      }
      editor.create()

      function getFormFields() {
        const fieldArr = $('form').serializeArray();
        let fields = {}
        fieldArr.forEach((item, index) => {
          fields[item.name] = item.value
        })
        return fields
      }

      $('#btn-submit').click(function(e) {
        const fieldArr = $('form').serializeArray();
        const fields = getFormFields()
        const content = editor.txt.html();
        if (!fields.title || fields.title.trim() === '') {
          $.notify({
            title: '请输入产品名称',
            message: '',
            icon: 'fa fa-check' 
          })
          return;
        }

        fields.content = content;

        const apiUrl = _id ? '/api/article/' + _id : '/api/article';
        const denoMsg = _id ? '修改成功' : '添加成功';
        const ajaxType = _id ? 'put' : 'post';
        $.ajax({
          url: apiUrl,
          type: ajaxType,
          data: fields,
        }).done(function(data) {
          $.notify({
            title: '',
            message: denoMsg,
            icon: 'fa fa-check' 
          });
          if (!_id) {
            location.href = '/admin/product/edit/' + data._id
          }
        })
      });

      $('#coverInputFile').change(function(e) {
        const file = e.target.files[0]
        console.log(file)

        const fieldArr = $('form').serializeArray();
        const fields = getFormFields()

        const formData = new FormData();
        formData.append('filename',file.name);
        formData.append('file',file);
        //formData.append('_csrf', fields['_csrf'])

        $.ajax({
          url: `/api/upload?_csrf=${fields['_csrf']}`,
          dataType:'json',
          type:'post',
          data: formData,
          processData : false, // 使数据不做处理
          contentType : false, // 不要设置Content-Type请求头
          success: function(data){
              console.log(data);
              if (data.status == 'ok') {
                  alert('上传成功！');
              }

          },
          error:function(response){
              console.log(response);
          }
        });
      })
    })();</script>
{% endblock %}