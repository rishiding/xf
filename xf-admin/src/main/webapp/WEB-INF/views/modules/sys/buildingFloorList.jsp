<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
 	<%@ include file="/WEB-INF/views/include/head.jsp" %>
 	<script type="text/javascript" src="${ctxStatic}/layer/layer.js"></script>
	<title>建筑楼层管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			$("img").click(function(){						
				layer.open({
				    type: 2,	
				    title:'平面图预览',
				    maxmin: true,  
				    area: ['600px', '600px'],
				    content: this.src				   
				  });				
			});	
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/sys/buildingFloor/">建筑楼层列表</a></li>
		<shiro:hasPermission name="sys:buildingFloor:edit"><li><a href="${ctx}/sys/buildingFloor/form">建筑楼层添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="buildingFloor" action="${ctx}/sys/buildingFloor/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li>
			<label>建筑名：</label>
			<sys:treeselect id="building" name="building.id" value="${buildingFloor.building.id}"
                                                labelName="building.name" labelValue="${buildingFloor.building.name}"
                                                title="建筑" url="/sys/building/treeData" cssClass="input-small"
                                                allowClear="true"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>所属建筑</th>
				<th>楼层</th>
				<th>平面图</th>
				<th>视频监控</th>
				<shiro:hasPermission name="sys:buildingFloor:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="buildingFloor">
			<tr>
			<td>
					${buildingFloor.building.name}
				</td>
				<td><a href="${ctx}/sys/buildingFloor/form?id=${buildingFloor.id}">
					${buildingFloor.floorNo}
				</a></td>
				<td>
				<img alt="平面图" src="${buildingFloor.planeImg}" width="100" />
				</td>
				<td>
					${buildingFloor.videoUrl}
				</td>
				<shiro:hasPermission name="sys:buildingFloor:edit"><td>
    				<a href="${ctx}/sys/buildingFloor/form?id=${buildingFloor.id}">修改</a>
					<a href="${ctx}/sys/buildingFloor/delete?id=${buildingFloor.id}" onclick="return confirmx('确认要删除该建筑楼层吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>