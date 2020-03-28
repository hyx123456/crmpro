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
                    <h5>需求管理<small>>添加需求信息</small></h5>
                </div>
                <div class="ibox-content">
                    <form id="formUpdate" class="form-horizontal">
                        <input id="analysisFk" type="hidden" name="analysisFk"/>
                        <input type="hidden" name="id" value="${module.id}"/>
                        <div class="row">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">选择项目</label>
                                <div class="col-sm-3">
                                    <select id="proselect" name="projectname" class="selectpicker form-control">
                                        <option>---项目名称---</option>
                                    </select>
                                </div>
                                <label class="col-sm-2 col-sm-offset-1 control-label">选择需求</label>
                                <div class="col-sm-3">
                                    <input type="text" id="analysisName" value="${module.analysis.title}" readonly
                                           class="selectpicker form-control"/>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">模块名称</label>
                                <div class="col-sm-3">
                                    <input name="modulename" value="${module.modulename}" type="text"
                                           class="form-control input-sm">
                                </div>
                                <label class="col-sm-2 col-sm-offset-1 control-label">优先级</label>
                                <div class="col-sm-3">
                                    <select name="level" class="selectpicker form-control">
                                        <option
                                                <c:if test="${module.level=='高'}">selected</c:if> value="高">高
                                        </option>
                                        <option
                                                <c:if test="${module.level=='中'}">selected</c:if> value="中">中
                                        </option>
                                        <option
                                                <c:if test="${module.level=='低'}">selected</c:if> value="低">低
                                        </option>
                                        <option
                                                <c:if test="${module.level=='暂缓'}">selected</c:if> value="暂缓">暂缓
                                        </option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">简单描述</label>
                                <div class="col-sm-9">
                                    <textarea name="simpledis" class="form-control">${module.simpledis}</textarea>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">详细描述</label>
                                <div class="col-sm-9">
                                    <textarea name="detaileddis" class="form-control">${module.detaileddis}</textarea>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">备注</label>
                                <div class="col-sm-9">
                                    <textarea name="remark" class="form-control">${module.remark}</textarea>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="hr-line-dashed"></div>
                        </div>

                        <div class="row">
                            <div class="form-group">
                                <div class="col-sm-3 col-sm-offset-3 text-right">
                                    <button type="button" class="btn btn-primary btnUpdate"><i class="fa fa-save"></i>
                                        保存内容
                                    </button>
                                </div>
                                <div class="col-sm-3">
                                    <a href="/module/list" class="btn btn-white"><i class="fa fa-reply"></i> 返回</a>
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

        var proname = "${module.projectname}";

        //加载项目选择
        $.getJSON("/project/getall", "", function (result) {
            $(result).each(function () {
                if (this.name == proname) {
                    var option = "<option selected data-id='" + this.pid + "' value='" + this.name + "'>" + this.name + "</option>";
                    getAnalysisById(this.pid);
                } else {
                    var option = "<option data-id='" + this.pid + "' value='" + this.name + "'>" + this.name + "</option>";
                }

                $("#proselect").append(option).selectpicker("refresh");
            })
        });

        //根据选择的项目给id赋值
        $("#proselect").change(function () {
            var id;
            $(this).children().each(function () {
                if ($(this).prop("selected")) {
                    id = $(this).data("id");
                }
            })
            getAnalysisById(id);
        });

        //根据id判断选择的项目有没有需求表
        function getAnalysisById(id) {
            $.post("/analysis/getbyid", "id=" + id, function (result) {
                if (result == null) {
                    $("#analysisName").val("");
                    swal({
                        title: "选择无效！",
                        text: "您选择的项目没有添加需求，请先添加需求，是否前往添加页面",
                        type: "error",
                        showCancelButton: true,
                        confirmButtonColor: "#1ab394",
                        confirmButtonText: "yes",
                        closeOnConfirm: false
                    }, function () {
                        location.href = "/save-analysis.jsp";
                    });
                } else {
                    $("#analysisFk").val(id);
                    $("#analysisName").val(result.title);
                }
            }, "json");
        }

        $(".btnUpdate").click(function () {
            var data = $("#formUpdate").serialize();
            $.post("/module/update", data, function (result) {
                if (result == 'true') {
                    swal({
                        title: "添加成功！",
                        text: "添加成功，现在为您返回列表页",
                        type: "success"
                    }, function () {
                        location.href = "/module/list";
                    });
                } else if (result == 'false') {
                    swal("添加失败！", "请检查数据有效性", "error");
                }
            }, "text");
        });

        //--------------------下面是常用代码模版---------------------------------------


    });
</script>

</body>


</html>
