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
                    <h5>个人邮箱<small>>邮件信息</small></h5>
                </div>
                <div class="ibox-content">
                    <form method="get" action="#" class="form-horizontal">
                        <div class="row">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">标题:</label>
                                <div class="col-sm-9 show-text">
                                    ${msg.title}
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">发件人:</label>
                                <div class="col-sm-2 show-text">
                                    ${msg.sendEmp.ename}
                                </div>
                                <label class="col-sm-2 control-label">收件时间:</label>
                                <div class="col-sm-2 show-text">
                                    <fmt:formatDate value="${msg.time}" pattern="yyyy-MM-dd HH:mm:ss"/>
                                </div>
                                <label class="col-sm-1 control-label">标签:</label>
                                <div class="col-sm-3 show-text">
                                    <c:if test="${msg.type==1}">工作</c:if>
                                    <c:if test="${msg.type==2}">文档</c:if>
                                    <c:if test="${msg.type==3}">社交</c:if>
                                    <c:if test="${msg.type==4}">广告</c:if>
                                </div>
                            </div>
                        </div>


                        <div class="row">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">内容</label>
                                <div class="col-sm-9 show-text">
                                    ${msg.content}
                                </div>
                            </div>
                        </div>


                        <div class="row">
                            <div class="hr-line-dashed"></div>
                        </div>

                        <div class="row">
                            <div class="form-group">
                                <div class="col-sm-3 col-sm-offset-3 text-right">
                                    <a href="save-message.jsp" class="btn btn-primary"><i class="fa fa-paper-plane"></i>
                                        回复</a>
                                </div>
                                <div class="col-sm-3">
                                    <c:if test="${LOGIN.eid==msg.send}">
                                        <a href="/msg/list?who=1" class="btn btn-white"><i class="fa fa-reply"></i>
                                            返回</a>
                                    </c:if>
                                    <c:if test="${LOGIN.eid!=msg.send}">
                                        <a href="/msg/list" class="btn btn-white"><i class="fa fa-reply"></i> 返回</a>
                                    </c:if>
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


        //--------------------下面是常用代码模版---------------------------------------

        //下拉列表使用ajax加载说明例子
        function loadSelect() {
            var option = '<option value="0">-------请选择------</option><option value="4">用友软件</option><option selected value="5">浪潮软件</option>';
            $("#company").jsp(option);
            //ajax填充数据后需调用下面的方法来刷新下拉列表
            $("#company").selectpicker('refresh');
        }

        loadSelect();

        //点击按钮，消息提示框
        $("#demo1").click(function () {
            //基本消息框－留着备用
            swal({
                title: "恭喜，添加成功",
                text: "数据添加成功，为您返回列表页！"
            })
        });

        // 选择客户公司名称时自动选对应的客户方负责人
        $("#company").change(function () {
            var thisVal = $(this).val();
            //val指value属性,选中value属性＝thisVal的选项
            $('#customer').selectpicker('val', thisVal);
        });

    });
</script>
<link href="${pageContext.request.contextPath}/css/customer.css" rel="stylesheet">
</body>


</html>
