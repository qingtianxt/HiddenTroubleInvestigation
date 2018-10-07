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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/lib/layui/css/layui.css">
<!--[if IE 6]>
<script type="text/javascript" src="${pageContext.request.contextPath }/lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>隐患列表</title>
</head>
<body>
	<form
		action="${pageContext.request.contextPath }/hiddenDanger_findByPage.action"
		method="post">

		<nav class="breadcrumb">
			<i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span>
			隐患管理 <span class="c-gray en">&gt;</span> 隐患列表 <a
				class="btn btn-success radius r"
				style="line-height: 1.6em; margin-top: 3px"
				href="javascript:location.replace(location.href);" title="刷新"><i
				class="Hui-iconfont">&#xe68f;</i></a>
		</nav>
		<div class="page-container">
			<div class="text-c">
				排查人： <input type="text" class="input-text" style="width: 200px"
					placeholder="输入用户名称" id="" name="trueName" value="${trueName }">
				&nbsp;上传方式: <span class="select-box" style="width: 250px;"> <select
					name="typeId" class="select">
						<option value="">请选择</option>
						<c:if test="${typeId==0 }">
							<option value="0" selected>自查</option>
						</c:if>
						<c:if test="${typeId!=0 }">
							<option value="0">自查</option>
						</c:if>
						<c:if test="${typeId==1 }">
							<option value="1" selected>排查</option>
						</c:if>
						<c:if test="${typeId!=1 }">
							<option value="1">排查</option>
						</c:if>
				</select>
				</span>
			</div>
			<div style="height: 20px"></div>
			<div class="text-c">
				日期范围： <input type="text" name="time1" value="${time1 }"
					onfocus="WdatePicker({ maxDate:'#F{$dp.$D(\'logmax\')||\'%y-%M-%d\'}' })"
					id="logmin" class="input-text Wdate" style="width: 120px;">
				- <input type="text" name="time2" value="${time2 }"
					onfocus="WdatePicker({ minDate:'#F{$dp.$D(\'logmin\')}',maxDate:'%y-%M-%d' })"
					id="logmax" class="input-text Wdate" style="width: 120px;">&nbsp;处理状态:
				<span class="select-box" style="width: 250px;"> <select
					name="sta" class="select">
						<option value="">请选择</option>
						<c:if test="${sta==0 }">
							<option value="0" selected>未处理</option>
						</c:if>
						<c:if test="${sta!=0 }">
							<option value="0">未处理</option>
						</c:if>
						<c:if test="${sta==1 }">
							<option value="1" selected>已处理</option>
						</c:if>
						<c:if test="${sta!=1 }">
							<option value="1">已处理</option>
						</c:if>
						<c:if test="${sta==2 }">
							<option value="2" selected>无需处理</option>
						</c:if>
						<c:if test="${sta!=2 }">
							<option value="2">无需处理</option>
						</c:if>
				</select>
				</span>
				<button name="" id="" class="btn btn-success" type="submit">
					<i class="Hui-iconfont">&#xe665;</i> 搜隐患
				</button>
			</div>
			<div class="cl pd-5 bg-1 bk-gray mt-20">
				<span class="r">共有数据：<strong>${page.totalCount }</strong> 条
				</span>
			</div>
			<div class="mt-20">
				<table
					class="table table-border table-bordered table-bg table-hover table-sort">
					<thead>
						<tr class="text-c">
							<th width="80">隐患ID</th>
							<th width="100">排查人员</th>
							<th width="100">图片</th>
							<th width="100">上传类型</th>
							<th width="100">整改状态</th>
							<th>问题描述</th>
							<th width="150">隐患等级</th>
							<th width="100">操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${page.beanList }" var="hiddenDanger">
							<tr class="text-c">
								<td>${hiddenDanger.hidden_id }</td>
								<td><u style="cursor: pointer" class="text-primary"
									onclick="member_show('${hiddenDanger.user.trueName}','360','400',${hiddenDanger.user.user_id })">${hiddenDanger.user.trueName }</u></td>
								<td><a
									href="${pageContext.request.contextPath }/hiddenDanger_findById.action?hidden_id=${hiddenDanger.hidden_id}"><img
										width="210" class="picture-thumb" src="temp/200x150.jpg"></a></td>
								<c:if test="${hiddenDanger.type==1 }">
									<td>排查</td>
								</c:if>
								<c:if test="${hiddenDanger.type==0 }">
									<td>自查</td>
								</c:if>
								<c:if test="${hiddenDanger.status==0 }">
									<td>未处理</td>
								</c:if>
								<c:if test="${hiddenDanger.status==1 }">
									<td>已处理</td>
								</c:if>
								<c:if test="${hiddenDanger.status==2 }">
									<td>没有问题</td>
								</c:if>
								<td>${hiddenDanger.info }</td>
								<td><span class="label label-danger radius">${hiddenDanger.grade.info }</span></td>

								<td class="td-manage"><a title="编辑" href="javascript:;"
									onclick="HiddenDanger_edit(this,${hiddenDanger.status },${hiddenDanger.hidden_id})"
									class="ml-5" style="text-decoration: none"><i
										class="Hui-iconfont">&#xe6df;</i></a> <a title="删除"
									href="javascript:;"
									onclick="HiddenDanger_del(this,${hiddenDanger.hidden_id})"
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
			src="${pageContext.request.contextPath}/lib/layui/layui.js"></script>
		<c:if test="${msg==1 }">
			<script type="text/javascript">
			layer.msg('删除成功!',{icon:1});
		</script>
		</c:if>
		<c:if test="${msg==2 }">
			<script type="text/javascript">
			layer.msg('删除失败!',{icon:2});
		</script>
		</c:if>
		<c:if test="${msg==3 }">
			<script type="text/javascript">
			layer.msg('修改成功!',{icon:1});
		</script>
		</c:if>
		<script type="text/javascript">
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
		               window.location.href="${pageContext.request.contextPath}/hiddenDanger_findByPage.action?pageCode="+obj.curr+"&pageSize="+obj.limit;//跳转链接
	               } 
	        	   first = false;
	           }
	       });
	   });
	</script>
		<script type="text/javascript">
		   /*用户-查看*/
		   function member_show(title,w,h,id){
			   url="${pageContext.request.contextPath}/user_getInfo.action?user_id="+id;
			   layer_show(title,url,w,h);
			   
		   }
		  /*隐患-添加*/
		   function hiddenDanger_add(title,url,w,h){
		   	layer_show(title,url,w,h);
		   }
		   /*隐患-编辑*/
		   function HiddenDanger_edit(obj,status,id){
			   if(status==2){
				   layer.msg('经排查后该隐患没有问题!',{icon:6});
				   return;
			   }else if(status==1){
				   layer.msg('该隐患已处理!',{icon:6});
				   return;
			   }
			   
			   url="${pageContext.request.contextPath}/hiddenDanger_updateStatus.action?hidden_id="+id;
			  	layer.confirm('确认要修改隐患状态吗？',function(index){
			   		window.location.href=url;
			   	});
		   }
		   /*隐患-删除*/
		   function HiddenDanger_del(obj,id){
			   url="${pageContext.request.contextPath}/hiddenDanger_delete.action?hidden_id="+id;
		   	layer.confirm('确认要删除吗？',function(index){
		   		window.location.href=url;
		   	});
		   }

</script>
	</form>
</body>
</html>