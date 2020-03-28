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
                    <h5>任务管理<small>>添加任务</small></h5>
                </div>
                <div class="ibox-content">
                    <form id="formAdd" class="form-horizontal">

                        <div class="row">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">参考位置</label>
                                <div class="col-sm-3">
                                    <select id="proselect" class="selectpicker form-control">
                                        <option>选择项目</option>
                                    </select>
                                </div>
                                <div class="col-sm-2">
                                    <select id="analysisSelect" class="selectpicker form-control">
                                        <option>选择需求</option>
                                    </select>
                                </div>
                                <div class="col-sm-2">
                                    <select id="moduleSelect" class="selectpicker form-control">
                                        <option>选择模块</option>
                                    </select>
                                </div>
                                <div class="col-sm-2">
                                    <select id="functionSelect" name="funFk" class="selectpicker form-control">
                                        <option>选择功能</option>
                                    </select>
                                </div>

                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">任务标题</label>
                                <div class="col-sm-3">
                                    <input name="tasktitle" type="text" class="form-control input-sm">
                                </div>
                                <label class="col-sm-2 col-sm-offset-1 control-label">执行者</label>
                                <div class="col-sm-3">
                                    <select id="executorSelect" name="empFk2" class="selectpicker form-control">
                                        <option>选择执行者</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">开始时间</label>
                                <div class="col-sm-3">
                                    <input name="starttime" id="start" class="laydate-icon form-control layer-date">
                                </div>
                                <label class="col-sm-2 col-sm-offset-1 control-label">结束时间</label>
                                <div class="col-sm-3">
                                    <input name="endtime" id="end" class="laydate-icon form-control layer-date">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">优先级</label>
                                <div class="col-sm-3">
                                    <select name="level" class="selectpicker form-control">
                                        <option value="高">高</option>
                                        <option value="中">中</option>
                                        <option value="低">低</option>
                                        <option value="暂缓">暂缓</option>
                                    </select>
                                </div>
                            </div>
                        </div>


                        <div class="row">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">备注</label>
                                <div class="col-sm-9">
                                    <textarea name="remark" class="form-control"></textarea>
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
        //初始化日期控件
        laydate({elem: "#end"});
        laydate({elem: "#start"});

        //加载项目选择
        $.getJSON("/project/getall", "", function (result) {
            $(result).each(function () {
                var option = "<option value='" + this.pid + "'>" + this.name + "</option>";
                $("#proselect").append(option).selectpicker("refresh");
            })
        });

        //根据选择的项目给id赋值
        $("#proselect").change(function () {
            var id = this.value;
            $("#analysisSelect").html("<option>选择需求</option>");
            getAnalysisById(id);
        });

        //根据id判断选择的项目有没有需求表
        function getAnalysisById(id) {
            $.post("/analysis/getbyid", "id=" + id, function (result) {
                if (result == null) {
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
                    var option = "<option value='" + result.id + "'>" + result.title + "</option>";
                    $("#analysisSelect").append(option).selectpicker("refresh");
                    checkModule(id);
                }
            }, "json");
        }

        //根据项目选择模块
        function checkModule(id) {
            $.post("/module/checkbyid", "id=" + id, function (result) {
                if (result.length == 0) {
                    swal({
                        title: "选择无效！",
                        text: "您选择的项目没有添加模块，请先添加模块，是否前往添加页面",
                        type: "error",
                        showCancelButton: true,
                        confirmButtonColor: "#1ab394",
                        confirmButtonText: "yes",
                        closeOnConfirm: false
                    }, function () {
                        location.href = "/save-module.jsp";
                    });
                } else {
                    $("#moduleSelect").html("<option>选择模块</option>");
                    $(result).each(function () {
                        var option = "<option value='" + this.id + "'>" + this.modulename + "</option>";
                        $("#moduleSelect").append(option).selectpicker("refresh");
                    })

                }
            }, "json");
        }

        //根据模块加载功能
        $("#moduleSelect").change(function () {
            var id = this.value;
            $.post("/function/listbymodulefk", "moduleFk=" + id, function (result) {
                if (result.length == 0) {
                    swal({
                        title: "选择无效！",
                        text: "您选择的模块没有添加功能，请先添加功能，是否前往添加页面",
                        type: "error",
                        showCancelButton: true,
                        confirmButtonColor: "#1ab394",
                        confirmButtonText: "yes",
                        closeOnConfirm: false
                    }, function () {
                        location.href = "/save-function.jsp";
                    });
                } else {
                    $("#functionSelect").html("<option>选择功能</option>");
                    $(result).each(function () {
                        var option = "<option value='" + this.id + "'>" + this.functionname + "</option>";
                        $("#functionSelect").append(option).selectpicker("refresh");
                    })

                }
            }, "json");
        });

        loadExecutor();

        function loadExecutor() {
            var pfks = [1, 2, 3];
            var roles = new Array("【初级程序员】", "【中级程序员】", "【高级程序员】");
            for (var i = 0; i < pfks.length; i++) {
                getExecutor(pfks[i], roles[i]);
            }
        }

        //加载执行者
        function getExecutor(pfk, role) {
            $.post("/employee/getByPfk", "pfk=" + pfk, function (result) {
                if (result != null) {
                    $(result).each(function () {
                        var option = "<option value='" + this.eid + "'>" + role + this.ename + "</option>";
                        $("#executorSelect").append(option).selectpicker("refresh");
                    });
                }
            }, "json");
        }

        //保存
        $(".btnAdd").click(function () {
            var data = $("#formAdd").serialize();
            $.post("/task/add", data, function (result) {
                if (result == 'true') {
                    swal({
                        title: "创建成功！",
                        type: "success"
                    }, function () {
                        $("#formAdd")[0].reset();
                    });
                } else if (result == 'false') {
                    swal("创建失败！", "请检查数据有效性", "error");
                }
            }, "text");
        });

    });
</script>
<!-- 修复日期控件长度-->
<link href="${pageContext.request.contextPath}/css/customer.css" rel="stylesheet">
</body>


</html>
