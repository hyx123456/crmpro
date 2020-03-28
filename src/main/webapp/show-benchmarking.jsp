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
                    <h5>对标管理<small>>查看对标基本信息</small></h5>
                </div>
                <div class="ibox-content">
                    <form class="form-horizontal">
                        <div class="row">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">公司名称:</label>
                                <div class="col-sm-3 show-text">
                                    ${datacollect.dacname}
                                </div>
                                <label class="col-sm-2 col-sm-offset-1 control-label">营业额:</label>
                                <div class="col-sm-3 show-text">
                                    ${datacollect.daturnover}
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">年份:</label>
                                <div class="col-sm-3 show-text">
                                    <fmt:formatDate value="${datacollect.datime}" pattern="yyyy-MM-dd"/>
                                </div>
                                <label class="col-sm-2 col-sm-offset-1 control-label">员工数量:</label>
                                <div class="col-sm-3 show-text">
                                    ${datacollect.empcount}
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">行业地位:</label>
                                <div class="col-sm-3 show-text">
                                    ${datacollect.dasort}
                                </div>
                                <label class="col-sm-2 col-sm-offset-1 control-label">创建时间:</label>
                                <div class="col-sm-3 show-text">
                                    <fmt:formatDate value="${datacollect.buildtime}" pattern="yyyy-MM-dd"/>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">主要业务:</label>
                                <div class="col-sm-9 show-text">
                                    ${datacollect.dabusiness}
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">优势:</label>
                                <div class="col-sm-9 show-text">
                                    ${datacollect.dasuperiority}
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">劣势:</label>
                                <div class="col-sm-9 show-text">
                                    ${datacollect.dainforiority}
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">简单描述:</label>
                                <div class="col-sm-9 show-text">
                                    ${datacollect.remark}
                                </div>
                            </div>
                        </div>
                    </form>
                    <div class="row">
                        <div class="hr-line-dashed"></div>
                    </div>


                    <div class="row">
                        <div class="form-group">

                            <div class="col-sm-3 col-sm-offset-4">
                                <a href="/datacollect/list?pageNum=${pageNum}" class="btn btn-white"><i
                                        class="fa fa-reply"></i> 返回</a>
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
<script src="${pageContext.request.contextPath}/js/plugins/sweetalert/sweetalert.min.js"></script>
<script src="${pageContext.request.contextPath}/js/plugins/select/bootstrap-select.min.js"></script>
<script src="${pageContext.request.contextPath}/js/plugins/layer/laydate/laydate.js"></script>
<script src="${pageContext.request.contextPath}/js/inputfile.js"></script>
<script>
    $(document).ready(function () {
        // 设置按钮的样式
        $('.selectpicker').selectpicker('setStyle', 'btn-white');
        //初始化日期控件
        laydate({elem: "#finish"});
        laydate({elem: "#buid"});
        laydate({elem: "#start"});

    });
</script>
<!-- 修复日期控件长度-->
<link href="${pageContext.request.contextPath}/css/customer.css" rel="stylesheet">
</body>


</html>
