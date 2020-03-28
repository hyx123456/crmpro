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
                    <h5>项目管理<small>>添加项目信息</small></h5>
                </div>
                <div class="ibox-content">
                    <form class="form-horizontal">
                        <div class="row">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">项目名称</label>
                                <div class="col-sm-3">
                                    <input name="name" type="text" class="form-control input-sm">
                                </div>
                                <label class="col-sm-2 col-sm-offset-1 control-label">客户公司名称</label>
                                <div class="col-sm-3">
                                    <select name="companyname" id="customer" class="selectpicker form-control">
                                        <option value="0">---选择客户公司名称---</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">客户方负责人</label>
                                <div class="col-sm-3">
                                    <input name="companyperson" readonly type="text" class="form-control input-sm">
                                </div>
                                <label class="col-sm-2 col-sm-offset-1 control-label">项目经理</label>
                                <div class="col-sm-3">
                                    <select name="empFk" id="employee" class="selectpicker form-control">
                                        <option value="0">-----选择项目经理-----</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">开发人数</label>
                                <div class="col-sm-3">
                                    <input name="empcount" type="text" class="form-control input-sm">
                                </div>
                                <label class="col-sm-2 col-sm-offset-1 control-label">开始时间</label>
                                <div class="col-sm-3">
                                    <!--时间控件的id都不能改-->
                                    <input name="starttime" id="start" class="laydate-icon form-control layer-date">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">立项时间</label>
                                <div class="col-sm-3">
                                    <input name="buildtime" id="buid" class="laydate-icon form-control layer-date">
                                </div>
                                <label class="col-sm-2 col-sm-offset-1 control-label">预估成本</label>
                                <div class="col-sm-3">
                                    <input name="cost" type="text" class="form-control input-sm">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">级别</label>
                                <div class="col-sm-3">
                                    <select name="level" class="selectpicker form-control">
                                        <option value="1">高</option>
                                        <option value="2">中</option>
                                        <option value="3">低</option>
                                        <option value="4">暂缓</option>
                                    </select>
                                </div>
                                <label class="col-sm-2 col-sm-offset-1 control-label">计划完成时间</label>
                                <div class="col-sm-3">
                                    <input name="endtime" id="finish" class="laydate-icon form-control layer-date">
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
                                <div class="col-sm-3">
                                    <a href="/forumsort/lis" class="btn btn-white"><i class="fa fa-reply"></i> 返回</a>
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
        laydate({elem: "#finish"});
        laydate({elem: "#buid"});
        laydate({elem: "#start"});

        //异步加载项目经理
        loadEmployee();

        function loadEmployee() {
            $.post("/employee/getByPfk", "pfk=4", function (result) {
                $(result).each(function () {
                    var option = "<option value='" + this.eid + "'>" + this.ename + "</option>"
                    $("#employee").append(option).selectpicker('refresh');
                });
            }, "json");
        }

        //异步加载客户公司名称
        loadCustomer();

        function loadCustomer() {
            $.post("/customer/listjson", "", function (result) {
                $(result).each(function () {
                    var option = "<option data-person='" + this.companyperson + "' value='" + this.id + "'>" + this.comname + "</option>"
                    $("#customer").append(option).selectpicker('refresh');
                });
            }, "json");
        }

        //根据选择公司名称填充公司负责人
        $("#customer").change(function () {
            $(this).children().each(function () {
                if ($(this).prop("selected")) {
                    $("input[name=companyperson]").val($(this).data("person"));
                }
            });
        });

        $(".btnAdd").click(function () {
            var data = $(".form-horizontal").serialize();
            var pageNum = $(pageNum);
            $.post("/project/add", data, function (result) {
                if (result == 'true') {
                    swal({
                        title: "添加成功！",
                        text: "添加成功，现在为您返回列表页",
                        type: "success"
                    }, function () {
                        location.href = "/project/list?pageNum=";
                    });
                } else if (result == 'false') {
                    swal("添加失败！", "请检查数据有效性", "error");
                }
            }, "text");
        });


        //--------------------下面是常用代码模版---------------------------------------

        //下拉列表使用ajax加载说明例子
        function loadSelect() {
            var option = '<option value="0">-------请选择------</option><option value="4">用友软件</option><option selected value="5">浪潮软件</option>';
            $("#company").jsp(option);
            //ajax填充数据后需调用下面的方法来刷新下拉列表
            $("#company").selectpicker('refresh');
        }

        loadSelect();

        //点击按钮，消息提示框
        $("#demo1").click(function () {
            //基本消息框－留着备用
            swal({
                title: "恭喜，添加成功",
                text: "数据添加成功，为您返回列表页！"
            })
        });

        // 选择客户公司名称时自动选对应的客户方负责人
        $("#company").change(function () {
            var thisVal = $(this).val();
            //val指value属性,选中value属性＝thisVal的选项
            $('#customer').selectpicker('val', thisVal);
        });

    });
</script>
<!-- 修复日期控件长度-->
<link href="${pageContext.request.contextPath}/css/customer.css" rel="stylesheet">
</body>


</html>
