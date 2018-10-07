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
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/lib/webuploader/0.1.5/webuploader.css">
<!--[if IE 6]>
<script type="text/javascript" src="${pageContext.request.contextPath }/lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>新增隐患标准</title>
</head>
<body>
	<div class="page-container">
		<form class="form form-horizontal" id="form-article-add"
			action="${pageContext.request.contextPath}/standardInvestigation_save.action"
			method="post">
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-2"><span
					class="c-red">*</span>主题：</label>
				<div class="formControls col-xs-3 col-sm-4">
					<input class="input-text" value="" placeholder="" id=""
						name="content">
				</div>
				<label class="form-label col-xs-1 col-sm-1"><span
					class="c-red">*</span>排查人：</label>
				<div class="formControls col-xs-3 col-sm-4">
					<span class="select-box"> <select name="trueName"
						id="checkUp" class="select">
							<option value="">请选择</option>
					</select>
					</span>
				</div>
			</div>

			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-2"><span
					class="c-red">*</span>隐患等级：</label>
				<div class="formControls col-xs-3 col-sm-4">
					<span class="select-box"> <select name="gradeId"
						id="hiddenGrade" class="select">
							<option value="">请选择</option>
					</select>
					</span>
				</div>
				<label class="form-label col-xs-1 col-sm-1"><span
					class="c-red">*</span>整改人：</label>
				<div class="formControls col-xs-3 col-sm-4">
					<span class="select-box"> <select name="repairName" id="repair"
						class="select">
							<option value="">请选择</option>
					</select>
					</span>
				</div>
			</div>

			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-2"><span
					class="c-red">*</span>区域：</label>
				<div class="formControls col-xs-4 col-sm-4">
					<span class="select-box"> <select name="firstPlace"
						onchange='showSecondPlace(this)' class="select" id="firstPlace">
							<option value="">请选择</option>
					</select>
					</span>
				</div>
				<div class="formControls col-xs-4 col-sm-4">
					<span class="select-box"> <select name="secondPlace"
						id="secondPlace" class="select">
							<option value="">请选择</option>
					</select>
					</span>
				</div>
			</div>

			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-2"><span
					class="c-red">*</span>详细内容：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<textarea name="info" cols="" rows="" class="textarea"
						placeholder="说点什么...最少输入10个字符" datatype="*10-100" dragonfly="true"
						nullmsg="备注不能为空！" onKeyUp="$.Huitextarealength(this,200)"></textarea>
					<p class="textarea-numberbar">
						<em class="textarea-length">0</em>/200
					</p>
				</div>
			</div>
			<div class="row cl">
				<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
					<button class="btn btn-primary radius" type="submit">
						<i class="Hui-iconfont">&#xe632;</i> 提交
					</button>
					<button onClick="layer_close();" class="btn btn-default radius"
						type="button">&nbsp;&nbsp;取消&nbsp;&nbsp;</button>
				</div>
			</div>
		</form>
	</div>


	<!--_footer 作为公共模版分离出去-->
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/lib/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/lib/layer/2.4/layer.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/static/h-ui/js/H-ui.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/static/h-ui.admin/js/H-ui.admin.js"></script>
	<!--/_footer /作为公共模版分离出去-->

	<!--请在下方写此页面业务相关的脚本-->
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/lib/jquery.validation/1.14.0/jquery.validate.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/lib/jquery.validation/1.14.0/validate-methods.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/lib/jquery.validation/1.14.0/messages_zh.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/lib/webuploader/0.1.5/webuploader.js"></script>
	<c:if test="${msg==1 }">
		<script type="text/javascript">
			layer.msg('添加成功!', {
				icon : 1
			});
		</script>
	</c:if>

	<script type="text/javascript">
		$(function() {

			$("#form-article-add").validate({
				rules : {
					id : {
						required : true,
						minlength : 4,
						maxlength : 16
					},
					grade : {
						required : true,
					},
					firstPlace : {
						required : true,
					},
					secondPlace : {
						required : true,
					},
					upload : {
						required : true,
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
													var content = "";
													for ( var type in data) {
														content += "<option value='"+data[type].id+"'>"
																+ data[type].place_name
																+ "</option>";
													}
													content += "</select></span>";
													$("#firstPlace").append(
															content);
												}

											}, "json");

							$
									.post(
											"${pageContext.request.contextPath}/grade_getGrade.action",
											{},
											function(data) {
												if (data != null
														&& data.length > 0) {
													var content = "";
													for ( var type in data) {
														content += "<option value='"+data[type].grade_id+"'>"
																+ data[type].info
																+ "</option>";
													}
													content += "</select></span>";
													$("#hiddenGrade").append(
															content);
												}

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
														content += "<option value='"+data[type].trueName+"'>"
																+ data[type].trueName
																+ "</option>";
													}
													content += "</select></span>";
													$("#checkUp").append(
															content);
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
														content += "<option value='"+data[type].trueName+"'>"
																+ data[type].trueName
																+ "</option>";
													}
													content += "</select></span>";
													$("#repair")
															.append(content);
												}

											}, "json");

						});

		function showSecondPlace(obj) {
			$
					.post(
							"${pageContext.request.contextPath}/place_getSecond.action",
							{
								first_id : obj.value
							},
							function(data) {
								$("#secondPlace").html(
										"<option value=''>请选择</option>");
								if (data != null && data.length > 0) {
									var content = "";
									$(data)
											.each(
													function() {
														$("#secondPlace")
																.append(
																		"<option value='"+this.id+"'>"
																				+ this.place_name
																				+ "</option>");
													});
								}

							}, "json");

		};
	</script>
</body>
</html>