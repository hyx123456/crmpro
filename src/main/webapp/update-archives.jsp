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
                    <h5>档案管理<small>>修改档案信息</small></h5>
                </div>
                <div class="ibox-content">
                    <form class="form-horizontal formUpdate">
                        <input type="hidden" name="no" value="${archives.no}">
                        <div class="row">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">姓名</label>
                                <div class="col-sm-3">
                                    <input readonly value="${archives.employee.ename}" type="text"
                                           class="form-control input-sm">
                                </div>
                                <label class="col-sm-2 col-sm-offset-1 control-label">毕业院校</label>
                                <div class="col-sm-3">
                                    <input name="school" value="${archives.school}" type="text"
                                           class="form-control input-sm">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">专业</label>
                                <div class="col-sm-3">
                                    <input name="major" value="${archives.major}" type="text"
                                           class="form-control input-sm">
                                </div>
                                <label class="col-sm-2 col-sm-offset-1 control-label">毕业时间</label>
                                <div class="col-sm-3">
                                    <input name="graduate"
                                           value="<fmt:formatDate value='${archives.graduate}' pattern='yyyy-MM-dd'/>"
                                           id="finish" class="laydate-icon form-control layer-date">
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">学历</label>
                                <div class="col-sm-3">
                                    <input name="education" value="${archives.education}" type="text"
                                           class="form-control input-sm">
                                </div>
                                <label class="col-sm-2 col-sm-offset-1 control-label">政治面貌</label>
                                <div class="col-sm-3">
                                    <input name="politics" value="${archives.politics}" type="text"
                                           class="form-control input-sm">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">民族</label>
                                <div class="col-sm-3">
                                    <input name="nation" value="${archives.nation}" type="text"
                                           class="form-control input-sm">
                                </div>
                                <label class="col-sm-2 col-sm-offset-1 control-label">紧急联系人</label>
                                <div class="col-sm-3">
                                    <input name="contact" value="${archives.contact}" type="text"
                                           class="form-control input-sm">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">邮箱</label>
                                <div class="col-sm-3">
                                    <input name="email" value="${archives.email}" type="text"
                                           class="form-control input-sm">
                                </div>
                                <label class="col-sm-2 col-sm-offset-1 control-label">固话</label>
                                <div class="col-sm-3">
                                    <input name="telephone" value="${archives.telephone}" type="text"
                                           class="form-control input-sm">
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">入职日期</label>
                                <div class="col-sm-3">
                                    <input name="hiredate"
                                           value="<fmt:formatDate value='${archives.hiredate}' pattern='yyyy-MM-dd'/>"
                                           id="buid" class="laydate-icon form-control layer-date">
                                </div>

                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">备注</label>
                                <div class="col-sm-9">
                                    <textarea name="remark" class="form-control">${archives.remark}</textarea>
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
                                <div class="col-sm-3">
                                    <a href="/archives/list?pageNum=${pageNum}" class="btn btn-white"><i
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
<script>
    $(document).ready(function () {
        // 设置按钮的样式
        $('.selectpicker').selectpicker('setStyle', 'btn-white');


        $(".btnAdd").click(function () {
            var data = $(".formUpdate").serialize();
            $.post("/archives/update", data, function (result) {
                if (result == 'true') {
                    swal({
                        title: "修改成功！",
                        text: "修改档案成功，现在为您返回列表页"
                    }, function () {
                        location.href = "/archives/list";
                    });
                } else if (result == 'false') {
                    swal("修改失败！", "请检查数据有效性", "error");
                }
            }, "text");
        });

        //初始化日期控件
        laydate({elem: "#finish"});
        laydate({elem: "#buid"});
    });
</script>
<!-- 修复日期控件长度-->
<link href="${pageContext.request.contextPath}/css/customer.css" rel="stylesheet">
</body>


</html>
