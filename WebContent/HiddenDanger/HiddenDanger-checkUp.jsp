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
<script type="text/javascript"
	src="${pageContext.request.contextPath }/lib/jquery/1.9.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/static/h-ui.admin/css/style.css" />
<!--[if IE 6]>
<script type="text/javascript" src="${pageContext.request.contextPath }/lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->

<title>图片展示</title>
<link
	href="${pageContext.request.contextPath }/lib/lightbox2/2.8.1/css/lightbox.css"
	rel="stylesheet" type="text/css">
</head>
<body>

	<nav class="breadcrumb">
		<i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span>
		隐患管理 <span class="c-gray en">&gt;</span> 隐患详细信息 <a
			class="btn btn-success radius r"
			style="line-height: 1.6em; margin-top: 3px"
			href="javascript:location.replace(location.href);" title="刷新"><i
			class="Hui-iconfont">&#xe68f;</i></a>
	</nav>
	<div>
		<div align="center">
			<c:if
				test="${not empty model.checkUp.checkUpPic &&''!=model.checkUp.checkUpPic}">
				<script type="text/javascript">
					$(function() {
						var ImgObj = new Image(); //判断图片是否存在  
						ImgObj.src = $
						{
							model.checkUp.checkUpPic
						}
						;
						//没有图片，则返回-1  
						if (ImgObj.fileSize > 0
								|| (ImgObj.width > 0 && ImgObj.height > 0)) {
							$("#pic")
									.html(
											"<img alt='图片'
									src='${pageContext.request.contextPath }/${model.checkUp.checkUpPic}'>");
						} else {
							$("#pic")
									.html(
											"<img alt='图片'
							src='${pageContext.request.contextPath }/HiddenDanger/1.jpg'>");
						}
					});
				</script>

				<div id="pic">
					<img alt="图片"
						src="${pageContext.request.contextPath }/${model.checkUp.checkUpPic}">
				</div>
			</c:if>
			<c:if
				test="${empty model.checkUp.checkUpPic ||''==model.checkUp.checkUpPic}">
				<img alt="图片"
					src="${pageContext.request.contextPath }/HiddenDanger/1.jpg">
			</c:if>
		</div>
		<div style="height: 30px"></div>
		<div align="left">
			<label class="form-label col-xs-2 col-sm-2"></label> <label
				class="form-label col-xs-4 col-sm-4"><strong
				style="font-size: 16px">排查人员：</strong> ${model.checkUp.user.trueName }</label>
			<label class="form-label col-xs-4 col-sm-4"><strong
				style="font-size: 16px">上传日期：</strong> ${model.checkUp.checkUp_date }</label>
		</div>
		<div style="height: 30px"></div>

		<div align="left">
			<label class="form-label col-xs-2 col-sm-2"></label> <label
				class="form-label col-xs-4 col-sm-4"><strong
				style="font-size: 16px">隐患等级：</strong> ${model.grade }</label> <label
				class="form-label col-xs-4 col-sm-4"><strong
				style="font-size: 16px">地址：</strong> ${model.place.place_name }</label>
		</div>
		<div style="height: 30px"></div>
		<label class="form-label col-xs-2 col-sm-2"></label> <label
			class="form-label col-xs-9 col-sm-9"><strong
			style="font-size: 16px">详细信息：</strong>${model.info }</label>
		<div style="height: 60px"></div>
		
		<%-- <a style="text-decoration: none" class="ml-5"
			onClick="picture_del(this,${hiddenDanger.hidden_id})"
			href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a> --%>
		<label class="form-label col-xs-4 col-sm-4"></label> <label
			class="form-label col-xs-1 col-sm-1"> <a href="javascript:;"
			onclick="checkUp('1')"
			class="btn btn-primary radius"> 通过</a>
		</label> <label class="form-label col-xs-2 col-sm-2"></label> <label
			class="form-label col-xs-1 col-sm-1"> <a href="javascript:;"
			onclick="checkUp('5')" class="btn btn-danger radius"> 退回</a>
		</label>

	</div>
	<!--_footer 作为公共模版分离出去-->

	<script type="text/javascript"
		src="${pageContext.request.contextPath }/lib/layer/2.4/layer.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/static/h-ui/js/H-ui.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/static/h-ui.admin/js/H-ui.admin.js"></script>
	<!--/_footer 作为公共模版分离出去-->

	<!--请在下方写此页面业务相关的脚本-->
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/lib/lightbox2/2.8.1/js/lightbox.min.js"></script>
	<script type="text/javascript">
		$(function() {
			$(".portfolio-area li").Huihover();
		});
		
		function checkUp(status){
			
			url="${pageContext.request.contextPath}/hiddenDanger_updateStatus.action?hidden_id="+${model.hidden_id}+"&status="+status;
			location.href=url;
		}
	</script>
	
</body>
</html>