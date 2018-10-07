<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/html5shiv.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/h-ui.admin/skin/default/skin.css"
	id="skin" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/h-ui.admin/css/style.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/lib/layui/css/layui.css">
<!--[if IE 6]>
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>用户管理</title>
</head>
<body>
	<form
		action="${pageContext.request.contextPath}/standardInvestigation_findByPage.action"
		method="post">
		<nav class="breadcrumb">
			<i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span>
			标准列表 <span class="c-gray en">&gt;</span> 标准管理 <a
				class="btn btn-success radius r"
				style="line-height: 1.6em; margin-top: 3px"
				href="javascript:location.replace(location.href);" title="刷新"><i
				class="Hui-iconfont">&#xe68f;</i></a>
		</nav>
		<div class="page-container">
			<div class="text-c">
				排查人： <span class="select-box inline"><select name="trueName"
					id="checkUp" class="select">
						<option value="">请选择</option>
				</select></span> 整改人： <span class="select-box inline"> <select
					name="repairName" id="repair" class="select">
						<option value="">请选择</option>
				</select></span> 隐患等级： <span class="select-box inline"> <select
					name="gradeId" id="hiddenGrade" class="select">
						<option value="">请选择</option>
				</select></span>
				<button type="submit" class="btn btn-success radius" id="" name="">
					<i class="Hui-iconfont">&#xe665;</i> 搜隐患
				</button>
			</div>
			<div class="cl pd-5 bg-1 bk-gray mt-20">
				<span class="l"><a href="javascript:;"
					onclick="StandardInvestigation_add('添加隐患','${pageContext.request.contextPath}/HiddenDanger/HiddenDanger-add.jsp','','510')"
					class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i>
						添加隐患</a></span> <span class="r">共有数据：<strong>${page.totalCount }</strong>
					条
				</span>
			</div>
			<div class="mt-20">
				<table
					class="table table-border table-bordered table-hover table-bg table-sort">
					<thead>
						<tr class="text-c">
							<th width="70">ID</th>
							<th width="80">排查人</th>
							<th width="80">整改人</th>
							<th width="300">基本信息</th>
							<th>详细内容</th>
							<th width="170">操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${page.beanList }" var="hiddenDanger">
							<tr class="text-c">
								<td>${hiddenDanger.standardInvestigation_id }</td>
								<td>${hiddenDanger.user.trueName}</td>
								<td>${hiddenDanger.repair.trueName}</td>
								<td class="text-l"><div class="c-999 f-12">
										主题：${hiddenDanger.content } <span class="ml-20"><time>添加日期：${hiddenDanger.create_date }</time></span>

									</div>
									<div class="c-999 f-12">
										隐患等级：${hiddenDanger.grade.info }<span class="ml-20">区域：${hiddenDanger.place.place_name }</span>
									</div></td>
								<td>${hiddenDanger.info }</td>
								<td class="td-manage"><a title="编辑" href="javascript:;"
									onclick="StandardInvestigation_edit('编辑','','510',${hiddenDanger.standardInvestigation_id})"
									class="ml-5" style="text-decoration: none"><i
										class="Hui-iconfont">&#xe6df;</i></a> <a title="删除"
									href="javascript:;"
									onclick="StandardInvestigation_del(this,${hiddenDanger.standardInvestigation_id})"
									class="ml-5" style="text-decoration: none"><i
										class="Hui-iconfont">&#xe6e2;</i></a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div id="page" style="text-align: center"></div>
			</div>
		</div>
		<!--_footer 作为公共模版分离出去-->
		<script type="text/javascript"
			src="${pageContext.request.contextPath}/lib/jquery/1.9.1/jquery.min.js"></script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath}/lib/layer/2.4/layer.js"></script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath}/static/h-ui/js/H-ui.min.js"></script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath}/static/h-ui.admin/js/H-ui.admin.js"></script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath}/lib/layui/layui.js"></script>
		<script type="text/javascript"
			src="lib/My97DatePicker/4.8/WdatePicker.js"></script>
		<!--/_footer 作为公共模版分离出去-->

		<!--请在下方写此页面业务相关的脚本-->
		<c:if test="${msg==1 }">
			<script type="text/javascript">
			layer.msg('修改成功!',{icon:1});
		</script>
		</c:if>
		<c:if test="${msg==2 }">
			<script type="text/javascript">
			layer.msg('删除成功!',{icon:1});
		</script>
		</c:if>
		<script>
			 layui.define(['layer', 'laypage' ], function(exports) {
			       var layer = layui.layer;
			       var laypage = layui.laypage;
			       console.log(typeof laypage)
			       var pcount = ${page.totalCount};// 总记录数
			       var psize = ${page.pageCode};// 每一页的记录数
			       var first = true;
			       // 分页
			       laypage.render({
			           elem : 'page', // 页面上的id
			           pages : ${page.totalPage},//总页数
			           curr : ${page.pageCode},//当前页
			           skin: '#999999',//颜色
			           count: ${page.totalCount},
			           layout:['count', 'prev', 'page', 'next', 'limit', 'skip'],
			           limit:${page.pageSize},
			           limits:[5,10,20],
			           jump : function(obj) {
			        	   console.log(obj)
			               if (!first) {
				               window.location.href="${pageContext.request.contextPath}/standardInvestigation_findByPage.action?pageCode="+obj.curr+"&pageSize="+obj.limit;//跳转链接
			               } 
			        	   first = false;
			           }
			       });
			   });
	  
	   /*标准-添加*/
	   function StandardInvestigation_add(title,url,w,h){
	   	layer_show(title,url,w,h);
	   }
	   /*用户-查看*/
	   function member_show(title,url,id,w,h){
		   url="${pageContext.request.contextPath}/user_getInfo.action?user_id="+id;
	   	layer_show(title,url,w,h);
	   }
	   /*标准-编辑*/
	   function StandardInvestigation_edit(title,w,h,id){
		   url="${pageContext.request.contextPath}/standardInvestigation_initUpdate.action?standardInvestigation_id="+id;
	   		layer_show(title,url,w,h);
	   }
	   /*标准-删除*/
	   function StandardInvestigation_del(obj,id){
		   url="${pageContext.request.contextPath}/standardInvestigation_delete.action?standardInvestigation_id="+id;
	   	layer.confirm('确认要删除吗？',function(index){
	   		window.location.href=url;
	   	});
	   }
	</script>

		<script type="text/javascript">
	$(document)
	.ready(
			function() {

				$
						.post(
								"${pageContext.request.contextPath}/grade_getGrade.action",
								{},
								function(data) {
									if (data != null
											&& data.length > 0) {
										var content = "";
										for ( var type in data) {
												if (data[type].grade_id == ${gradeId}) {
													content += "<option value='"+data[type].grade_id+"' selected='selected'>"
															+ data[type].info
															+ "</option>";
												} else {
													content += "<option value='"+data[type].grade_id+"'>"
															+ data[type].info
															+ "</option>";
												}
											}
										
											
										}
										content += "</select></span>";
										$("#hiddenGrade").append(
												content);

								}, "json");

				$
						.post(
								"${pageContext.request.contextPath}/user_getCheckUp.action",
								{},
								function(data) {
									if (data != null
											&& data.length > 0) {
										var content = "";
										for ( var type in data) {
											 if(data[type].user_id==${trueName}){
												content += "<option value='"+data[type].user_id+"' selected='selected'>"
												+ data[type].trueName
												+ "</option>";
											}else{ 
												content += "<option value='"+data[type].user_id+"'>"
												+ data[type].trueName
												+ "</option>";
											//}
											
										}
										content += "</select></span>";
										$("#checkUp").append(
												content);
									}
								}
								}, "json");
				$
						.post(
								"${pageContext.request.contextPath}/user_getRepair.action",
								{},
								function(data) {
									if (data != null
											&& data.length > 0) {
										var content = "";
										for ( var type in data) {
											if(data[type].user_id==${repairName}){
												content += "<option value='"+data[type].user_id+"' selected='selected'>"
												+ data[type].trueName
												+ "</option>";
											}else{
												content += "<option value='"+data[type].user_id+"'>"
												+ data[type].trueName
												+ "</option>";
											}
											
										}
										content += "</select></span>";
										$("#repair")
												.append(content);
									}

								}, "json");
				
			});
	</script>
	</form>
</body>
</html>