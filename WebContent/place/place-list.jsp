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
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/lib/zTree/v3/css/zTreeStyle/zTreeStyle.css"
	type="text/css">
<!--[if IE 6]>
<script type="text/javascript" src="${pageContext.request.contextPath }/lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>产品分类</title>
</head>
<body>
	<nav class="breadcrumb">
		<i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span>
		位置管理 <span class="c-gray en">&gt;</span> 位置展示 <a
			class="btn btn-success radius r"
			style="line-height: 1.6em; margin-top: 3px"
			href="javascript:location.replace(location.href);" title="刷新"><i
			class="Hui-iconfont">&#xe68f;</i></a>
	</nav>
	<table class="table">
		<tr>
			<td width="200" class="va-t"><ul id="treeDemo" class="ztree"></ul></td>
			<td class="va-t"><iframe ID="testIframe" Name="testIframe"
					FRAMEBORDER=0 SCROLLING=AUTO width=90% height=500px
					SRC="${pageContext.request.contextPath }/place/place-show.jsp"></iframe></td>
		</tr>
	</table>
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
		src="${pageContext.request.contextPath }/lib/zTree/v3/js/jquery.ztree.all-3.5.min.js"></script>
	<script type="text/javascript">
		var setting = {
			view : {
				dblClickExpand : false,
				showLine : false,
				selectedMulti : false
			},
			data : {
				simpleData : {
					enable : true,
					idKey : "id",
					pIdKey : "pId",
					rootPId : ""
				}
			},
			callback : {
				beforeClick : function(treeId, treeNode) {
					var zTree = $.fn.zTree.getZTreeObj("tree");
					window.testIframe.location = "${pageContext.request.contextPath}/place_getById.action?id="
							+ treeNode.id;
					if (treeNode.isParent) {
						zTree.expandNode(treeNode);
						return false;
					} else {
						/* demoIframe.attr("src",treeNode.file + ".html"); */
						return true;
					}
				}
			}
		};

		var zNodes = [];

		$
				.ajax({
					url : "${pageContext.request.contextPath }/place_getFirst.action",
					data : {},
					type : "POST",
					dataType : "json",
					async : false,
					success : function(data) {
						//var data = JSON.parse(JSON.stringify(httpdata));
						if (data != null && data.length > 0) {

							data
									.forEach(function(i, index) {
										if (i.id == 1) {
											var node = {
												id : i.id,
												pId : 0,
												name : i.place_name,
												open : true
											}
										} else {
											var node = {
												id : i.id,
												pId : 0,
												name : i.place_name,
												open : false
											}
										}

										zNodes.push(node);
										$
												.ajax({
													url : "${pageContext.request.contextPath }/place_getSecond.action?first_id="
															+ i.id,
													data : {},
													type : "POST",
													dataType : "json",
													async : false,
													success : function(data) {
														//var data = JSON.parse(JSON.stringify(httpdata));
														//alert(data[0].place_name);
														if (data != null
																&& data.length > 0) {
															data
																	.forEach(function(
																			i,
																			index) {
																		var node = {
																			id : i.id,
																			pId : i.parent_id,
																			name : i.place_name,
																			open : false
																		}
																		zNodes
																				.push(node);
																	});
														}
													}
												});

									});
						}

					}
				});
		var code;

		function showCode(str) {
			if (!code)
				code = $("#code");
			code.empty();
			code.append("<li>" + str + "</li>");
		}

		$(document).ready(function() {
			var t = $("#treeDemo");
			t = $.fn.zTree.init(t, setting, zNodes);
			demoIframe = $("#testIframe");
			//demoIframe.on("load", loadReady);
			var zTree = $.fn.zTree.getZTreeObj("tree");
			//zTree.selectNode(zTree.getNodeByParam("id",'11'));
		});
	</script>
	<c:if test="${msg==1 }">
		<script type="text/javascript">
			layer.msg('修改成功!', {
				icon : 1
			});
		</script>
	</c:if>
	<c:if test="${msg==2 }">
		<script type="text/javascript">
			layer.msg('删除失败，该位置还有子位置!', {
				icon : 2
			});
		</script>
	</c:if>
	<c:if test="${msg==3 }">
		<script type="text/javascript">
			layer.msg('删除成功!', {
				icon : 1
			});
		</script>
	</c:if>
</body>
</html>