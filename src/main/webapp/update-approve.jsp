<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
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
                    <h5>报销<small>>报销审批</small></h5>
                </div>
                <div class="ibox-content">
                    <form id="approve" class="form-horizontal">
                        <input type="hidden" name="bxid" value="${baoxiao.bxid}">
                        <input type="hidden" name="bxstatus">
                        <div class="row">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">支出类型</label>
                                <div class="col-sm-3">
                                    <label class="control-label">${baoxiao.paymode}</label>
                                </div>
                                <label class="col-sm-2 control-label">使用时间</label>
                                <div class="col-sm-3">
                                    <label class="control-label"><fmt:formatDate value='${baoxiao.bxtime}'
                                                                                 pattern='yyyy-MM-dd'/></label>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">总金额</label>
                                <div class="col-sm-3">
                                    <label class="control-label">${baoxiao.totalmoney}</label>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">备注</label>
                                <div class="col-sm-9">
                                    <label class="control-label">${baoxiao.bxremark}</label>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">批准信息</label>
                                <div class="col-sm-9">
                                    <textarea name="result" class="form-control"></textarea>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="hr-line-dashed"></div>
                        </div>
                        <div class="row">
                            <div class="form-group">
                                <div class="col-sm-2 col-sm-offset-3 text-right">
                                    <button type="button" id="btnok" class="btn btn-primary"><i class="fa fa-check"></i>
                                        同意
                                    </button>
                                </div>
                                <div class="col-sm-2">
                                    <button type="button" id="btnno" class="btn btn-danger"><i class="fa fa-close"></i>驳回
                                    </button>
                                </div>
                                <div class="col-sm-2">
                                    <a href="/baoxiao/list?status=1&pageNum=${pageNum}" class="btn btn-white"><i
                                            class="fa fa-reply"></i> 返回</a>
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
<script src="${pageContext.request.contextPath}/js/inputfile.js"></script>

<script>
    $(document).ready(function () {

        // 设置按钮的样式
        $('.selectpicker').selectpicker('setStyle', 'btn-white');


        $("#btnno").click(function () {
            $("input[name=bxstatus]").val(0);
            var data = $("#approve").serialize();
            $.post("/baoxiao/update", data, function (result) {
                if (result == 'true') {
                    swal({
                        title: "审批成功！",
                        text: "审批成功，现在为您返回列表页",
                        type: "success"
                    }, function () {
                        location.href = "/baoxiao/list?status=1";
                    });
                } else if (result == 'false') {
                    swal("审批失败！", "数据异常", "error");
                }
            }, "text");
        });

        $("#btnok").click(function () {
            $("input[name=bxstatus]").val(2);
            approve();
        });

        function approve() {
            var data = $("#approve").serialize();
            $.post("/baoxiao/update", data, function (result) {
                if (result == 'true') {
                    swal({
                        title: "审批成功！",
                        text: "审批成功，现在为您返回列表页",
                        type: "success"
                    }, function () {
                        location.href = "/baoxiao/list?status=1";
                    });
                } else if (result == 'false') {
                    swal("审批失败！", "数据异常", "error");
                }
            }, "text");
        }
    });
</script>
</body>


</html>
