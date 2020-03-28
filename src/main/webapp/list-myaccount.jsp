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
    <link href="${pageContext.request.contextPath}/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/animate.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style.min862f.css?v=4.1.0" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/plugins/select/bootstrap-select.min.css" rel="stylesheet">
</head>

<body class="gray-bg">
<div class="wrapper2 wrapper-content2 animated fadeInRight">
    <div class="ibox float-e-margins">
        <div class="ibox-content">
            <form action="/baoxiao/list" method="post">
                <div class="row">
                    <div class="col-sm-3 col-sm-offset-4 text-right">
                        <h3><small>搜索条件:</small></h3>
                    </div>
                    <div class="col-sm-2">
                        <select name="type" class="selectpicker form-control">
                            <option value="0">选择类型</option>
                            <option
                                    <c:if test="${type==1}">selected</c:if> value="1">单号
                            </option>

                        </select>
                    </div>

                    <div class="col-sm-3">
                        <div class="input-group">
                            <input type="text" value="${keyword}" name="keyword" placeholder="请输入关键词"
                                   class="input-sm form-control">
                            <span class="input-group-btn">
                                        <button type="submit" class="btn btn-sm btn-primary"><i
                                                class="fa fa-search"></i> 搜索</button>
                                    </span>
                        </div>

                    </div>

                </div>
            </form>

            <div class="hr-line-dashed2"></div>
            <div class="table-responsive">
                <table class="table table-striped list-table">
                    <thead>
                    <tr>
                        <th>单号</th>
                        <th>类型</th>
                        <th>报销人</th>
                        <th>总金额</th>
                        <th>使用时间</th>
                        <th>备注信息</th>
                        <th>审批意见</th>
                        <th>审批状态</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${list}" var="baoxiao">
                        <tr>
                            <td>${baoxiao.bxid}</td>
                            <td>${baoxiao.paymode}</td>
                            <td>${baoxiao.employee.ename}</td>
                            <td>${baoxiao.totalmoney}</td>
                            <td><fmt:formatDate value="${baoxiao.bxtime}" pattern="yyyy-MM-dd"/></td>
                            <td>${baoxiao.bxremark}</td>
                            <td>${baoxiao.result}</td>
                            <td>
                                <c:if test="${baoxiao.bxstatus==0}"><span style="color: red">驳回</span></c:if>
                                <c:if test="${baoxiao.bxstatus==1}">待审批</c:if>
                                <c:if test="${baoxiao.bxstatus==2}">待付款</c:if>
                                <c:if test="${baoxiao.bxstatus==3}">已付款</c:if>
                            </td>
                            <td>
                                <a href="/baoxiao/info?bxid=${baoxiao.bxid}&pageNum=${page.pageNum}">查看</a>
                                <c:if test="${baoxiao.bxstatus==0||baoxiao.bxstatus==1}">
                                    <a href="/baoxiao/toupdate?bxid=${baoxiao.bxid}&pageNum=${page.pageNum}">编辑</a>
                                </c:if>
                                <c:if test="${baoxiao.bxstatus!=3}">
                                    <a href="javascript:void(0)" data-bxid="${baoxiao.bxid}" class="btndel">撤销</a>
                                </c:if>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>

            <div class="row">

                <div class="col-sm-12 text-right">
                    <div class="btn-group">

                        <a href="/baoxiao/list?pageNum=${page.pageNum-1}&type=${type}&keyword=${keyword}"
                           class="btn btn-sm btn-white <c:if test="${page.pageNum-1<1}">disabled</c:if>"><i
                                class="glyphicon glyphicon-chevron-left"></i>
                        </a>

                        <c:forEach begin="1" end="${page.pages}" varStatus="i">
                            <a href="/baoxiao/list?pageNum=${i.index}&type=${type}&keyword=${keyword}"
                               class="btn btn-sm btn-white <c:if test="${page.pageNum==i.index}">active</c:if>">${i.index}</a>
                        </c:forEach>

                        <a href="/baoxiao/list?pageNum=${page.pageNum+1}&type=${type}&keyword=${keyword}"
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

        //点击删除
        $('.btndel').click(function () {
            var bxid = $(this).data("bxid");
            swal({
                title: "您确定要撤销这条申请吗",
                text: "删除后将无法恢复，请谨慎操作！",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "yes",
                closeOnConfirm: false
            }, function () {//此函数是点击删除执行的函数
                //这里写ajax代码
                $.post("/baoxiao/revocation", "bxid=" + bxid, function (result) {
                    if (result == 'true') {
                        swal({
                            title: "撤销成功！",
                            type: "success"
                        }, function () {
                            location.href = "/baoxiao/list";
                        });
                    } else if (result == 'false') {
                        swal("撤销失败！", "", "error");
                    }
                }, "text");
            });
        });


    });
</script>

</body>


</html>
