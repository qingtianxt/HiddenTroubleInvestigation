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
<!--[if IE 6]>
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>用户查看</title>
</head>
<body>
	<div class="cl pd-20" style="background-color: #5bacb6">
		<img class="avatar size-XL l"
			src="${pageContext.request.contextPath}/${model.headPortrait}">
		<dl style="margin-left: 80px; color: #fff">
			<dt>
				<span class="f-18">${model.trueName }</span> <span
					class="pl-10 f-12">角色： <c:if test="${user.role==0 }">
						<td>无权限</td>
					</c:if>
					<c:if test="${model.role==1 }">
						用户
					</c:if> <c:if test="${model.role==2 }">
						排查人员
					</c:if> <c:if test="${model.role==3 }">
						整改人员
					</c:if>

				</span>
			</dt>
			<dd class="pt-10 f-12" style="margin-left: 0">这家伙很懒，什么也没有留下</dd>
		</dl>
	</div>
	<div class="pd-20">
		<table class="table">
			<tbody>
				<tr>
					<th class="text-r" width="80">密码：</th>
					<td>${model.password }</td>
				</tr>
				<tr>
					<th class="text-r">手机：</th>
					<td>${model.telephone }</td>
				</tr>
				<tr>
					<th class="text-r">注册时间：</th>
					<td>${model.create_date }</td>
				</tr>
			</tbody>
		</table>
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
	<!--/_footer 作为公共模版分离出去-->

	<!--请在下方写此页面业务相关的脚本-->
</body>
</html>