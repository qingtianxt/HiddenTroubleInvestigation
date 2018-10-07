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
<title>等级管理</title>
</head>
<body>
	<form
		action="${pageContext.request.contextPath}/grade_findByPage.action"
		method="post">
		<nav class="breadcrumb">
			<i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span>
			等级管理 <span class="c-gray en">&gt;</span> 等级列表 <a
				class="btn btn-success radius r"
				style="line-height: 1.6em; margin-top: 3px"
				href="javascript:location.replace(location.href);" title="刷新"><i
				class="Hui-iconfont">&#xe68f;</i></a>
		</nav>
		<div class="page-container">
			<div class="cl pd-5 bg-1 bk-gray mt-20">
				<span class="l"> <a href="javascript:;"
					onclick="grade_add('添加等级','${pageContext.request.contextPath}/grade/grade-add.jsp','500','300')"
					class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i>
						添加等级</a></span> <span class="r">共有数据：<strong>${page.totalCount }</strong>
					条
				</span>
			</div>
			<div class="mt-20">
				<table
					class="table table-border table-bordered table-hover table-bg table-sort">
					<thead>
						<tr class="text-c">
							<th width="140">ID</th>
							<th width="160">等级名称</th>
							<th width="">创建日期</th>
							<th width="170">操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${page.beanList }" var="grade">
							<tr class="text-c">
								<td>${grade.grade_id }</td>
								<td>${grade.info}</td>
								<td>${grade.create_date }</td>
								<td class="td-manage"><a title="编辑" href="javascript:;"
									onclick="grade_edit('编辑','','510',${grade.grade_id})"
									class="ml-5" style="text-decoration: none"><i
										class="Hui-iconfont">&#xe6df;</i></a> <a title="删除"
									href="javascript:;" onclick="grade_del(this,${grade.grade_id})"
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
			layer.msg('添加成功!',{icon:1});
		</script>
		</c:if>
		<c:if test="${msg==2 }">
			<script type="text/javascript">
			layer.msg('修改成功!',{icon:1});
		</script>
		</c:if>
		<c:if test="${msg==3 }">
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
				               window.location.href="${pageContext.request.contextPath}/grade_findByPage.action?pageCode="+obj.curr+"&pageSize="+obj.limit;//跳转链接
			               } 
			        	   first = false;
			           }
			       });
			   });
	  
	   /*用户-添加*/
	   function grade_add(title,url,w,h){
	   	layer_show(title,url,w,h);
	   }
	   /*等级-编辑*/
	   function grade_edit(title,w,h,id){
		   url="${pageContext.request.contextPath}/grade_initUpdate.action?grade_id="+id;
	   		layer_show(title,url,w,h);
	   }
	   /*密码-修改*/
	   function change_password(title,w,h,id){
		   url="${pageContext.request.contextPath}/user_initchangeWord.action?user_id="+id;
	   	layer_show(title,url,w,h);	
	   }
	   /*用户-删除*/
	   function grade_del(obj,id){
		   url="${pageContext.request.contextPath}/grade_delete.action?grade_id="+id;
	   	layer.confirm('确认要删除吗？',function(index){
	   		window.location.href=url;
	   	});
	   }
	</script>
	</form>
</body>
</html>