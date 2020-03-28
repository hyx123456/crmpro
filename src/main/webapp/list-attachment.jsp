<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>


<!-- Mirrored from www.gzsxt.cn/theme/hplus/file_manager.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 20 Jan 2016 14:19:44 GMT -->
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>项目管理系统 - 文件管理器</title>
    <meta name="keywords" content="项目管理系统">
    <meta name="description" content="项目管理系统">

    <link rel="shortcut icon" href="favicon.ico">
    <link href="${pageContext.request.contextPath}/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/animate.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style.min862f.css?v=4.1.0" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/customer.css" rel="stylesheet">
</head>

<body class="gray-bg">
<div class="wrapper wrapper-content">
    <div class="row">
        <div class="col-sm-3">
            <div class="ibox float-e-margins">
                <div class="ibox-content">
                    <div class="file-manager">

                        <h5>显示：</h5>
                        <a href="/attachment/list?fileName=${fileName}&tag=${tag}" class="file-control active">所有</a>
                        <a href="/attachment/list?type=1&fileName=${fileName}&tag=${tag}" class="file-control">图片</a>
                        <a href="/attachment/list?type=2&fileName=${fileName}&tag=${tag}" class="file-control">文档</a>
                        <a href="/attachment/list?type=3&fileName=${fileName}&tag=${tag}" class="file-control">视频</a>
                        <div class="hr-line-dashed"></div>
                        <a href="/save-attchment.jsp" class="btn btn-primary btn-block"><i
                                class="fa fa-cloud-upload"></i> 上传文件</a>
                        <div class="hr-line-dashed"></div>

                        <form action="/attachment/list" method="post">
                            <input type="hidden" name="type" value="${type}">
                            <input type="hidden" name="tag" value="${tag}">
                            <div class="input-group">
                                <input type="text" name="fileName" value="${fileName}" class="form-control">
                                <span class="input-group-btn">
                                	 <button type="submit" class="btn btn-primary"><i class="fa fa-search"></i></button>
                                </span>
                            </div>
                        </form>

                        <h5>文件夹</h5>
                        <ul class="folder-list" style="padding: 0">
                            <li><a href="/attachment/list?type=1&fileName=${fileName}&tag=${tag}"><i
                                    class="fa fa-folder"></i> 图片</a>
                            </li>
                            <li><a href="/attachment/list?type=2&fileName=${fileName}&tag=${tag}"><i
                                    class="fa fa-folder"></i> 文档</a>
                            </li>
                            <li><a href="/attachment/list?type=3&fileName=${fileName}&tag=${tag}"><i
                                    class="fa fa-folder"></i> 视频</a>
                            </li>
                            <li><a href="/attachment/list?type=4&fileName=${fileName}&tag=${tag}"><i
                                    class="fa fa-folder"></i> 种子</a>
                            </li>
                            <li><a href="/attachment/list?type=5&fileName=${fileName}&tag=${tag}"><i
                                    class="fa fa-folder"></i> 音乐</a>
                            </li>
                            <li><a href="/attachment/list?type=6&fileName=${fileName}&tag=${tag}"><i
                                    class="fa fa-folder"></i> 其它</a>
                            </li>
                        </ul>
                        <h5 class="tag-title">标签</h5>
                        <ul class="tag-list" style="padding: 0">
                            <li><a href="/attachment/list?tag=1&type=${type}&fileName=${fileName}">需求分析</a>
                            </li>
                            <li><a href="/attachment/list?tag=2&type=${type}&fileName=${fileName}">用例图</a>
                            </li>
                            <li><a href="/attachment/list?tag=3&type=${type}&fileName=${fileName}">数据库</a>
                            </li>
                            <li><a href="/attachment/list?tag=4&type=${type}&fileName=${fileName}">UI原型</a>
                            </li>
                            <li><a href="/attachment/list?tag=5&type=${type}&fileName=${fileName}">任务概况</a>
                            </li>
                            <li><a href="/attachment/list?tag=6&type=${type}&fileName=${fileName}">其它资料</a>
                            </li>
                        </ul>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-9 animated fadeInRight">
            <div class="row">
                <div class="col-sm-12">

                    <c:forEach items="${list}" var="attachment">
                        <div class="file-box">
                            <div class="file">
                                <a href="/attachment/info?id=${attachment.id}">
                                    <span class="corner"></span>
                                    <div class="icon">

                                        <c:if test="${attachment.type==1}"><i class="fa fa-file-image-o"></i></c:if>
                                        <c:if test="${attachment.type==2}"><i class="fa fa-file"></i></c:if>
                                        <c:if test="${attachment.type==3}"><i class="fa fa-film"></i></c:if>
                                        <c:if test="${attachment.type==4}"><i class="fa fa-magnet"></i></c:if>
                                        <c:if test="${attachment.type==5}"><i class="fa fa-music"></i></c:if>
                                        <c:if test="${attachment.type==6}"><i class="fa fa-cubes"></i></c:if>


                                    </div>
                                    <div class="file-name">
                                            ${attachment.attname}
                                        <br/>
                                        <small>项目： ${attachment.project.name}</small>
                                    </div>
                                </a>
                            </div>

                        </div>
                    </c:forEach>

                </div>

                <!--分页-->
                <div class="row">
                    <div class="col-sm-10 text-right">
                        <div class="btn-group">

                            <a href="/attachment/list?pageNum=${page.pageNum-1}&type=${type}&fileName=${fileName}&tag=${tag}"
                               class="btn btn-sm btn-white <c:if test="${page.pageNum-1<1}">disabled</c:if>"><i
                                    class="glyphicon glyphicon-chevron-left"></i>
                            </a>

                            <c:forEach begin="1" end="${page.pages}" varStatus="i">
                                <a href="/attachment/list?pageNum=${i.index}&type=${type}&fileName=${fileName}&tag=${tag}"
                                   class="btn btn-sm btn-white <c:if test="${page.pageNum==i.index}">active</c:if>">${i.index}</a>
                            </c:forEach>

                            <a href="/attachment/list?pageNum=${page.pageNum+1}&type=${type}&fileName=${fileName}&tag=${tag}"
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
    <script src="${pageContext.request.contextPath}/js/content.min.js?v=1.0.0"></script>
    <script>$(document).ready(function () {
        $(".file-box").each(function () {
            animationHover(this, "pulse")
        })
    });</script>
    <script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
</body>


</html>
