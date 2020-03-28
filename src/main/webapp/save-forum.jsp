<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
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
    <link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet">

    <link href="${pageContext.request.contextPath}/css/animate.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style.min862f.css?v=4.1.0" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/customer.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/plugins/select/bootstrap-select.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
</head>

<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">

    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>论坛<small>>发帖</small></h5>
                </div>
                <div class="ibox-content">
                    <form id="formAdd" class="form-horizontal">

                        <div class="row">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">标题</label>
                                <div class="col-sm-9">
                                    <input name="forumtitle" type="text" class="form-control input-sm">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">版块</label>
                                <div class="col-sm-4">
                                    <select id="sort" name="forumsortFk" class="selectpicker form-control">
                                        <option value="0">---选择版块---</option>

                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">内容</label>
                                <div class="col-sm-9">
                                    <script id="editor" type="text/plain"></script>
                                </div>
                            </div>
                            <input type="hidden" name="forumcontent">
                        </div>
                        <div class="row">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">标签</label>
                                <div class="col-sm-9 tips">
                                    <input name="label" value="1" type="checkbox">文件
                                    <input name="label" value="2" type="checkbox">资源
                                    <input name="label" value="3" type="checkbox">分享
                                    <input name="label" value="4" type="checkbox">技术
                                    <input name="label" value="5" type="checkbox">问答
                                    <input name="label" value="6" type="checkbox">讨论
                                    <input name="label" value="7" type="checkbox">其它
                                </div>
                            </div>
                        </div>


                        <div class="row">
                            <div class="hr-line-dashed"></div>
                        </div>

                        <div class="row">
                            <div class="form-group">
                                <div class="col-sm-3 col-sm-offset-3 text-right">
                                    <button type="button" id="btnAdd" class="btn btn-primary"><i class="fa fa-save"></i>
                                        发布内容
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

        //加载项目选择
        $.getJSON("/forumsort/listjson", "", function (result) {
            var bankuai = "主板块";
            $(result).each(function () {
                if (this.type == 1) {
                    bankuai = "副板块";
                }
                var option = "<option value='" + this.id + "'>【" + bankuai + "】" + this.title + "</option>";
                $("#sort").append(option).selectpicker("refresh");
            })
        });

        $("#btnAdd").click(function () {
            $("input[name=forumcontent]").val(ue.getContent());
            var data = $("#formAdd").serialize();
            $.post("/forumpost/add", data, function (result) {
                if (result == 'true') {
                    swal("发布成功！", "", "success");
                    ue.setContent("", false);
                    $("input[name=forumtitle]").val("");
                } else if (result == 'false') {
                    swal("发布失败！", "", "success");
                }
            }, "text");
        });


    });
</script>

</body>


</html>
