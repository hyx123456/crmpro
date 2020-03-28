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
    <link href="${pageContext.request.contextPath}/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/animate.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style.min862f.css?v=4.1.0" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/plugins/select/bootstrap-select.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/plugins/zTreeStyle/zTreeStyle.css"/>

</head>

<body class="gray-bg">
<div class="wrapper2 wrapper-content2 animated fadeInRight">
    <div class="row">
        <div class="col-sm-6">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>资源管理</h5>
                </div>
                <div class="ibox-content">
                    <div class="zTreeDemoBackground left" style="font-size: 16px">
                        <ul id="treeDemo" class="ztree"></ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-6">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>资源编辑</h5>
                </div>
                <div class="ibox-content">
                    <form class="form-horizontal formAdd">
                        <input type="hidden" name="id" value="0">
                        <div class="form-group">
                            <label class="col-sm-4 control-label">菜单资源名称：</label>

                            <div class="col-sm-7">
                                <input type="text" name="name" class="form-control">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-4 control-label">父菜单：</label>

                            <div class="col-sm-7">
                                <select name="pid" class="selectpicker form-control"></select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-4 control-label">菜单资源路径：</label>

                            <div class="col-sm-7">
                                <input type="text" name="url" class="form-control">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-4 control-label">备注：</label>
                            <div class="col-sm-7">
                                <textarea name="remark" class="form-control"></textarea>
                            </div>
                        </div>
                        <input type="hidden" id="operate" value="add">
                        <div class="form-group">
                            <div class="col-sm-offset-3 col-sm-8">
                                <button class="btn btn-sm btn-white btnAdd" type="button"><i class="fa fa-save"></i> 保存
                                </button>
                                <button class="btn btn-sm btn-white reset" type="button"><i class="fa fa-undo"></i> 重置
                                </button>
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
<script src="${pageContext.request.contextPath}/js/plugins/select/bootstrap-select.min.js"></script>
<script src="${pageContext.request.contextPath}/js/plugins/sweetalert/sweetalert.min.js"></script>
<script src="${pageContext.request.contextPath}/js/plugins/ztree/jquery.ztree.core.min.js"></script>
<script src="${pageContext.request.contextPath}/js/plugins/ztree/jquery.ztree.exedit.js"></script>

<SCRIPT type="text/javascript">


    var setting = {
        async: {
            enable: true,
            url: "/sources/listztree"
        },

        view: {
            addHoverDom: function (treeId, treeNode) {
                var aObj = $("#" + treeNode.tId + "_a"); // tId = permissionTree_1, ==> $("#permissionTree_1_a")
                aObj.attr("href", "javascript:void(0);");
                if (treeNode.editNameFlag || $("#btnGroup" + treeNode.tId).length > 0) return;
                var s = '<span id="btnGroup' + treeNode.tId + '">';
                if (treeNode.level == 1) {
                    s += '<span class="button edit" onclick="editNode(' + treeNode.id + ')"></span>';
                    if (treeNode.children.length == 0) {
                        s += '<span class="button remove" onclick="deleteNode(' + treeNode.id + ')"></span>';
                    }
                } else if (treeNode.level == 2) {
                    s += '<span class="button edit" onclick="editNode(' + treeNode.id + ')" ></span>';
                    s += '<span class="button remove" onclick="deleteNode(' + treeNode.id + ')" ></span>';
                }
                s += '</span>';
                aObj.append(s);
                aObj.removeAttr("target");
            },
            removeHoverDom: function (treeId, treeNode) {
                $("#btnGroup" + treeNode.tId).remove();
            }
        }

    };

    //编辑
    function editNode(id) {
        $.getJSON("/sources/info", "id=" + id, function (result) {
            $("input[name=id]").val(result.id);
            $("input[name=name]").val(result.name);
            $("input[name=url]").val(result.url);
            $("textarea[name=remark]").html(result.remark);
            $("select[name=pid]").selectpicker("val", result.pid);
            $("#operate").val("update");
        });
    }

    //添加
    function addNode(id) {
        alert("添加代码");
    }

    //删除
    function deleteNode(id) {
        swal({
            title: "您确定要删除这个资源吗",
            text: "删除后将无法恢复，请谨慎操作！",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "删除",
            closeOnConfirm: false
        }, function () {
            $.post("/sources/del", "id=" + id, function (result) {
                if (result == 'true') {
                    swal("删除成功！", "您已经永久删除了这个资源。", "success");
                    var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
                    treeObj.reAsyncChildNodes(null, "refresh");
                } else if (result == 'false') {
                    swal("删除失败！", "请检查数据有效性", "error");
                }
            }, "text");
        });

    }

    $(".btnAdd").click(function () {
        var data = $(".formAdd").serialize();
        var operate = $("#operate").val();
        $.post("/sources/" + operate, data, function (result) {
            if (result == 'true') {
                swal("保存成功！", "", "success");
                var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
                treeObj.reAsyncChildNodes(null, "refresh");
            } else if (result == 'false') {
                swal("保存失败！", "请检查数据有效性", "error");
            }
        }, "text");
    });

    $(".reset").click(function () {
        $("input[name=id]").val(0);
        $("#operate").val("add");
        $(".formAdd")[0].reset();
        $("select[name=pid]").selectpicker("val", 1);
        $("textarea[name=remark]").html("");
    });

    $(document).ready(function () {
        // 设置按钮的样式
        $('.selectpicker').selectpicker('setStyle', 'btn-white').selectpicker('setStyle', 'btn-sm');
        $.fn.zTree.init($("#treeDemo"), setting);

        loadUpper();

        function loadUpper() {
            $.getJSON("/sources/list", "", function (result) {
                $(result).each(function () {
                    var option = "<option value='" + this.id + "'>" + this.name + "</option>";
                    $("select[name=pid]").append(option).selectpicker("refresh");
                });
            });

        }
    });
</SCRIPT>
</body>


</html>
