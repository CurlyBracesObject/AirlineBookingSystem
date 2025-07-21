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
    <form class="layui-form" method="POST" id="deptForm" action="${ctx}/feiji/save/entity">
        <input type="hidden" name="id" id="id" value="${feiji.id}">
        <div class="layui-form-item">
            <label for="fei_ji_name" class="layui-form-label">
                <span class="x-red">*</span>plane name
            </label>
            <div class="layui-input-inline">
                <input type="text" id="fei_ji_name" name="fei_ji_name" required="" lay-verify="required"
                       autocomplete="off" class="layui-input" value="${feiji.fei_ji_name}">
            </div>

        </div>
        <div class="layui-form-item">
            <label for="chu_fa_di" class="layui-form-label">
                <span class="x-red">*</span>departure location
            </label>
            <div class="layui-input-inline">
                <input type="text" id="chu_fa_di" name="chu_fa_di" required="" lay-verify="required"
                       autocomplete="off" class="layui-input" value="${feiji.chu_fa_di }">
            </div>

        </div>
        <div class="layui-form-item">
            <label for="mu_di_di" class="layui-form-label">
                <span class="x-red">*</span>destination
            </label>
            <div class="layui-input-inline">
                <input type="text" id="mu_di_di" name="mu_di_di" required="" lay-verify="required"
                       autocomplete="off" class="layui-input" value="${feiji.mu_di_di }">
            </div>

        </div>
        <div class="layui-form-item">
            <label for="qi_fei_time" class="layui-form-label">
                <span class="x-red">*</span>departure time
            </label>
            <div class="layui-input-inline">
                <input type="text" id="qi_fei_time" name="qi_fei_time" required="" lay-verify="required"
                       autocomplete="off" class="layui-input" value="${feiji.qi_fei_time }">
            </div>

        </div>
        <div class="layui-form-item">
            <label for="dao_da_time" class="layui-form-label">
                <span class="x-red">*</span>arrival time
            </label>
            <div class="layui-input-inline">
                <input type="text" id="dao_da_time" name="dao_da_time" required="" lay-verify="required"
                       autocomplete="off" class="layui-input" value="${feiji.dao_da_time }">
            </div>

        </div>
        <div class="layui-form-item">
            <label for="zuo_wei_total" class="layui-form-label">
                <span class="x-red">*</span>total seats
            </label>
            <div class="layui-input-inline">
                <input type="text" id="zuo_wei_total" name="zuo_wei_total" required="" lay-verify="required"
                       autocomplete="off" class="layui-input" value="${feiji.zuo_wei_total }">
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
            layer.alert("addsuccess", {icon: 6}, function () {
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