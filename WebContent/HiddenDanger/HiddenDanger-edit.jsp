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
<title>修改隐患信息</title>
</head>
<body>
	<div class="page-container">
		<form class="form form-horizontal" id="form-article-add"
			action="${pageContext.request.contextPath }/hiddenDanger_update.action"
			target="_parent" enctype="multipart/form-data" method="post">
			<input type="hidden" name="id" value="${model.id }"> <%-- <input
				type="hidden" name="oldPic" value="${model.picture }" /> --%> <input
				type="hidden" name="upload_date" value="${model.upload_date }" />
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-2"><span
					class="c-red">*</span>上传用户：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text" class="input-text" value="${model.user.id }"
						readonly="readonly" placeholder="" id="" name="user.id">
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-2"><span
					class="c-red">*</span>详细地址：</label>
				<div class="formControls col-xs-4 col-sm-4">
					<span class="select-box"> <select name="firstPlace"
						onchange='showSecondPlace(this)' class="select" id="firstPlace">
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
					class="c-red">*</span>处理状态：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<span class="select-box"> <select name="status"
						class="select">
							<c:if test="${model.status==0 }">
								<option value="0" selected>未处理</option>
							</c:if>
							<c:if test="${model.status!=0 }">
								<option value="0">未处理</option>
							</c:if>
							<c:if test="${model.status==1 }">
								<option value="1" selected>处理中</option>
							</c:if>
							<c:if test="${model.status!=1 }">
								<option value="1">处理中</option>
							</c:if>
							<c:if test="${model.status==2 }">
								<option value="2" selected>已处理</option>
							</c:if>
							<c:if test="${model.status!=2 }">
								<option value="2">已处理</option>
							</c:if>
					</select>
					</span>
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-2"><span
					class="c-red">*</span>隐患等级：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<span class="select-box"> <select name="grade"
						class="select">
							<c:if test="${model.grade=='1' }">
								<option value="1" selected>1</option>
							</c:if>
							<c:if test="${model.grade!='1' }">
								<option value="1">1</option>
							</c:if>
							<c:if test="${model.grade!='2' }">
								<option value="2">2</option>
							</c:if>
							<c:if test="${model.grade=='2' }">
								<option value="2" selected>2</option>
							</c:if>
							<c:if test="${model.grade!='3' }">
								<option value="3">3</option>
							</c:if>
							<c:if test="${model.grade=='3' }">
								<option value="3" selected>3</option>
							</c:if>
							<c:if test="${model.grade!='4' }">
								<option value="4">4</option>
							</c:if>
							<c:if test="${model.grade=='4' }">
								<option value="4" selected>4</option>
							</c:if>
					</select>
					</span>
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-2">问题描述：</label>
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
				<label class="form-label col-xs-4 col-sm-2">上传图片：</label>
				<div id="uploader-demo" class="formControls col-xs-8 col-sm-9">
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
	<script type="text/javascript"></script>
	<c:if test="${msg==1 }">
		<script type="text/javascript">
			layer.msg('添加成功!', {
				icon : 1
			});
		</script>
	</c:if>
	<c:if test="${msg==2 }">
		<script type="text/javascript">
			layer.msg('添加失败!', {
				icon : 2
			});
		</script>
	</c:if>
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

													//判断第一个地点是否为空，不为空的话设置选中改位置
													var flag = "${empty first_Place}";
													var content = "";
													for ( var type in data) {

														if (flag != true) {
															if (data[type].place_name == '${first_Place.place_name}') {
																content += "<option value='"+data[type].id+"' selected='selected'>"
																		+ data[type].place_name
																		+ "</option>";
															} else {
																content += "<option value='"+data[type].id+"'>"
																		+ data[type].place_name
																		+ "</option>";
															}
														} else {
															content += "<option value='"+data[type].id+"'>"
																	+ data[type].place_name
																	+ "</option>";
														}

													}

													content += "</select></span>";
													$("#firstPlace").append(
															content);

													//判断第二个位置是否为空，不为空的话设置该地点
													var flag = "${empty second_Place}";
													if (flag != true) {
														$("#secondPlace")
																.html(
																		"<option value='${second_Place.id}'>${second_Place.place_name}</option>");
													} else {
														$("#secondPlace")
																.html(
																		"<option value=''>请选择</option>");
													}

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