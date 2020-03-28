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
    <div class="row">
        <div class="col-sm-5">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>添加部门</h5>
                </div>
                <div class="ibox-content">
                    <form id="formDept" class="form-horizontal">

                        <div class="form-group">
                            <label class="col-sm-3 control-label">部门编号：</label>

                            <div class="col-sm-8">
                                <input type="text" name="deptno" class="form-control">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">部门名称：</label>

                            <div class="col-sm-8">
                                <input type="text" name="dname" class="form-control">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">区域：</label>

                            <div class="col-sm-8">
                                <input type="text" name="dlocation" class="form-control">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-3 col-sm-8">
                                <button class="btn btn-sm btn-white btnAdd" type="button"><i class="fa fa-save"></i> 保存
                                </button>
                                <button class="btn btn-sm btn-white btnUpdate" type="button"><i class="fa fa-undo"></i>
                                    修改
                                </button>
                                <button class="btn btn-sm btn-white cancel" type="button"><i class="fa"></i> 取消
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
                    <h5>部门列表 <small>点击修改信息将显示在左边表单</small></h5>
                </div>
                <div class="ibox-content">
                    <form action="/dept/list" method="post">
                        <div class="row">
                            <div class="col-sm-2 col-sm-offset-2 text-right">
                                <h3><small>搜索条件:</small></h3>
                            </div>
                            <div class="col-sm-3">
                                <select name="type" class="selectpicker form-control">
                                    <option value="0">选择类型</option>
                                    <option value="1" <c:if test="${type==1}">selected</c:if>>部门名称</option>
                                    <option value="2" <c:if test="${type==2}">selected</c:if>>区域</option>
                                </select>
                            </div>

                            <div class="col-sm-5">
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
                    <div class="row">
                        <div class="table-responsive">
                            <table class="table table-striped list-table">
                                <thead>
                                <tr>
                                    <th>选择</th>
                                    <th>部门编号</th>
                                    <th>部门名称</th>
                                    <th>区域</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${list}" var="dept">
                                    <tr>
                                        <td><input type="checkbox" value="${dept.deptno}"></td>
                                        <td>${dept.deptno}</td>
                                        <td>${dept.dname}</td>
                                        <td>${dept.dlocation}</td>
                                        <td>
                                            <a id="${dept.deptno}" class="update" href="javascript:void(0)"><i
                                                    class="glyphicon glyphicon-edit  text-navy"></i></a>
                                            <a href="javascript:void(0)" class="btndel" id="${dept.deptno}"><i
                                                    class="glyphicon glyphicon-remove  text-navy"></i></a>
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
                                <button class="btn btn-sm btn-primary btnRemoveChecked" type="button"><i
                                        class="fa fa-times-circle-o"></i> 删除
                                </button>
                            </div>

                            <div class="col-sm-7 text-right">
                                <div class="btn-group">

                                    <a href="/dept/list?pageNum=${page.pageNum-1}&type=${type}&keyword=${keyword}"
                                       class="btn btn-sm btn-white <c:if test="${page.pageNum-1<1}">disabled</c:if>"><i
                                            class="glyphicon glyphicon-chevron-left"></i>
                                    </a>

                                    <c:forEach begin="1" end="${page.pages}" varStatus="i">
                                        <a href="/dept/list?pageNum=${i.index}&type=${type}&keyword=${keyword}"
                                           class="btn btn-sm btn-white <c:if test="${page.pageNum==i.index}">active</c:if>">${i.index}</a>
                                    </c:forEach>

                                    <a href="/dept/list?pageNum=${page.pageNum+1}&type=${type}&keyword=${keyword}"
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
        $(".btnUpdate").hide();
        $(".cancel").hide();
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

        //添加部门
        $(".btnAdd").click(function () {
            var data = $("#formDept").serialize();
            $.post("/dept/add", data, function (result) {
                if (result == 'true') {
                    swal({
                        title: "添加成功！",
                        type: "success"
                    }, function () {
                        location.href = "/dept/list";
                    });
                } else if (result == 'false') {
                    swal("添加失败！", "请检查数据有效性", "error");
                }
            }, "text");
        });

        //修改部门信息
        $(".update").click(function () {
            $(".btnUpdate").show();
            $(".btnAdd").hide();
            $(".cancel").show();
            var deptno = $(this).prop("id");
            $.post("/dept/toupdate", "deptno=" + deptno, function (result) {
                $("input[name=deptno]").val(result.deptno);
                $("input[name=dname]").val(result.dname);
                $("input[name=dlocation]").val(result.dlocation);
                $("input[name=deptno]").prop("readOnly", true);
            }, "json");
        });

        //取消
        $(".cancel").click(function () {
            $(".btnUpdate").hide();
            $(".btnAdd").show();
            $(".cancel").hide();
            $("input[name=deptno]").val("");
            $("input[name=dname]").val("");
            $("input[name=dlocation]").val("");
            $("input[name=deptno]").prop("readOnly", false);
        });

        //保存
        $(".btnUpdate").click(function () {
            var data = $("#formDept").serialize();
            var pageNum = "${page.pageNum}";
            $.post("/dept/update", data, function (result) {
                if (result == 'true') {
                    swal({
                        title: "修改成功！",
                        type: "success"
                    }, function () {
                        location.href = "/dept/list?pageNum=" + pageNum;
                    });
                } else if (result == 'false') {
                    swal("添加失败！", "请检查数据有效性", "error");
                }

            }, "text");
        });

        //点击删除
        $('.btndel').click(function () {
            var deptnos = $(this).prop("id");
            var pageNum = "${page.pageNum}";
            swal({
                title: "您确定要删除这条信息吗",
                text: "删除后将无法恢复，请谨慎操作！",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "删除",
                closeOnConfirm: false
            }, function () {
                doRemove(deptnos);
            })
        });

        $(".btnRemoveChecked").click(function () {
            swal({
                title: "您确定要删除这条信息吗",
                text: "删除后将无法恢复，请谨慎操作！",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "删除",
                closeOnConfirm: false

            }, function () {
                removeChecked();
            })
        });

        function removeChecked() {
            var deptnos = "";
            $("input:checked").each(function () {
                deptnos += "," + this.value;
            })
            deptnos = deptnos.substring(1);
            doRemove(deptnos);
        }

        function doRemove(deptnos) {
            $.post("/dept/remove", "deptnos=" + deptnos, function (result) {
                if (result == 'true') {
                    swal({
                        title: "删除成功！",
                        text: "删除成功，现在为您返回列表页",
                        type: "success"
                    }, function () {
                        location.href = "/dept/list?pageNum=${page.pageNum}";
                    });
                } else if (result == 'false') {
                    swal("删除失败！", "请稍后再试....", "error");
                } else {
                    swal({
                        title: "删除失败！",
                        text: "部门编号" + result + "存在关联数据，请先删除关联的数据！",
                        type: "error"
                    }, function () {
                        location.href = "/dept/list";
                    });
                }
            }, "text");
        }

    });
</script>

</body>


</html>
