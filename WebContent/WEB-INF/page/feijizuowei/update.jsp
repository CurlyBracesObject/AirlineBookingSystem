<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Welcome page-X-admin2.0</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon"/>
    <link rel="stylesheet" href="${ctx}/public/css/font.css">
    <link rel="stylesheet" href="${ctx}/public/css/xadmin.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="${ctx}/public/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${ctx}/public/js/xadmin.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>
<div class="x-body">
    <form class="layui-form" method="POST" id="deptForm" action="${ctx}/feijizuowei/update/entity" accept-charset="UTF-8">
        <input type="hidden" name="id" id="id" value="${feijizuowei.id}">
        <div class="layui-form-item">
            <label for="fei_ji_id" class="layui-form-label">
                <span class="x-red">*</span>Aircraft name
            </label>
            <div class="layui-input-inline">
                <select class="layui-input" name="fei_ji_id" id="fei_ji_id">
                    <c:forEach items="${feijiList}" var="item" varStatus="stat">
                        <option value="${item.id}" <c:if test="${item.id == feijizuowei.fei_ji_id}">selected</c:if>>${item.fei_ji_name}</option>
                    </c:forEach>
                </select>
            </div>

        </div>
        <div class="layui-form-item">
            <label for="row" class="layui-form-label">
                <span class="x-red">*</span>No.row
            </label>
            <div class="layui-input-inline">
                <input type="text" id="row" name="row" required="" lay-verify="required"
                       autocomplete="off" class="layui-input" value="${feijizuowei.row }">
            </div>

        </div>
        <div class="layui-form-item">
            <label for="col" class="layui-form-label">
                <span class="x-red">*</span>No.column
            </label>
            <div class="layui-input-inline">
                <input type="text" id="col" name="col" required="" lay-verify="required"
                       autocomplete="off" class="layui-input" value="${feijizuowei.col }">
            </div>

        </div>
        <div class="layui-form-item">
            <label for="type" class="layui-form-label">
                <span class="x-red">*</span>seat type
            </label>
            <div class="layui-input-inline">
                <select class="layui-input" name="type" ID="type">
                    <option value="TOUDENG">First class</option>
                    <option value="SHANGYE">Business</option>
                    <option value="JINGJI">Economy</option>
                </select>
            </div>

        </div>
        <div class="layui-form-item">
            <label for="price" class="layui-form-label">
                <span class="x-red">*</span>seat prize
            </label>
            <div class="layui-input-inline">
                <input type="text" id="price" name="price" required="" lay-verify="required"
                       autocomplete="off" class="layui-input" value="${feijizuowei.price }">
            </div>

        </div>

        <div class="layui-form-item">
            <label for="L_repass" class="layui-form-label">
            </label>
            <input type="submit" value=" 提交" class="layui-btn" lay-filter="add" lay-submit=""/>

        </div>
    </form>
</div>
<script>
    layui.use(['form', 'layer'], function () {
        $ = layui.jquery;
        var form = layui.form
            , layer = layui.layer;

        //自定义验证规则
        form.verify({
            nikename: function (value) {
                if (value.length < 5) {
                    return '昵称至少得5个字符啊';
                }
            }
            , pass: [/(.+){6,12}$/, '密码必须6到12位']
            , repass: function (value) {
                if ($('#L_pass').val() != $('#L_repass').val()) {
                    return '两次密码不一致';
                }
            }
        });

        //监听提交
        form.on('submit(add)', function (data) {

            console.log(data);
            //发异步，把数据提交给php
            layer.alert("修改success", {icon: 6}, function () {
                document.getElementById('deptForm').submit();
                // 获得frame索引
                var index = parent.layer.getFrameIndex(window.name);
                //关闭当前frame
                parent.layer.close(index);

            });
            return false;
        });


    });
</script>

</body>

</html>