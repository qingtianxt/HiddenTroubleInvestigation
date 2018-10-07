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
<link rel="Bookmark" href="/favicon.ico">
<link rel="Shortcut Icon" href="/favicon.ico" />
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

<title>展示隐患位置</title>
</head>
<body>
	<article class="page-container">
		<form action="${pageContext.request.contextPath }/place_update.action"
			method="post" class="form form-horizontal" id="form-member-add">
			<input type="hidden" name="id" value="${model.id }">
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span
					class="c-red">*</span>名称</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text" class="input-text" placeholder=""
						id="place_name" name="place_name" value=${model.place_name }>
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span
					class="c-red">*</span>父类名称</label>
				<div class="formControls col-xs-8 col-sm-9" id="firstPlace">
					<span class="select-box"> <select name="parent_id"
						class="select">
							<option value="">请选择</option>
					</select>
					</span>
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span
					class="c-red">*</span>经度</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text" class="input-text" value="${model.longitude }" placeholder=""
						id="longitude" name="longitude">
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span
					class="c-red">*</span>纬度</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text" class="input-text" value="${model.latitude }" placeholder=""
						id="latitude" name="latitude">
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span
					class="c-red">*</span>位置信息描述</label>
				<div class="formControls col-xs-8 col-sm-9">
					<textarea name="info" cols="" rows="" class="textarea"
						placeholder="说点什么...最少输入10个字符" datatype="*10-100" dragonfly="true"
						nullmsg="备注不能为空！" onKeyUp="$.Huitextarealength(this,200)">${model.info }</textarea>
					<p class="textarea-numberbar">
						<em class="textarea-length">0</em>/200
					</p>
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
	<c:if test="${msg==1 }">
		<script type="text/javascript">
			layer.msg('修改成功!', {
				icon : 1
			});
		</script>
	</c:if>
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
	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							$
									.post(
											"${pageContext.request.contextPath}/place_getFirst.action",
											{},
											function(data) {
												if (data != null
														&& data.length > 0) {
													var content = "<span class='select-box'> <select name='parent_id' class='select'>";
													content += "<option value='${p.id}'>${p.place_name}</option>";
													for ( var type in data) {
														content += "<option value='"+data[type].id+"'>"
																+ data[type].place_name
																+ "</option>";
													}
													content += "<option value='0'>无</option>";
													content += "</select></span>";
													$("#firstPlace").html(
															content);
												}
											}, "json");
						});
	</script>
	<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>