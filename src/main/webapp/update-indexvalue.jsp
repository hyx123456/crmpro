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
    <link rel="stylesheet" href="css/customer.css"/>
</head>

<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">

    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>对标管理<small>>修改指标基本信息</small></h5>
                </div>
                <div class="ibox-content">
                    <form class="form-horizontal">

                        <div class="row indexvalue-title">
                            <div class="col-sm-12 list-group-item-info indexvalue-text">
                                <h4> 对标企业信息如下 <i class="fa fa-hand-o-down"></i></h4>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">公司名称:</label>
                                <div class="col-sm-3 show-text">
                                    ${indexvalue.datacollect.dacname}
                                </div>
                                <label class="col-sm-2 col-sm-offset-1 control-label">营业额:</label>
                                <div class="col-sm-3 show-text">
                                    ${indexvalue.datacollect.daturnover}
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">年份:</label>
                                <div class="col-sm-3 show-text">
                                    <fmt:formatDate value="${indexvalue.datacollect.datime}" pattern="yyyy-MM-dd"/>
                                </div>
                                <label class="col-sm-2 col-sm-offset-1 control-label">员工数量:</label>
                                <div class="col-sm-3 show-text">
                                    ${indexvalue.datacollect.empcount}
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">行业地位:</label>
                                <div class="col-sm-3 show-text">
                                    ${indexvalue.datacollect.dasort}
                                </div>
                                <label class="col-sm-2 col-sm-offset-1 control-label">创建时间:</label>
                                <div class="col-sm-3 show-text">
                                    <fmt:formatDate value="${indexvalue.datacollect.buildtime}" pattern="yyyy-MM-dd"/>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">主要业务:</label>
                                <div class="col-sm-9 show-text">
                                    ${indexvalue.datacollect.dabusiness}
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">优势:</label>
                                <div class="col-sm-9 show-text">
                                    ${indexvalue.datacollect.dasuperiority}
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">劣势:</label>
                                <div class="col-sm-9 show-text">
                                    ${indexvalue.datacollect.dainforiority}
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">简单描述:</label>
                                <div class="col-sm-9 show-text">
                                    ${indexvalue.datacollect.dainforiority}
                                </div>
                            </div>
                        </div>
                    </form>

                    <div class="row indexvalue-title">
                        <div class="col-sm-12 list-group-item-info indexvalue-text">
                            <h4>修改对标信息 <i class="fa fa-hand-o-down"></i></h4>
                        </div>
                    </div>

                    <form id="formAdd" class="form-horizontal">
                        <input type="hidden" name="inId" value="${indexvalue.inId}">
                        <div class="row">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">目标公司</label>
                                <div class="col-sm-3">
                                    <input value="${indexvalue.datacollect.dacname}" readonly type="text"
                                           class="form-control input-sm">
                                </div>
                                <label class="col-sm-2 col-sm-offset-1 control-label">目标营业额</label>
                                <div class="col-sm-3">
                                    <input name="inTurnover" value="${indexvalue.inTurnover}" type="text"
                                           class="form-control input-sm">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">业务方向</label>
                                <div class="col-sm-3">
                                    <input name="inBusiness" value="${indexvalue.inBusiness}" type="text"
                                           class="form-control input-sm">
                                </div>
                                <label class="col-sm-2 col-sm-offset-1 control-label">开始时间</label>
                                <div class="col-sm-3">
                                    <input name="inStarttime" id="start" class="laydate-icon form-control layer-date"
                                           value="<fmt:formatDate value='${indexvalue.inStarttime}' pattern='yyyy-MM-dd' />">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">上传详细计划书</label>
                                <div class="col-sm-3">
                                    <input name="files" type="file" class="form-control">
                                    <span id="inFile">${indexvalue.inFile}</span>
                                </div>


                                <label class="col-sm-2 col-sm-offset-1 control-label">截止时间</label>
                                <div class="col-sm-3">
                                    <input name="inEndtime" id="finish" class="laydate-icon form-control layer-date"
                                           value="<fmt:formatDate value='${indexvalue.inEndtime}' pattern='yyyy-MM-dd' />">
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">备注</label>
                                <div class="col-sm-9">
                                    <textarea name="inRemark" class="form-control">${indexvalue.inRemark}</textarea>
                                </div>
                            </div>
                        </div>
                    </form>
                    <div class="row">
                        <div class="hr-line-dashed"></div>
                    </div>

                    <div class="row">
                        <div class="form-group">
                            <div class="col-sm-3 col-sm-offset-3 text-right">
                                <button type="button" id="btnAdd" class="btn btn-primary"><i class="fa fa-save"></i>
                                    保存内容
                                </button>
                            </div>
                            <div class="col-sm-3">
                                <a href="/indexvalue/list?pageNum=${pageNum}" class="btn btn-white"><i
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
        laydate({elem: "#start"});

        $("input[name=files]").change(function () {
            $("#inFile").html("");
        });

        $("#btnAdd").click(function () {
            $.ajax({
                url: "/indexvalue/update",
                type: "POST",
                dataType: "text",
                cache: false,
                data: new FormData($("#formAdd")[0]),
                processData: false,
                contentType: false,
                success: function (result) {
                    if (result == 'true') {
                        swal({
                            title: "修改成功",
                            type: "success"
                        }, function () {
                            location.href = "/indexvalue/list";
                        });
                    } else if (result == 'false') {
                        swal({
                            title: "修改失败",
                            text: "请检查数据有效性！",
                            type: "warning",
                        });
                    }
                }
            });
        });

    });
</script>
<!-- 修复日期控件长度-->
<link href="${pageContext.request.contextPath}/css/customer.css" rel="stylesheet">
</body>


</html>
