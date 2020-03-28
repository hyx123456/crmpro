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
    <link href="${pageContext.request.contextPath}/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/animate.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style.min862f.css?v=4.1.0" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/plugins/select/bootstrap-select.min.css" rel="stylesheet">

</head>

<body class="gray-bg">
<div class="wrapper2 wrapper-content2 animated fadeInRight">
    <div class="row">
        <div class="col-sm-5">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>添加角色</h5>
                </div>
                <div class="ibox-content">
                    <form id="formRole" class="form-horizontal">
                        <input type="hidden" name="roleid"/>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">角色名称：</label>

                            <div class="col-sm-8">
                                <input type="text" name="rolename" class="form-control">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">角色描述：</label>

                            <div class="col-sm-8">
                                <input type="text" name="roledis" class="form-control">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">是否启用：</label>

                            <input type="hidden" name="status">
                            <div class="col-sm-8">
                                <div class="switch">
                                    <div class="onoffswitch">
                                        <input type="checkbox" checked class="onoffswitch-checkbox" id="status">
                                        <label class="onoffswitch-label" for="status">
                                            <span class="onoffswitch-inner"></span>
                                            <span class="onoffswitch-switch"></span>
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-3 col-sm-8">
                                <button id="btnAdd" class="btn btn-sm btn-white" type="button"><i
                                        class="fa fa-save"></i> 保存
                                </button>
                                <button id="btnUpdate" class="btn btn-sm btn-white" type="button"><i
                                        class="fa fa-undo"></i> 修改
                                </button>
                                <button id="btncancel" class="btn btn-sm btn-white" type="button"><i class="fa"></i> 取消
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="col-sm-7">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>角色列表 <small>点击修改信息将显示在左边表单</small></h5>
                </div>
                <div class="ibox-content">
                    <form action="/role/list" method="post">
                        <div class="row">
                            <div class="col-sm-2 col-sm-offset-2 text-right">
                                <h3><small>搜索条件:</small></h3>
                            </div>
                            <div class="col-sm-3">
                                <select name="type" class="selectpicker form-control">
                                    <option value="0">选择类型</option>
                                    <option
                                            <c:if test="${type==1}">selected</c:if> value="1">角色名称
                                    </option>
                                </select>
                            </div>

                            <div class="col-sm-5">
                                <div class="input-group">
                                    <input type="text" value="${keyword}" name="keyword" placeholder="请输入关键词"
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
                    <div class="row">
                        <div class="table-responsive">
                            <table class="table table-striped list-table">
                                <thead>
                                <tr>
                                    <th>选择</th>
                                    <th>角色名称</th>
                                    <th>角色描述：</th>
                                    <th>是否启用</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${list}" var="role">
                                    <tr>
                                        <td><input type="checkbox"/></td>
                                        <td>${role.rolename}</td>
                                        <td>${role.roledis}</td>
                                        <td>
                                            <c:if test="${role.status==1}">是</c:if>
                                            <c:if test="${role.status==0}">否</c:if>

                                        </td>
                                        <td>
                                            <a class="toupdate" data-roleid="${role.roleid}" href="javascript:void(0)">
                                                <i class="glyphicon glyphicon-edit  text-navy"></i></a>
                                            <a href="javascript:void(0)" class="btndel">
                                                <i class="glyphicon glyphicon-remove  text-navy"></i></a>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <div class="row">
                            <div class="col-sm-5">
                                <button class="btn btn-sm btn-primary btnAll" type="button"><i
                                        class="fa fa-check-square-o"></i> 全选
                                </button>
                                <button class="btn btn-sm btn-primary btnReverse" type="button"><i
                                        class="fa fa-square-o"></i> 反选
                                </button>
                                <button class="btn btn-sm btn-primary" type="button"><i
                                        class="fa fa-times-circle-o"></i> 删除
                                </button>
                            </div>
                            <div class="col-sm-7 text-right">
                                <div class="btn-group">

                                    <a href="/role/list?pageNum=${page.pageNum-1}&type=${type}&keyword=${keyword}"
                                       class="btn btn-sm btn-white <c:if test="${page.pageNum-1<1}">disabled</c:if>"><i
                                            class="glyphicon glyphicon-chevron-left"></i>
                                    </a>

                                    <c:forEach begin="1" end="${page.pages}" varStatus="i">
                                        <a href="/role/list?pageNum=${i.index}&type=${type}&keyword=${keyword}"
                                           class="btn btn-sm btn-white <c:if test="${page.pageNum==i.index}">active</c:if>">${i.index}</a>
                                    </c:forEach>

                                    <a href="/role/list?pageNum=${page.pageNum+1}&type=${type}&keyword=${keyword}"
                                       class="btn btn-sm btn-white <c:if test="${page.pageNum+1>page.pages}">disabled</c:if>"><i
                                            class="glyphicon glyphicon-chevron-right"></i>
                                    </a>

                                </div>
                            </div>
                        </div>
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
        $("#btncancel").hide();
        $("#btnUpdate").hide();

        // 设置按钮的样式
        $('.selectpicker').selectpicker('setStyle', 'btn-white').selectpicker('setStyle', 'btn-sm');

        //全选
        $(".btnAll").click(function () {
            $("input[type=checkbox]").prop("checked", "checked");
        });

        //反选btnReverse
        $(".btnReverse").click(function () {
            $("input[type=checkbox]").each(function () {
                var checked = $(this).prop("checked");
                $(this).prop("checked", !checked);
            })
        });

        $(".toupdate").click(function () {
            $("#btnAdd").hide();
            $("#btncancel").show();
            $("#btnUpdate").show();
            var roleid = $(this).data("roleid");
            $.getJSON("/role/toupdate", "roleid=" + roleid, function (result) {
                $("input[name=rolename]").val(result.rolename);
                $("input[name=roledis]").val(result.roledis);
                $("input[name=roleid]").val(result.roleid);
                var status = result.status;
                if (status == 1) {
                    $("input[name=status]").prop("checked", true);
                } else if (status == 0) {
                    $("input[name=status]").prop("checked", false);
                }
            });
        });

        $("#btncancel").click(function () {
            $("#btncancel").hide();
            $("#btnUpdate").hide();
            $("#btnAdd").show();
            $("input[name=rolename]").val("");
            $("input[name=roledis]").val("");
            $("input[name=roleid]").val("");
        });

        function getStatus() {
            if ($("#status").prop("checked")) {
                $("input[name=status]").val(1);
            } else {
                $("input[name=status]").val(0);
            }
        }

        //修改
        $("#btnUpdate").click(function () {
            getStatus();
            var data = $("#formRole").serialize();
            var pageNum = "${page.pageNum}";
            $.post("/role/update", data, function (result) {
                if (result == 'true') {
                    swal({
                        title: "修改成功！",
                        type: "success"
                    }, function () {
                        location.href = "/role/list?pageNum=" + pageNum;
                    });
                } else if (result == 'false') {
                    swal("修改失败！", "请检查数据有效性", "error");
                }

            }, "text");
        });

        //添加
        $("#btnAdd").click(function () {
            getStatus();
            var data = $("#formRole").serialize();
            var pageNum = "${page.pageNum}";
            $.post("/role/add", data, function (result) {
                if (result == 'true') {
                    swal({
                        title: "添加成功！",
                        type: "success"
                    }, function () {
                        location.href = "/role/list?pageNum=" + pageNum;
                    });
                } else if (result == 'false') {
                    swal("添加失败！", "请检查数据有效性", "error");
                }

            }, "text");
        });

    });
</script>

</body>


</html>
