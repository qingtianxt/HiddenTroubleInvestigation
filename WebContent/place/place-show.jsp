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
		<form action="" method="post" class="form form-horizontal"
			id="form-member-add" enctype="multipart/form-data">
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span
					class="c-red">*</span>id</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text" class="input-text" value="${model.id }"
						placeholder="" id="username" name="username">
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span
					class="c-red">*</span>名称</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text" class="input-text" value="${model.place_name }"
						placeholder="" id="password" name="password">
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span
					class="c-red">*</span>父类名称</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text" class="input-text" value="${p.place_name }"
						placeholder="" id="telephone" name="telephone">
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span
					class="c-red">*</span>经度</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text" class="input-text" value="${model.longitude }"
						placeholder="" id="telephone" name="telephone">
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span
					class="c-red">*</span>纬度</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text" class="input-text" value="${model.latitude }"
						placeholder="" id="telephone" name="telephone">
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
					<span class="l"><a href="javascript:;"
						onclick="placedel(${model.id})" class="btn btn-danger radius"><i
							class="Hui-iconfont">&#xe6e2;</i> 删除位置</a> <a href="javascript:;"
						onclick="place_edit('修改位置','${model.id}')"
						class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i>
							修改位置</a></span>
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
	<!--/请在上方写此页面业务相关的脚本-->
	<script type="text/javascript">
		function admin_add(title, url) {
			layer_show(title, url, '400', '300');
		}
		/*管理员-删除*/
		function placedel(id) {
			layer.confirm('确认要删除吗？', function(index) {
				window.parent.location.href="${pageContext.request.contextPath}/place_delete.action?id="+id;
			});
		}
		function place_edit(title,id,w,h) {
			url="${pageContext.request.contextPath}/place_initUpdate.action?id="+id;
			layer_show(title,url,w,h);
		}
	</script>
</body>
</html>