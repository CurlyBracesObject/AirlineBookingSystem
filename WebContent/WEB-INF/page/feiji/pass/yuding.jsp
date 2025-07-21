<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Book flight page</title>
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
    <form class="layui-form" method="POST" id="deptForm" action="${ctx}/feijizuowei_pass/save/yuding">
        <input type="hidden" id="fei_ji_id" name="fei_ji_id" value="${feiji.id}">
        <input type="hidden" id="id" name="id" value="${feijizuowei.id}">
        <div class="layui-form-item">
            <label for="fei_ji_name" class="layui-form-label" style="width: 150px">
                aircraft name
            </label>
            <div class="layui-input-inline" style="width: 50%">
                <input type="text" id="fei_ji_name" name="fei_ji_name"
                       disabled
                       autocomplete="off" class="layui-input" value="${feiji.fei_ji_name }">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="row" class="layui-form-label" style="width: 150px">
                row
            </label>
            <div class="layui-input-inline" style="width: 50%">
                <input type="text" id="row" name="row"
                       disabled
                       autocomplete="off" class="layui-input" value="${feijizuowei.row }">
            </div>

        </div>
        <div class="layui-form-item">
            <label for="col" class="layui-form-label" style="width: 150px">
                col
            </label>
            <div class="layui-input-inline" style="width: 50%">
                <input type="text" id="col" name="col"
                       disabled
                       autocomplete="off" class="layui-input" value="${feijizuowei.col }">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="type" class="layui-form-label" style="width: 150px">
                Seat Type
            </label>
            <div class="layui-input-inline" style="width: 50%">
                <input type="hidden" id="type" name="type" value="${feijizuowei.type }">
                <c:choose>
                    <c:when test="${feijizuowei.type eq 'TOUDENG'}">
                        <input type="text" id="type_name" name="type_name"
                               disabled
                               autocomplete="off" class="layui-input" value="First Class">
                    </c:when>
                    <c:when test="${feijizuowei.type eq 'SHANGYE'}">
                        <input type="text" id="type_name" name="type_name"
                               disabled
                               autocomplete="off" class="layui-input" value="Business Class">
                    </c:when>
                    <c:when test="${feijizuowei.type eq 'JINGJI'}">
                        <input type="text" id="type_name" name="type_name"
                               disabled
                               autocomplete="off" class="layui-input" value="Economy Class">
                    </c:when>
                </c:choose>
            </div>
        </div>

        <div class="layui-form-item">
            <label for="price" class="layui-form-label" style="width: 150px">
                Seat Price
            </label>
            <div class="layui-input-inline" style="width: 50%">
                <input type="text" id="price" name="price"
                       disabled
                       autocomplete="off" class="layui-input" value="${feijizuowei.price }">
            </div>
        </div>
        <div class="layui-form-item" >
            <label for="id_card" class="layui-form-label" style="width: 150px">
                <span class="x-red">*</span>ID Card
            </label>
            <div class="layui-input-inline" style="width: 50%">
                <input type="text" id="id_card" name="id_card" placeholder="Please enter ID number number"
                       required="" lay-verify="required"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="real_name" class="layui-form-label" style="width: 150px" >
                <span class="x-red">*</span>Real Name
            </label>
            <div class="layui-input-inline" style="width: 50%">
                <input type="text" id="real_name" name="real_name" placeholder="Please enter Real Name"
                       required="" lay-verify="required"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="email" class="layui-form-label" style="width: 150px">
                <span class="x-red">*</span>email
            </label>
            <div class="layui-input-inline" style="width: 50%">
                <input type="text" id="email" name="email" placeholder="Please enter email"
                       required="" lay-verify="required"
                       autocomplete="off" class="layui-input">
            </div>
        </div>


        <div class="layui-form-item" style="align-content: center">
            <label for="L_repass" class="layui-form-label">
            </label>
            <input type="submit" value="Confirm Predetermine" class="layui-btn" lay-filter="add" lay-submit=""/>
        </div>
    </form>
</div>
<script>
    layui.use(['form', 'layer'], function () {
        $ = layui.jquery;
        var form = layui.form
            , layer = layui.layer;

        //监听提交
        form.on('submit(add)', function (data) {

            console.log(data);
            //发异步，把数据提交给php
            layer.alert("Predetermine Success", {icon: 6}, function () {
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