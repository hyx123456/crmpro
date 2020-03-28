<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>


<!-- Mirrored from www.gzsxt.cn/theme/hplus/table_basic.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 20 Jan 2016 14:20:01 GMT -->
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>项目管理系统 - 基础表格</title>
    <meta name="keywords" content="项目管理系统">
    <meta name="description" content="项目管理系统">

    <link rel="shortcut icon" href="favicon.ico">
    <link href="${pageContext.request.contextPath}/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/animate.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style.min862f.css?v=4.1.0" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/plugins/select/bootstrap-select.min.css" rel="stylesheet">

</head>

<body class="gray-bg">
<div class="wrapper2 wrapper-content2 animated fadeInRight">
    <div class="ibox float-e-margins">
        <div class="ibox-content">

            <form action="/task/mylist" method="post">
                <div class="row">
                    <div class="col-sm-3 col-sm-offset-4 text-right">
                        <h3><small>搜索条件:</small></h3>
                    </div>
                    <div class="col-sm-2">
                        <select name="type" class="selectpicker form-control">
                            <option value="0">选择类型</option>
                            <option value="1" <c:if test="${type==1}">selected</c:if>>任务标题</option>
                        </select>
                    </div>

                    <div class="col-sm-3">
                        <div class="input-group">
                            <input type="text" name="keyword" value="${keyword}" placeholder="请输入关键词"
                                   class="input-sm form-control">
                            <span class="input-group-btn">
                                        <button type="submit" class="btn btn-sm btn-primary"><i
                                                class="fa fa-search"></i> 搜索</button>
                                    </span>
                        </div>
                    </div>
                </div>
            </form>


            <div class="hr-line-dashed2"></div>
            <div class="table-responsive">
                <table class="table table-striped list-table">
                    <thead>
                    <tr>

                        <th>序号</th>
                        <th>任务标题</th>
                        <th>创建人</th>
                        <th>状态</th>
                        <th>优先级</th>
                        <th>开始时间</th>
                        <th>结束时间</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>

                    <c:forEach items="${list}" var="task" varStatus="i">
                        <tr>
                            <td>${i.count}</td>
                            <td>${task.tasktitle}</td>
                            <td>${task.sharer.ename}</td>
                            <td>
                                <c:if test="${task.status==0}"><i class="fa fa-hourglass-start"></i>分配</c:if>
                                <c:if test="${task.status==1}"><i class="fa fa-hourglass-half"></i>进行中...</c:if>
                                <c:if test="${task.status==2}"><i class="fa fa-hourglass-end"></i>完成</c:if>
                            </td>
                            <td>
                                <c:if test="${task.level=='高'}"><i class="fa fa-star"></i>高</c:if>
                                <c:if test="${task.level=='中'}"><i class="fa fa-star"></i>中</c:if>
                                <c:if test="${task.level=='低'}"><i class="fa fa-star"></i>低</c:if>
                                <c:if test="${task.level=='暂缓'}"><i class="fa fa-star"></i>暂缓</c:if>
                            </td>
                            <td><fmt:formatDate value="${task.starttime}" pattern="yyyy-MM-dd"/></td>
                            <td><fmt:formatDate value="${task.endtime}" pattern="yyyy-MM-dd"/></td>
                            <td id="statusTD">
                                <a class="btn btn-primary btn-xs"
                                   href="/task/info?id=${task.id}&pageNum=${page.pageNum}&flag=2"><i
                                        class="fa fa-eye"></i>查看</a>
                                <c:if test="${task.status==0}">
                                    <button data-id="${task.id}" class="btn btn-success btn-xs btnStart"><i
                                            class="fa fa-hourglass-start"></i>开始
                                    </button>
                                </c:if>
                                <c:if test="${task.status==1}">
                                    <button data-id="${task.id}" class="btn btn-danger btn-xs btnFinish"><i
                                            class="fa fa-hourglass-end"></i>完成
                                    </button>
                                </c:if>
                            </td>
                        </tr>
                    </c:forEach>


                    </tbody>
                </table>
            </div>

            <div class="row">

                <div class="col-sm-12 text-right">
                    <div class="btn-group">

                        <a href="/task/mylist?pageNum=${page.pageNum-1}&type=${type}&keyword=${keyword}"
                           class="btn btn-sm btn-white <c:if test="${page.pageNum-1<1}">disabled</c:if>"><i
                                class="glyphicon glyphicon-chevron-left"></i>
                        </a>

                        <c:forEach begin="1" end="${page.pages}" varStatus="i">
                            <a href="/task/mylist?pageNum=${i.index}&type=${type}&keyword=${keyword}"
                               class="btn btn-sm btn-white <c:if test="${page.pageNum==i.index}">active</c:if>">${i.index}</a>
                        </c:forEach>

                        <a href="/task/mylist?pageNum=${page.pageNum+1}&type=${type}&keyword=${keyword}"
                           class="btn btn-sm btn-white <c:if test="${page.pageNum+1>page.pages}">disabled</c:if>"><i
                                class="glyphicon glyphicon-chevron-right"></i>
                        </a>

                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/js/jquery.min.js?v=2.1.4"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js?v=3.3.6"></script>
<script src="${pageContext.request.contextPath}/js/plugins/select/bootstrap-select.min.js"></script>
<script src="${pageContext.request.contextPath}/js/plugins/sweetalert/sweetalert.min.js"></script>

<script>
    $(document).ready(function () {
        // 设置按钮的样式
        $('.selectpicker').selectpicker('setStyle', 'btn-white').selectpicker('setStyle', 'btn-sm');

        $("body").on("click", ".btnStart", function () {
            var $this = $(this);
            var id = $(this).data("id");
            swal({
                title: "您确定要开始任务吗",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "yes",
                closeOnConfirm: false
            }, function () {
                $.post("/task/updatemytaskstatus", {"id": id, "status": 1}, function (result) {
                    if (result == "true") {
                        swal("开启成功！", "", "success");
                        $this.parents("tr").children().eq(3).html("<i class='fa fa-hourglass-half'></i>进行中...");
                        $this.removeClass("btn-success btnStart").addClass("btn-danger btnFinish").html("<i class='fa fa-hourglass-end'></i>完成");
                    } else if (result == "false") {
                        swal("开启失败！", "", "error");
                    }
                }, "text");
            });
        });

        $("body").on("click", ".btnFinish", function () {
            var $this = $(this);
            var id = $(this).data("id");
            swal({
                title: "是否完成任务",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "yes",
                closeOnConfirm: false
            }, function () {
                $.post("/task/updatemytaskstatus", {"id": id, "status": 2}, function (result) {
                    if (result == "true") {
                        $this.parents("tr").children().eq(3).html("<i class='fa fa-hourglass-end'></i>完成");
                        $this.remove();
                        swal("任务已完成！", "", "success");
                    } else if (result == "false") {
                        swal("点击失败，请稍后再试....", "", "error");
                    }
                }, "text");
            });
        });

    });
</script>

</body>


</html>
