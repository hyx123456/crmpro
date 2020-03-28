<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
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

</head>

<body class="gray-bg">
<div class="wrapper2 wrapper-content2 animated fadeInRight">
    <div class="ibox float-e-margins">
        <div class="ibox-content">
            <div class="row">
                <form action="/datacollect/list" method="post">
                    <div class="col-sm-3 text-right">
                        <h3><small>搜索条件:</small></h3>
                    </div>
                    <div class="col-sm-2">
                        <select name="type" class="selectpicker form-control">
                            <option value="0">选择类型</option>
                            <option value="1"
                                    <c:if test="${type==1}">selected</c:if> >企业名称
                            </option>
                        </select>
                    </div>

                    <div class="col-sm-3">
                        <div class="input-group">
                            <input type="text" name="keyword" value="${keyword}" placeholder="请输入关键词"
                                   class="input-sm form-control">
                            <span class="input-group-btn">
                                        <button type="submit" class="btn btn-sm btn-primary"><i
                                                class="fa fa-search"></i> 搜索</button>
                                    </span>
                        </div>

                    </div>
                </form>

                <div class="col-sm-2 text-right">
                    <a href="/save-benchmarking.jsp" class="btn btn-sm btn-primary" type="button"><i
                            class="fa fa-plus-circle"></i>添加对标信息</a>
                </div>
                <div class="col-sm-2 text-right">
                    <a href="/save-benchmarkingforfile.jsp" class="btn btn-sm btn-primary" type="button"><i
                            class="fa fa-plus-circle"></i>采集对标信息</a>
                </div>
            </div>
            <div class="hr-line-dashed2"></div>
            <div class="table-responsive">
                <table class="table table-striped list-table">
                    <thead>
                    <tr>
                        <th>选择</th>
                        <th>序号</th>
                        <th>企业名称</th>
                        <th>年营业额</th>
                        <th>企业性质</th>
                        <th>员工数量</th>
                        <th>成立时间</th>
                        <th class="text-center">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${list}" var="datacollect" varStatus="i">
                        <tr>
                            <td><input type="checkbox" value="${datacollect.daid}" data-num="${i.count}"></td>
                            <td>${i.count}</td>
                            <td>${datacollect.dacname}</td>
                            <td>${datacollect.daturnover}万</td>
                            <td>${datacollect.dabusiness}</td>
                            <td>${datacollect.empcount}</td>
                            <td><fmt:formatDate value="${datacollect.buildtime}" pattern="yyyy-MM-dd"/></td>
                            <td class="text-right">
                                <a href="/datacollect/info?daid=${datacollect.daid}&pageNum=${page.pageNum}"
                                   class="btn btn-primary btn-xs"><i
                                        class="fa fa-eye"></i>查看</a>
                                <a href="/datacollect/toupdate?daid=${datacollect.daid}&pageNum=${page.pageNum}"
                                   class="btn btn-primary btn-xs"><i class="fa fa-edit"></i>编辑</a>
                                <button data-daid="${datacollect.daid}" data-num="${i.count}"
                                        class="btn btn-danger btn-xs btndel"><i class="fa fa-close"></i>删除
                                </button>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>

            <div class="row">
                <div class="col-sm-5">
                    <button class="btn btn-sm btn-primary btnAll" type="button"><i class="fa fa-check-square-o"></i> 全选
                    </button>
                    <button class="btn btn-sm btn-primary btnReverse" type="button"><i class="fa fa-square-o"></i> 反选
                    </button>
                    <button class="btn btn-sm btn-primary btnRemoveChecked" type="button"><i
                            class="fa fa-times-circle-o"></i> 删除
                    </button>
                    <button id="demo1" class="btn btn-sm btn-primary" type="button"><i class="fa fa-table"></i> 导出Excel
                    </button>
                </div>
                <div class="col-sm-7 text-right">
                    <div class="btn-group">

                        <a href="/datacollect/list?pageNum=${page.pageNum-1}&type=${type}&keyword=${keyword}"
                           class="btn btn-sm btn-white <c:if test="${page.pageNum-1<1}">disabled</c:if>"><i
                                class="glyphicon glyphicon-chevron-left"></i>
                        </a>

                        <c:forEach begin="1" end="${page.pages}" varStatus="i">
                            <a href="/datacollect/list?pageNum=${i.index}&type=${type}&keyword=${keyword}"
                               class="btn btn-sm btn-white <c:if test="${page.pageNum==i.index}">active</c:if>">${i.index}</a>
                        </c:forEach>

                        <a href="/datacollect/list?pageNum=${page.pageNum+1}&type=${type}&keyword=${keyword}"
                           class="btn btn-sm btn-white <c:if test="${page.pageNum+1>page.pages}">disabled</c:if>"><i
                                class="glyphicon glyphicon-chevron-right"></i>
                        </a>

                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/js/jquery.min.js?v=2.1.4"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js?v=3.3.6"></script>
<script src="${pageContext.request.contextPath}/js/plugins/select/bootstrap-select.min.js"></script>
<script src="${pageContext.request.contextPath}/js/plugins/sweetalert/sweetalert.min.js"></script>

<script>
    $(document).ready(function () {
        // 设置按钮的样式
        $('.selectpicker').selectpicker('setStyle', 'btn-white').selectpicker('setStyle', 'btn-sm');

        //全选
        $(".btnAll").click(function () {
            $("input[type=checkbox]").prop("checked", "checked");
        });

        //反选btnReverse
        $(".btnReverse").click(function () {
            $("input[type=checkbox]").each(function () {
                var checked = $(this).prop("checked");
                $(this).prop("checked", !checked);
            })
        });

        //点击删除
        $('.btndel').click(function () {
            var daid = $(this).data("daid");
            var num = $(this).data("num");
            swal({
                title: "您确定要删除这条信息吗",
                text: "删除后将无法恢复，请谨慎操作！",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "删除",
                closeOnConfirm: false
            }, function () {
                doRemove(daid, num);
            })
        });

        $(".btnRemoveChecked").click(function () {
            swal({
                title: "您确定要删除这条信息吗",
                text: "删除后将无法恢复，请谨慎操作！",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "删除",
                closeOnConfirm: false

            }, function () {
                removeChecked();
            })
        });

        function removeChecked() {
            var daids = "";
            var nums = "";
            $("input:checked").each(function () {
                daids += "," + this.value;
                nums += "," + $(this).data("num");
            });
            daids = daids.substring(1);
            nums = nums.substring(1);
            doRemove(daids, nums);
        }

        function doRemove(daids, nums) {
            $.post("/datacollect/del", "daids=" + daids + "&nums=" + nums, function (result) {
                if (result == 'true') {
                    swal({
                        title: "删除成功！",
                        type: "success"
                    }, function () {
                        location.href = "/datacollect/list";
                    });
                } else if (result == 'false') {
                    swal("删除失败！", "请稍后再试....", "error");
                } else {
                    swal({
                        title: "删除失败！",
                        text: "序号" + result + "存在关联数据，请先删除关联的数据！",
                        type: "error"
                    }, function () {
                        location.href = "/datacollect/list";
                    });
                }
            }, "text");
        }
    });
</script>

</body>


</html>
