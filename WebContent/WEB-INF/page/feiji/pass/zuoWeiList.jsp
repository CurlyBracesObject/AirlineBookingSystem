<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Aircraft flight information</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <link rel="shortcut icon" href="${ctx}/public/logo.ico" type="image/x-icon"/>
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
<div class="x-nav">
      <span class="layui-breadcrumb">
        <a href="">front page</a>
        <a>
          <cite>flight information seat</cite></a>
      </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right"
       href="${ctx }/feijizuowei_pass/list?fei_ji_id=${fei_ji_id}"
       title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
</div>
<div class="x-body">
    <div class="layui-row" style="" align="center">
        <form class="layui-form layui-col-md12 x-so" method="get" action="${ctx }/feijizuowei_pass/list">
            <!-- <input class="layui-input" placeholder="开始日" name="start" id="start">

            <input class="layui-input" placeholder="截止日" name="end" id="end"> -->
            <%--            <input type="text" name="fei_ji_name" style="width:50%;" placeholder="请输入查找飞机名" autocomplete="off"--%>
            <%--                   class="layui-input">--%>
            <input type="hidden" name="fei_ji_id" id="fei_ji_id" value="${fei_ji_id}">
            <select class="layui-input" name="type" id="type" style="width:50%;">
                <option value="TOUDENG">First class</option>
                <option value="SHANGYE">Business</option>
                <option value="JINGJI">Economy</option>
            </select>
            <button class="layui-btn" lay-submit="" lay-filter="sreach"><i class="layui-icon">&#xe615;</i></button>
        </form>
    </div>
    <%-- <xblock>
<!--        <button class="layui-btn layui-btn-danger" onclick="delAll()"><i class="layui-icon"></i>批量删除</button> -->
      <button class="layui-btn" onclick="x_admin_show('添加用户','${ctx}/dept/add')"><i class="layui-icon"></i>添加</button>
      <span class="x-right" style="line-height:40px">共有数据：88 条</span>
    </xblock> --%>


    <table class="layui-table">
        <thead>
        <tr>
            <th>
                <div class="layui-unselect header layui-form-checkbox" lay-skin="primary"><i
                        class="layui-icon">&#xe605;</i></div>
            </th>
            <th>ID</th>
            <th>plane name</th>
            <th>No.row</th>
            <th>No.column</th>
            <th>type</th>
            <th>price</th>
            <th>whether it is approved or not</th>
            <td>operation</td>
        </thead>
        <tbody>
        <c:forEach items="${feiJiZuoWeiList}" var="item" varStatus="stat">
            <tr>
                <td>
                    <div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id='2'><i
                            class="layui-icon">&#xe605;</i></div>
                </td>
                <td>${item.id}</td>
                <td>${item.fei_ji_name}</td>
                <td>${item.row}</td>
                <td>${item.col}</td>
                <c:choose>
                    <c:when test="${item.type eq 'TOUDENG'}">
                        <td>First class</td>
                    </c:when>
                    <c:when test="${item.type eq 'SHANGYE'}">
                        <td>Business</td>
                    </c:when>
                    <c:when test="${item.type eq 'JINGJI'}">
                        <td>Economy</td>
                    </c:when>
                </c:choose>

                <td>${item.price}</td>

                <c:choose>
                    <c:when test="${item.status eq 'UN_BUY'}">
                        <td>not purchased</td>
                    </c:when>
                    <c:when test="${item.status eq 'BUY'}">
                        <td>purchased</td>
                    </c:when>
                </c:choose>

                <!--  <td class="td-status">
                   <span class="layui-btn layui-btn-normal layui-btn-mini">已启用</span></td> -->
                <td class="td-manage">
                    <c:if test="${item.status eq 'UN_BUY'}">
                        <a title="predetermine" href="${ctx}/feijizuowei_pass/toyuding?id=${item.id}&fei_ji_id=${item.fei_ji_id}">
                            <i class="layui-icon">&#xe642;</i>
                        </a>
                    </c:if>
                </td>
            </tr>

        </c:forEach>


        </tbody>
    </table>
    <!--  <div class="page">
       <div>
         <a class="prev" href="">&lt;&lt;</a>
         <a class="num" href="">1</a>
         <span class="current">2</span>
         <a class="num" href="">3</a>
         <a class="num" href="">489</a>
         <a class="next" href="">&gt;&gt;</a>
       </div>
     </div> -->

</div>
<script>
    layui.use('laydate', function () {
        var laydate = layui.laydate;

        //执行一个laydate实例
        laydate.render({
            elem: '#start' //指定元素
        });

        //执行一个laydate实例
        laydate.render({
            elem: '#end' //指定元素
        });
    });

    /**
     * 预定信息
     * @param id
     * @param fei_ji_id
     */

    function yuding(id, fei_ji_id) {
        $.get("${ctx}/feijizuowei_pass/toyuding?id=" + id, + "&fei_ji_id=" + fei_ji_id);
    }
</script>
<script>var _hmt = _hmt || [];
(function () {
    var hm = document.createElement("script");
    hm.src = "https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190";
    var s = document.getElementsByTagName("script")[0];
    s.parentNode.insertBefore(hm, s);
})();</script>
</body>

</html>