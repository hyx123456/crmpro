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
    <link href="${pageContext.request.contextPath}/css/animate.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style.min862f.css?v=4.1.0" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/plugins/select/bootstrap-select.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
</head>

<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">

    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>任务管理<small>>修改任务</small></h5>
                </div>
                <div class="ibox-content">
                    <form id="formAdd" class="form-horizontal">
                        <input type="hidden" name="id" value="${task.id}">
                        <div class="row">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">参考位置</label>
                                <div class="col-sm-9 show-text">
                                    【项目】${task.function.project.name}-->
                                    【需求】${task.function.analysis.title}-->
                                    【模块】${task.function.module.modulename}-->
                                    【功能】${task.function.functionname}
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">任务标题</label>
                                <div class="col-sm-3">
                                    <input name="tasktitle" value="${task.tasktitle}" type="text"
                                           class="form-control input-sm">
                                </div>
                                <label class="col-sm-2 col-sm-offset-1 control-label">执行者</label>
                                <div class="col-sm-3">
                                    <select id="executorSelect" name="empFk2" class="selectpicker form-control">
                                        <option>选择执行者</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">开始时间</label>
                                <div class="col-sm-3">
                                    <input name="starttime" id="start"
                                           value="<fmt:formatDate value="${task.starttime}" pattern="yyyy-MM-dd" />"
                                           class="laydate-icon form-control layer-date">
                                </div>
                                <label class="col-sm-2 col-sm-offset-1 control-label">结束时间</label>
                                <div class="col-sm-3">
                                    <input name="endtime" id="end"
                                           value="<fmt:formatDate value="${task.endtime}" pattern="yyyy-MM-dd" />"
                                           class="laydate-icon form-control layer-date">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">优先级</label>
                                <div class="col-sm-3">
                                    <select name="level" class="selectpicker form-control">
                                        <option value="高" <c:if test="${task.level=='高'}">selected</c:if>>高</option>
                                        <option value="中" <c:if test="${task.level=='中'}">selected</c:if>>中</option>
                                        <option value="低" <c:if test="${task.level=='低'}">selected</c:if>>低</option>
                                        <option value="暂缓" <c:if test="${task.level=='暂缓'}">selected</c:if>>暂缓</option>
                                    </select>
                                </div>
                            </div>
                        </div>


                        <div class="row">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">备注</label>
                                <div class="col-sm-9">
                                    <textarea name="remark" class="form-control">${task.remark}</textarea>
                                </div>
                            </div>
                        </div>


                        <div class="row">
                            <div class="hr-line-dashed"></div>
                        </div>

                        <div class="row">
                            <div class="form-group">
                                <div class="col-sm-3 col-sm-offset-3 text-right">
                                    <button type="button" class="btn btn-primary btnAdd"><i class="fa fa-save"></i> 保存内容
                                    </button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>


<script src="${pageContext.request.contextPath}/js/jquery.min.js?v=2.1.4"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js?v=3.3.6"></script>
<script src="${pageContext.request.contextPath}/js/plugins/sweetalert/sweetalert.min.js"></script>
<script src="${pageContext.request.contextPath}/js/plugins/select/bootstrap-select.min.js"></script>
<script src="${pageContext.request.contextPath}/js/plugins/layer/laydate/laydate.js"></script>

<script>
    $(document).ready(function () {
        // 设置按钮的样式
        $('.selectpicker').selectpicker('setStyle', 'btn-white');
        //初始化日期控件
        laydate({elem: "#end"});
        laydate({elem: "#start"});

        loadExecutor();

        function loadExecutor() {
            var pfks = [1, 2, 3];
            var roles = new Array("【初级程序员】", "【中级程序员】", "【高级程序员】");
            for (var i = 0; i < pfks.length; i++) {
                getExecutor(pfks[i], roles[i]);
            }
        }

        //加载执行者
        function getExecutor(pfk, role) {
            var executorEid = ${task.executor.eid};
            $.post("/employee/getByPfk", "pfk=" + pfk, function (result) {
                if (result != null) {
                    $(result).each(function () {
                        if (this.eid == executorEid) {
                            var option = "<option selected value='" + this.eid + "'>" + role + this.ename + "</option>";
                            $("#executorSelect").append(option).selectpicker("refresh");
                        } else {
                            var option = "<option value='" + this.eid + "'>" + role + this.ename + "</option>";
                            $("#executorSelect").append(option).selectpicker("refresh");
                        }
                    });
                }
            }, "json");
        }

        $(".btnAdd").click(function () {
            var data = $("#formAdd").serialize();
            $.post("/task/update", data, function (result) {
                if (result == 'true') {
                    swal({
                        title: "修改成功！",
                        text: "修改成功，现在为您返回任务信息",
                        type: "success"
                    }, function () {
                        location.href = "/task/list";
                    });
                } else if (result == 'false') {
                    swal("修改失败！", "请检查数据有效性", "error");
                }
            }, "text");
        });


    });
</script>
<!-- 修复日期控件长度-->
<link href="${pageContext.request.contextPath}/css/customer.css" rel="stylesheet">
</body>


</html>
