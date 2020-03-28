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
    <link href="${pageContext.request.contextPath}/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/animate.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style.min862f.css?v=4.1.0" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/plugins/select/bootstrap-select.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/customer.css" rel="stylesheet">
</head>

<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">

    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>信箱<small>>消息推送</small></h5>
                </div>
                <div class="ibox-content">
                    <form id="formSend" class="form-horizontal">

                        <div class="row">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">收件人</label>
                                <div class="col-sm-4">
                                    <select id="selectReceive" name="receive" class="selectpicker form-control">
                                        <option>---选择收件人---</option>
                                    </select>
                                </div>
                            </div>
                        </div>
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
                                    <input id="inpContent" type="hidden" name="content">
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="form-group">
                                <div id="file-pretty">
                                    <label class="col-sm-2 control-label">附件</label>
                                    <div class="col-sm-4">
                                        <input name="myfile" type="file" class="form-control">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">标签</label>
                                <div class="col-sm-9 tips">
                                    <input type="radio" name="type" value="1">工作
                                    <input type="radio" name="type" value="2">文档
                                    <input type="radio" name="type" value="3">社交
                                    <input type="radio" name="type" value="4">广告
                                </div>
                            </div>
                        </div>


                        <div class="row">
                            <div class="hr-line-dashed"></div>
                        </div>

                        <div class="row">
                            <div class="form-group">
                                <div class="col-sm-11 text-right">
                                    <input type="hidden" id="status" name="status">
                                    <button type="button" id="btnSend" class="btn btn-primary"><i
                                            class="fa fa-paper-plane"></i> 发送
                                    </button>
                                    <a href="/msg/list" class="btn btn-white">
                                        <i class="fa fa-times"></i>放弃</a>
                                    <button type="button" class="btn btn-white" id="btnDraft">
                                        <i class="fa fa-pencil"></i>存为草稿
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

        //加载收件人
        getReceive();

        function getReceive() {
            $.post("/employee/getjson", "", function (result) {
                var send = ${LOGIN.eid};
                for (var i = 0; i < result.length; i++) {
                    if (result[i].eid == send) {
                        continue;
                    }
                    var option = "<option value='" + result[i].eid + "'>" + result[i].ename + "</option>";
                    $("#selectReceive").append(option).selectpicker("refresh");
                }
            }, "json");
        }

        $("#btnSend").click(function () {
            send(0, "发送");
        });

        $("#btnDraft").click(function () {
            send(2, "保存");
        });

        function send(status, message) {
            $("#inpContent").val(ue.getContent());
            $("#status").val(status);
            $.ajax({
                url: "/msg/send",
                type: "POST",
                dataType: "text",
                cache: false,
                data: new FormData($("#formSend")[0]),
                processData: false,
                contentType: false,
                success: function (result) {
                    if (result == 'true') {
                        swal(message + "成功！", "您的邮件已" + message, "success");
                        $("#formSend")[0].reset();
                    } else if (result == 'false') {
                        swal(message + "失败！", "请检查数据有效性", "error");
                    }
                }
            });
        }

    });
</script>
<style>
    .edui-box {
        width: 30px;
        height: 30px;
    }

</style>
</body>


</html>
