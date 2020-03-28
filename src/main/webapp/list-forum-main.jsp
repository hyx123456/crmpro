<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>


<!-- Mirrored from www.gzsxt.cn/theme/hplus/forum_main.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 20 Jan 2016 14:19:47 GMT -->
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>项目管理系统 - 论坛</title>
    <meta name="keywords" content="项目管理系统">
    <meta name="description" content="项目管理系统">

    <link rel="shortcut icon" href="favicon.ico">
    <link href="${pageContext.request.contextPath}/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/animate.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style.min862f.css?v=4.1.0" rel="stylesheet">

</head>

<body class="gray-bg">
<div class="row">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-12">
                <div class="wrapper wrapper-content animated fadeInRight">

                    <div class="ibox-content m-b-sm border-bottom">
                        <div class="p-xs">
                            <div class="pull-left m-r-md">
                                <i class="fa fa-globe text-navy mid-icon"></i>
                            </div>
                            <h2>欢迎来到H+论坛</h2>
                            <span>你可以自由选择你感兴趣的话题。</span>
                        </div>
                    </div>

                    <div class="ibox-content forum-container">

                        <div class="forum-title">
                            <div class="pull-right forum-desc">
                                <samll id="primary">总帖子数： 0</samll>
                            </div>
                            <h3>主版</h3>
                        </div>


                        <c:forEach items="${list}" var="forumsort" varStatus="index">
                            <c:if test="${forumsort.type==0}">

                                <div class="forum-item <c:if test="${index.index%2==0}">active</c:if>">
                                    <div class="row">
                                        <div class="col-sm-9">
                                            <div class="forum-icon">
                                                <c:if test="${index.index==0}"><i class="fa fa-shield"></i></c:if>
                                                <c:if test="${index.index==1}"><i class="fa fa-bolt"></i></c:if>
                                                <c:if test="${index.index==2}"><i class="fa fa-calendar"></i></c:if>
                                                <c:if test="${index.index==3}"><i class="fa fa-star"></i></c:if>
                                            </div>
                                            <a href="/forumpost/list?view=1&forumsort_fk=${forumsort.id}"
                                               class="forum-item-title">${forumsort.title}</a>
                                            <div class="forum-sub-title">${forumsort.description}</div>
                                        </div>
                                        <div class="col-sm-1 forum-info">
                                        <span class="views-number ">
                                                ${forumsort.click}
                                        </span>
                                            <div>
                                                <small>浏览</small>
                                            </div>
                                        </div>
                                        <div class="col-sm-1 forum-info">
                                        <span class="views-number">
                                            368
                                        </span>
                                            <div>
                                                <small>话题</small>
                                            </div>
                                        </div>
                                        <div class="col-sm-1 forum-info">
                                        <span class="views-number primaryVN">
                                                ${forumsort.count}
                                        </span>
                                            <div>
                                                <small>帖子</small>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:if>

                        </c:forEach>

                        <div class="forum-title">
                            <div class="pull-right forum-desc">
                                <samll id="vice">总贴子数：0</samll>
                            </div>
                            <h3>副版</h3>
                        </div>

                        <c:forEach items="${list}" var="forumsort" varStatus="index">
                            <c:if test="${forumsort.type==1}">
                                <div class="forum-item">
                                    <div class="row">
                                        <div class="col-sm-9">
                                            <div class="forum-icon">
                                                <c:if test="${index.index==4}"><i class="fa fa-clock-o"></i></c:if>
                                                <c:if test="${index.index==5}"><i class="fa fa-bomb"></i></c:if>
                                                <c:if test="${index.index==6}"><i class="fa fa-bookmark"></i></c:if>
                                            </div>
                                            <a href="/forumpost/list?view=1&forumsort_fk=${forumsort.id}"
                                               class="forum-item-title">
                                                    ${forumsort.title} </a>
                                            <div class="forum-sub-title">${forumsort.description}
                                            </div>
                                        </div>
                                        <div class="col-sm-1 forum-info">
                                        <span class="views-number">
                                                ${forumsort.click}
                                        </span>
                                            <div>
                                                <small>浏览</small>
                                            </div>
                                        </div>
                                        <div class="col-sm-1 forum-info">
                                        <span class="views-number">
                                            238
                                        </span>
                                            <div>
                                                <small>话题</small>
                                            </div>
                                        </div>
                                        <div class="col-sm-1 forum-info">
                                        <span class="views-number viceVN">
                                                ${forumsort.count}
                                        </span>
                                            <div>
                                                <small>帖子</small>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:if>

                        </c:forEach>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/js/jquery.min.js?v=2.1.4"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js?v=3.3.6"></script>
<script src="${pageContext.request.contextPath}/js/plugins/peity/jquery.peity.min.js"></script>
<script src="${pageContext.request.contextPath}/js/content.min.js?v=1.0.0"></script>
<script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
</body>

<script type="text/javascript">
    $(document).ready(function () {

        loadCount();

        function loadCount() {
            var countPrimary = 0;//主板块帖子数量
            var countVice = 0;//副板块帖子数量
            $(".primaryVN").each(function () {
                countPrimary += parseInt($(this).text());
            });
            $("#primary").html("总帖子数： " + countPrimary);
            $(".viceVN").each(function () {
                countVice += parseInt($(this).text());
            });
            $("#vice").html("总帖子数： " + countVice);
        }

    });
</script>

</html>
