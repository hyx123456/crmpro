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
                    <h5>档案管理<small>>采集档案信息</small></h5>
                </div>
                <div class="ibox-content">
                    <form id="formAdd" class="form-horizontal">


                        <div class="row">
                            <div class="form-group">
                                <div id="file-pretty">
                                    <label class="col-sm-3 control-label">采集信息附件</label>
                                    <div class="col-sm-4">
                                        <!---->
                                        <input name="myfiles" type="file" class="form-control">
                                    </div>
                                </div>
                            </div>
                        </div>


                        <div class="row">
                            <div class="hr-line-dashed"></div>
                        </div>

                        <div class="row">
                            <div class="form-group">
                                <div class="col-sm-3 col-sm-offset-3 text-right">
                                    <button type="button" class="btn btn-primary btnAdd"><i class="fa fa-save"></i> 上传
                                    </button>
                                </div>
                                <div class="col-sm-3">
                                    <a href="/archives/list" class="btn btn-white"><i class="fa fa-reply"></i> 返回</a>
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
<script src="${pageContext.request.contextPath}/js/inputfile.js"></script>

<script>
    $(document).ready(function () {

        // 设置按钮的样式
        $('.selectpicker').selectpicker('setStyle', 'btn-white');

        $(".btnAdd").click(function () {
            $.ajax({
                url: "/archives/collect",
                type: "POST",
                dataType: "text",
                cache: false,
                data: new FormData($("#formAdd")[0]),
                processData: false,
                contentType: false,
                success: function (result) {

                    if (result == "true") {
                        swal({
                            title: "上传成功",
                            type: "success",
                        }, function () {
                            location.href = "/archives/list";
                        });
                    } else if (result == "nofile") {
                        swal({
                            title: "上传失败",
                            text: "请选择有效的文件！",
                            type: "error",
                        });
                    } else if (result == 'false') {
                        swal({
                            title: "上传失败",
                            text: "请选择有效的文件！",
                            type: "error",
                        });
                    } else {
                        swal({
                            title: "部分上传成功",
                            text: "员工" + result + "不存在",
                            type: "warning",
                        }, function () {
                            location.href = "/archives/list";
                        });
                    }
                }
            });
        });

    });
</script>
</body>


</html>
