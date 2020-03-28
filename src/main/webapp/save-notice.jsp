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
    <link href="${pageContext.request.contextPath}/css/customer.css" rel="stylesheet">
</head>

<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">

    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>信箱<small>>发布公告</small></h5>
                </div>
                <div class="ibox-content">
                    <form id="formSend" class="form-horizontal">

                        <div class="row">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">标题</label>
                                <div class="col-sm-9">
                                    <input name="title" type="text" class="form-control">
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">内容</label>
                                <div class="col-sm-9">
                                    <script id="editor" type="text/plain"></script>
                                    <input type="hidden" id="remark" name="remark">
                                    <input type="hidden" id="description" name="description">
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="form-group">
                                <div id="file-pretty">
                                    <label class="col-sm-2 control-label">附件</label>
                                    <div class="col-sm-4">
                                        <!---->
                                        <input name="myfile" type="file" class="form-control">
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
                                    <button type="button" id="btnSend" class="btn btn-primary"><i
                                            class="fa fa-paper-plane"></i> 发布
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
<script src="${pageContext.request.contextPath}/js/plugins/prettyfile/bootstrap-prettyfile.js"></script>
<script src="${pageContext.request.contextPath}/js/inputfile.js"></script>

<script type="text/javascript" charset="utf-8"
        src="${pageContext.request.contextPath}/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/ueditor/ueditor.all.js"></script>
<script type="text/javascript" charset="utf-8"
        src="${pageContext.request.contextPath}/ueditor/lang/zh-cn/zh-cn.js"></script>
<script>
    $(document).ready(function () {

        //实例化编辑器
        var ue = UE.getEditor('editor');

        // 设置按钮的样式
        $('.selectpicker').selectpicker('setStyle', 'btn-white');

        $("#btnSend").click(function () {

            $("#remark").val(ue.getContent());
            $("#description").val(ue.getContentTxt());
            $.ajax({
                url: "/notice/publish",
                type: "POST",
                dataType: "text",
                cache: false,
                data: new FormData($("#formSend")[0]),
                processData: false,
                contentType: false,
                success: function (result) {
                    if (result == 'true') {
                        swal("成功！", "您的公告已发布", "success");
                        $("#formSend")[0].reset();
                        /*$EDITORUI["edui51"]._onClick();*/
                    } else if (result == 'false') {
                        swal("失败！", "请检查数据有效性", "error");
                    }
                }
            });

        });
    });
</script>
</body>


</html>
