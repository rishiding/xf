<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
 <%@ include file="/WEB-INF/views/include/head.jsp" %>
 <script type="text/javascript" src="${ctxStatic}/layer/layer.js"></script>
	<title>消防建筑管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			$("img").click(function(){						
				ll=layer.open({
				    type: 2,	
				    title:'平面图预览',
				    maxmin: true,  
				    area: ['600px', '600px'],
				    content: this.src				   
				  });	
				 layer.full(ll);
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
		<li class="active"><a href="${ctx}/sys/building/">消防建筑列表</a></li>
		<shiro:hasPermission name="sys:building:edit"><li><a href="${ctx}/sys/building/form">消防建筑添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="building" action="${ctx}/sys/building/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>建筑名：</label>
				<form:input path="name" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li><label>楼栋：</label>
				<form:input path="buildingNo" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li><label>楼层：</label>
				<form:input path="floorNum" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>消防建筑名/ID</th>
				<th>单位/社区</th>
				<th>楼栋</th>
				<th>位置坐标</th>
				<th>楼层</th>
				<th>平面图</th>
				<th>可用电梯数量</th>
				<th>可用楼梯数量</th>
				<th>视频监控</th>
				<shiro:hasPermission name="sys:building:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="building">
			<tr>
				<td><a href="${ctx}/sys/building/form?id=${building.id}">
					${building.name}
				</a></td>
				<td>
					${building.unit.name}
				</td>
				<td>
					${building.buildingNo}
				</td>
				<td>
					${building.point}
				</td>
				<td >
					
					${building.floorNum}
					
				</td>
				<td>
					<c:if test="${not empty  building.planeImg}">
					<img alt="平面图" src="${building.planeImg}" width="100" height="100"/>
					</c:if>
					
				</td>
				<td>
					${building.elevatorsNum}
				</td>
				<td>
					${building.stairNum}
				</td>
				<td></td>
				<shiro:hasPermission name="sys:building:edit"><td>
    				<a href="${ctx}/sys/building/form?id=${building.id}">修改</a>
					<a href="${ctx}/sys/building/delete?id=${building.id}" onclick="return confirmx('确认要删除该消防建筑吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>