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
                    <h5>报销<small>>修改报销信息</small></h5>
                </div>
                <div class="ibox-content">
                    <form id="formUpdate" class="form-horizontal">
                        <input type="hidden" name="bxid" value="${baoxiao.bxid}">
                        <input type="hidden" name="bxstatus" value="1">
                        <div class="row">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">支出类型</label>
                                <div class="col-sm-3">
                                    <select name="paymode" class="selectpicker form-control">
                                        <option
                                                <c:if test="${baoxiao.paymode=='出差票据'}">selected</c:if> value="出差票据">
                                            出差票据
                                        </option>
                                        <option
                                                <c:if test="${baoxiao.paymode=='办公采购'}">selected</c:if> value="办公采购">
                                            办公采购
                                        </option>
                                        <option
                                                <c:if test="${baoxiao.paymode=='其他'}">selected</c:if> value="其他">其他
                                        </option>
                                    </select>
                                </div>
                                <label class="col-sm-2 control-label">使用时间</label>
                                <div class="col-sm-3">
                                    <!--时间控件的id都不能改-->
                                    <input name="bxtime" id="start"
                                           value="<fmt:formatDate value='${baoxiao.bxtime}' pattern='yyyy-MM-dd' />"
                                           class="laydate-icon form-control layer-date">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">总金额</label>
                                <div class="col-sm-3">
                                    <input name="totalmoney" value="${baoxiao.totalmoney}" type="text"
                                           class="form-control">
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">备注</label>
                                <div class="col-sm-9">
                                    <textarea name="bxremark" class="form-control">${baoxiao.bxremark}</textarea>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">批准信息</label>
                                <div class="col-sm-9">
                                    <textarea readonly name="remark" class="form-control">${baoxiao.result}</textarea>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="hr-line-dashed"></div>
                        </div>

                        <div class="row">
                            <div class="form-group">
                                <div class="col-sm-3 col-sm-offset-3 text-right">
                                    <button type="button" id="btnUpdate" class="btn btn-primary">提交</button>
                                </div>

                                <div class="col-sm-3">
                                    <a href="/baoxiao/list?pageNum=${pageNum}" class="btn btn-white">返回</a>
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
        //初始化日期控件
        laydate({elem: "#start"});

        $("#btnUpdate").click(function () {
            var data = $("#formUpdate").serialize();
            $.post("/baoxiao/update", data, function (result) {
                if (result == 'true') {
                    swal({
                        title: "修改成功！",
                        text: "修改成功，现在为您返回列表页",
                        type: "success"
                    }, function () {
                        location.href = "/baoxiao/list";
                    });
                } else if (result == 'false') {
                    swal("修改失败！", "请检查数据有效性", "error");
                }
            }, "text");
        });

    });
</script>
</body>


</html>
