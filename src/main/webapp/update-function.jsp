<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                    <form id="saveForm" class="form-horizontal">
                        <input type="hidden" name="id" value="${function.id}"/>
                        <div class="row">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">选择项目</label>
                                <div class="col-sm-3">
                                    <input type="text" value="${function.project.name}"
                                           class="form-control input-sm" readonly/>
                                    <input type="hidden" name="proFk" value="${function.project.pid}"/>
                                </div>
                                <label class="col-sm-2 col-sm-offset-1 control-label">需求</label>
                                <div class="col-sm-3">
                                    <input type="text" value="${function.analysis.title}"
                                           class="form-control input-sm" readonly/>
                                    <input type="hidden" name="analysisFk" value="${function.analysis.id}"/>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">选择模块</label>
                                <div class="col-sm-3">
                                    <select id="moduleSelect" name="moduleFk" class="selectpicker form-control">
                                    </select>
                                </div>
                                <label class="col-sm-2 col-sm-offset-1 control-label">优先级</label>
                                <div class="col-sm-3">
                                    <select name="level" id="levelText" class="selectpicker form-control">
                                        <option value="高" <c:if test="${function.level=='高'}">selected</c:if>>高</option>
                                        <option value="中" <c:if test="${function.level=='中'}">selected</c:if>>中</option>
                                        <option value="低" <c:if test="${function.level=='低'}">selected</c:if>>低</option>
                                        <option value="暂缓" <c:if test="${function.level=='暂缓'}">selected</c:if>>暂缓
                                        </option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">功能名称</label>
                                <div class="col-sm-3">
                                    <input name="functionname" type="text" value="${function.functionname}"
                                           class="form-control input-sm">
                                </div>

                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">简单描述</label>
                                <div class="col-sm-9">
                                    <textarea name="simpledis" class="form-control">${function.simpledis}</textarea>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">详细描述</label>
                                <div class="col-sm-9">
                                    <textarea name="detaileddis" class="form-control">${function.detaileddis}</textarea>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">备注</label>
                                <div class="col-sm-9">
                                    <textarea name="remark" class="form-control">${function.remark}</textarea>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="hr-line-dashed"></div>
                        </div>

                        <div class="row">
                            <div class="form-group">
                                <div class="col-sm-3 col-sm-offset-3 text-right">
                                    <button type="button" id="btnUpdate" class="btn btn-primary"><i
                                            class="fa fa-save"></i> 保存修改内容
                                    </button>
                                </div>
                                <div class="col-sm-3">
                                    <a href="/function/list?pageNum=${pageNum}" class="btn btn-white"><i
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

        //保存修改
        $("#btnUpdate").click(function () {
            var data = $("#saveForm").serialize();
            $.post("/function/update", data, function (result) {
                if (result == "true") {
                    swal({
                        title: "修改成功",
                        text: "修改成功！为您返回列表页！",
                        type: "success"
                    }, function () {
                        location.href = "/function/list";
                    });
                } else {
                    swal("修改失败", "修改失败，请检查数据有效性", "error");
                }
            }, "text");
        });


        //加载模块
        loadModule();

        function loadModule() {
            var analysisFk = "${function.analysisFk}";
            var moduleFk = "${function.moduleFk}";
            $.post("/module/checkbyid", "id=" + analysisFk, function (result) {
                $(result).each(function () {
                    if (moduleFk == this.id) {
                        var option = "<option selected value='" + this.id + "'>" + this.modulename + "</option>";
                    } else {
                        var option = "<option value='" + this.id + "'>" + this.modulename + "</option>";
                    }
                    $("#moduleSelect").append(option).selectpicker("refresh");

                });
            }, "json");
        }

    })
</script>

</body>


</html>
