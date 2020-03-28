<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>


<!-- Mirrored from www.gzsxt.cn/theme/hplus/mailbox.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 20 Jan 2016 14:18:21 GMT -->
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>项目管理系统 - 收件箱</title>
    <meta name="keywords" content="项目管理系统">
    <meta name="description" content="项目管理系统">

    <link rel="shortcut icon" href="favicon.ico">
    <link href="${pageContext.request.contextPath}/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/animate.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style.min862f.css?v=4.1.0" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
</head>

<body class="gray-bg">
<div class="wrapper wrapper-content">
    <div class="row">
        <div class="col-sm-3">
            <div class="ibox float-e-margins">
                <div class="ibox-content mailbox-content">
                    <div class="file-manager">
                        <a class="btn btn-block btn-primary compose-mail" href="/save-message.jsp"><i
                                class="fa fa-paper-plane"></i>&nbsp;&nbsp;写信</a>
                        <div class="space-25"></div>
                        <h5>文件夹</h5>
                        <ul class="folder-list m-b-md" style="padding: 0">
                            <li>
                                <a href="/msg/list"> <i class="fa fa-inbox "></i> 收件箱 <span
                                        class="label label-warning pull-right">16</span>
                                </a>
                            </li>
                            <li>
                                <a href="/msg/list?who=1"> <i class="fa fa-envelope-o"></i>发件箱</a>
                            </li>
                            <li>
                                <a href="/msg/list?status=3"> <i class="fa fa-certificate"></i> 重要</a>
                            </li>
                            <li>
                                <a href="/msg/list?status=2"> <i class="fa fa-file-text-o"></i> 草稿 <span
                                        class="label label-danger pull-right">2</span>
                                </a>
                            </li>
                            <li>
                                <a href="/msg/list?status=4"> <i class="fa fa-trash-o"></i> 垃圾箱</a>
                            </li>
                        </ul>
                        <h5>分类</h5>
                        <ul class="category-list" style="padding: 0">
                            <li>
                                <a href="/msg/list?type=1"> <i class="fa fa-circle text-navy"></i> 工作</a>
                            </li>
                            <li>
                                <a href="/msg/list?type=2"> <i class="fa fa-circle text-danger"></i> 文档</a>
                            </li>
                            <li>
                                <a href="/msg/list?type=3"> <i class="fa fa-circle text-primary"></i> 社交</a>
                            </li>
                            <li>
                                <a href="/msg/list?type=4"> <i class="fa fa-circle text-info"></i> 广告</a>
                            </li>
                            <li>
                                <a href="mail_compose.jsp#"> <i class="fa fa-circle text-warning"></i> 客户端</a>
                            </li>
                        </ul>


                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-9 animated fadeInRight">
            <div class="mail-box-header">

                <form method="get" action="/msg/list" class="pull-right mail-search">
                    <input type="hidden" name="status" value="${status}">
                    <input type="hidden" name="type" value="${type}">
                    <div class="input-group">
                        <input type="text" class="form-control input-sm" name="title" value="${title}"
                               placeholder="搜索标题">
                        <div class="input-group-btn">
                            <button type="submit" class="btn btn-sm btn-primary">
                                <i class="fa fa-search"></i> 搜索
                            </button>
                        </div>
                    </div>
                </form>
                <h2>
                    <c:if test="${who==1}">发件箱</c:if>
                    <c:if test="${who!=1}">收件箱 (16)</c:if>

                </h2>
                <div class="mail-tools tooltip-demo m-t-md">
                    <div class="btn-group pull-right">
                        <a href="/msg/list?pageNum=${page.pageNum-1}&type=${type}&status=${status}"
                           class="btn btn-sm btn-white <c:if test="${page.pageNum-1<1}">disabled</c:if>">
                            <i class="fa fa-arrow-left"></i>
                        </a>

                        <a href="/msg/list?pageNum=${page.pageNum+1}&type=${type}&status=${status}"
                           class="btn btn-white btn-sm <c:if test="${page.pageNum+1>page.pages}">disabled</c:if>">
                            <i class="fa fa-arrow-right"></i>
                        </a>

                    </div>
                    <a href="/msg/list?pageNum=${page.pageNum}&type=${type}&status=${status}<c:if test="${who==1}">&who=1</c:if>"
                       class="btn btn-white btn-sm" data-toggle="tooltip" data-placement="left" title="刷新邮件列表">
                        <i class="fa fa-refresh"></i> 刷新
                    </a>
                    <c:if test="${empty who}">
                        <button id="read" class="btn btn-white btn-sm" data-toggle="tooltip" data-placement="top"
                                title="标为已读">
                            <i class="fa fa-eye"></i>
                        </button>
                    </c:if>
                    <button id="importance" class="btn btn-white btn-sm" data-toggle="tooltip" data-placement="top"
                            title="标为重要"><i
                            class="fa fa-exclamation"></i>
                    </button>
                    <button id="rubbish" class="btn btn-white btn-sm" data-toggle="tooltip" data-placement="top"
                            title="标为垃圾邮件"><i
                            class="fa fa-trash-o"></i>
                    </button>
                </div>
            </div>
            <div class="mail-box">

                <table class="table table-hover table-mail">
                    <tbody>
                    <c:forEach items="${list}" var="msg">
                        <tr class="read">
                            <td class="check-mail">
                                <input type="checkbox" value="${msg.msgid}">
                            </td>
                            <td class="mail-ontact"><a href="/msg/getbyid?msgid=${msg.msgid}">${msg.title}</a>
                                <c:if test="${msg.status==0}">
                                    <span class="label label-warning pull-right">未读</span>
                                </c:if>
                                <c:if test="${msg.status==1}">
                                    <span class="label label-warning pull-right">已读</span>
                                </c:if>
                            </td>
                            <td class="mail-subject">
                                <a href="/msg/getbyid?msgid=${msg.msgid}">${msg.content}</a>
                            </td>
                            <td class=""></td>
                            <td class="text-right mail-date">
                                <fmt:formatDate value="${msg.time}" pattern="yyyy-MM-dd HH:mm"/>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>

        </div>
    </div>
    <script src="${pageContext.request.contextPath}/js/jquery.min.js?v=2.1.4"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js?v=3.3.6"></script>
    <script src="${pageContext.request.contextPath}/js/content.min.js?v=1.0.0"></script>
    <script src="${pageContext.request.contextPath}/js/plugins/iCheck/icheck.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/plugins/sweetalert/sweetalert.min.js"></script>
    <script>
        $(document).ready(function () {
            $(".i-checks").iCheck({checkboxClass: "icheckbox_square-green", radioClass: "iradio_square-green",});

            //标记为已读
            $("#read").click(function () {
                var msgids = "";
                $("input:checked").each(function () {
                    msgids += "," + $(this).val();
                    updateStatus(msgids, 1, "已读");
                });

            });

            //标记为重要
            $("#importance").click(function () {
                var msgids = "";
                $("input:checked").each(function () {
                    msgids += "," + $(this).val();
                    updateStatus(msgids, 3, "重要");
                });

            });

            //标记为垃圾邮件
            $("#rubbish").click(function () {
                var msgids = "";
                $("input:checked").each(function () {
                    msgids += "," + $(this).val();
                    updateStatus(msgids, 4, "垃圾邮件");
                });

            });

            function updateStatus(msgids, status, message) {
                swal({
                    title: "是否标记为" + message + "?",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonColor: "#DD6B55",
                    confirmButtonText: "yes",
                    closeOnConfirm: false
                }, function () {
                    $.post("/msg/updatestatus", "msgids=" + msgids + "&status=" + status, function (result) {
                        if (result == "true") {
                            swal("成功！", "您选择的邮件已标记为" + message, "success");
                        } else if (result == "false") {
                            swal("失败！", "您选择的邮件未标记成功", "error");
                        }
                    }, "text");
                });
            }
        });
    </script>
    <script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
</body>


<!-- Mirrored from www.gzsxt.cn/theme/hplus/mailbox.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 20 Jan 2016 14:18:22 GMT -->
</html>
