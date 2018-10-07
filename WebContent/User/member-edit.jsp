<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--_meta 作为公共模版分离出去-->
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="Bookmark"
	href="${pageContext.request.contextPath }/favicon.ico">
<link rel="Shortcut Icon"
	href="${pageContext.request.contextPath }/favicon.ico" />
<!--[if lt IE 9]>
<script type="text/javascript" src="${pageContext.request.contextPath }/lib/html5shiv.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/lib/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/static/h-ui.admin/skin/default/skin.css"
	id="skin" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/static/h-ui.admin/css/style.css" />
<!--[if IE 6]>
<script type="text/javascript" src="${pageContext.request.contextPath }/lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<!--/meta 作为公共模版分离出去-->

<title>添加用户</title>
</head>
<body>
	<article class="page-container">
		<form
			action="${pageContext.request.contextPath }/user_update.action?user_id=${model.user_id }"
			method="post" class="form form-horizontal" id="form-member-add"
			enctype="multipart/form-data" target="_parent">
			<input type="hidden" name="password" value="${model.password }">
			<input type="hidden" name="create_date" value="${model.create_date }">
			<input type="hidden" name="oldPic" value="${model.headPortrait }" />
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span
					class="c-red">*</span>真实姓名：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text" class="input-text" value="${model.trueName }"
						placeholder="" id="trueName" name="trueName">
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span
					class="c-red">*</span>手机：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text" class="input-text" value="${model.telephone }"
						placeholder="" id="telephone" name="telephone">
				</div>
			</div>

			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span
					class="c-red">*</span>角色：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<span class="select-box"> <select name="role" class="select">
							<c:if test="${model.role==1 }">
								<option value="1" selected>管理员</option>
							</c:if>
							<c:if test="${model.role!=1 }">
								<option value="1">管理员</option>
							</c:if>
							<c:if test="${model.role==2 }">
								<option value="2" selected>排查人员</option>
							</c:if>
							<c:if test="${model.role!=2 }">
								<option value="2">排查人员</option>
							</c:if>
							<c:if test="${model.role==3 }">
								<option value="3" selected>整改人员</option>
							</c:if>
							<c:if test="${model.role!=3 }">
								<option value="3">整改人员</option>
							</c:if>
					</select>
					</span>
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3">上传头像：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<span class="btn-upload form-group"> <input
						class="input-text upload-url" type="text" name="uploadfile"
						id="uploadfile" readonly nullmsg="请添加附件！" style="width: 200px">
						<a href="javascript:void();"
						class="btn btn-primary radius upload-btn"><i
							class="Hui-iconfont">&#xe642;</i> 浏览文件</a> <input type="file"
						multiple name="upload" class="input-file">
					</span>
				</div>
			</div>
			<div class="row cl">
				<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
					<input class="btn btn-primary radius" type="submit"
						value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
				</div>
			</div>
		</form>
	</article>

	<!--_footer 作为公共模版分离出去-->
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/lib/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/lib/layer/2.4/layer.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/static/h-ui/js/H-ui.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/static/h-ui.admin/js/H-ui.admin.js"></script>
	<!--/_footer 作为公共模版分离出去-->

	<!--请在下方写此页面业务相关的脚本-->
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/lib/My97DatePicker/4.8/WdatePicker.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/lib/jquery.validation/1.14.0/jquery.validate.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/lib/jquery.validation/1.14.0/validate-methods.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/lib/jquery.validation/1.14.0/messages_zh.js"></script>
	<script type="text/javascript">
		$(function() {
			$('.skin-minimal input').iCheck({
				checkboxClass : 'icheckbox-blue',
				radioClass : 'iradio-blue',
				increaseArea : '20%'
			});

			$("#form-member-add").validate({
				rules : {
					username : {
						required : true,
						minlength : 2,
						maxlength : 16
					},
					sex : {
						required : true,
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
	<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>