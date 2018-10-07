<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script type="text/javascript" src="${pageContext.request.contextPath }/lib/html5shiv.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/lib/respond.min.js"></script>
<![endif]-->
<link
	href="${pageContext.request.contextPath }/static/h-ui/css/H-ui.min.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath }/static/h-ui.admin/css/H-ui.login.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath }/static/h-ui.admin/css/style.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath }/lib/Hui-iconfont/1.0.8/iconfont.css"
	rel="stylesheet" type="text/css" />
<!--[if IE 6]>
<script type="text/javascript" src="${pageContext.request.contextPath }/lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>后台登录</title>
</head>
<body>
	<div align="center">校园安全隐患排查系统--后台</div>
	<div class="loginWraper">
		<div id="loginform" class="loginBox">
			<form class="form form-horizontal" id="form-memeber-login"
				action="${pageContext.request.contextPath }/user_login.action"
				method="post">
				<div class="row cl">
					<label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe60d;</i></label>
					<div class="formControls col-xs-8">
						<input id="" name="telephone" type="text" placeholder="手机号"
							class="input-text size-L">
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe60e;</i></label>
					<div class="formControls col-xs-8">
						<input id="" name="password" type="password" placeholder="密码"
							class="input-text size-L">
					</div>
				</div>
				<div class="row cl">
					<div class="formControls col-xs-8 col-xs-offset-3">
						<input type="submit" class="btn btn-success radius size-L"
							value="&nbsp;登&nbsp;&nbsp;&nbsp;&nbsp;录&nbsp;"> <input
							type="reset" class="btn btn-default radius size-L"
							value="&nbsp;取&nbsp;&nbsp;&nbsp;&nbsp;消&nbsp;">
					</div>
				</div>
			</form>
		</div>
	</div>
	<div class="footer">校园隐患排查系统</div>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/lib/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/lib/layer/2.4/layer.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/static/h-ui/js/H-ui.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/lib/jquery.validation/1.14.0/jquery.validate.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/lib/jquery.validation/1.14.0/validate-methods.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/lib/jquery.validation/1.14.0/messages_zh.js"></script>
	<c:if test="${msg==1 }">
		<script type="text/javascript">
			layer.msg('用户名或密码不正确!', {
				icon : 2
			});
		</script>
	</c:if>
	<c:if test="${msg==2 }">
		<script type="text/javascript">
			layer.msg('您不是管理员，只有管理员可以登录!', {
				icon : 2
			});
		</script>
	</c:if>
	<script type="text/javascript">
		$(function() {

			$("#form-memeber-login").validate({
				rules : {
					password : {
						required : true,
						minlength : 6,
						maxlength : 15
					},
					telephone : {
						required : true,
						isMobile : true,
					},
				},
				onkeyup : false,
				focusCleanup : true,
				success : "valid",
			});
		});
	</script>
</body>
</html>