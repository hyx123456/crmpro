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

</head>

<body class="gray-bg">
<div class="wrapper wrapper-content">
    <div class="row">

        <div class="col-sm-12 animated fadeInRight">
            <div class="mail-box-header">

                <form method="get" action="/notice/list" class="pull-right mail-search">
                    <div class="input-group">
                        <input type="text" class="form-control input-sm" name="keyword" value="${keyword}"
                               placeholder="搜索标题">
                        <div class="input-group-btn">
                            <button type="submit" class="btn btn-sm btn-primary">
                                <i class="fa fa-search"></i> 搜索
                            </button>
                        </div>
                    </div>
                </form>
                <h2>
                    公告 (16)
                </h2>
                <div class="mail-tools tooltip-demo m-t-md">

                    <button class="btn btn-white btn-sm" data-toggle="tooltip" data-placement="left" title="刷新公告列表"><i
                            class="fa fa-refresh"></i> 刷新
                    </button>
                    <button class="btn btn-white btn-sm" data-toggle="tooltip" data-placement="top" title="标为已读"><i
                            class="fa fa-eye"></i>
                    </button>
                    <button class="btn btn-white btn-sm" data-toggle="tooltip" data-placement="top" title="标为重要"><i
                            class="fa fa-exclamation"></i>
                    </button>
                    <button class="btn btn-white btn-sm" data-toggle="tooltip" data-placement="top" title="标为垃圾邮件"><i
                            class="fa fa-trash-o"></i>
                    </button>

                </div>
            </div>
            <div class="mail-box">

                <table class="table table-hover table-mail">
                    <tbody>
                    <c:forEach items="${list}" var="notice">
                        <tr class="read">
                            <td class="check-mail">
                                <input type="checkbox">
                            </td>
                            <td class="mail-ontact"><a href="/notice/getbyid?id=${notice.id}">${notice.title}</a>
                                <span class="label label-warning pull-right">验证邮件</span>
                            </td>
                            <td class="mail-subject">
                                <a href="/notice/getbyid?id=${notice.id}">${notice.description}</a>
                            </td>
                            <td class=""></td>
                            <td class="text-right mail-date">
                                <fmt:formatDate value="${notice.date}" pattern="yyyy-MM-dd HH:mm"/>
                            </td>
                        </tr>
                    </c:forEach>


                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/js/jquery.min.js?v=2.1.4"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js?v=3.3.6"></script>
<script src="${pageContext.request.contextPath}/js/content.min.js?v=1.0.0"></script>
<script src="${pageContext.request.contextPath}/js/plugins/iCheck/icheck.min.js"></script>
<script>
    $(document).ready(function () {
        $(".i-checks").iCheck({checkboxClass: "icheckbox_square-green", radioClass: "iradio_square-green",})
    });
</script>
<script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
</body>


<!-- Mirrored from www.gzsxt.cn/theme/hplus/mailbox.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 20 Jan 2016 14:18:22 GMT -->
</html>
