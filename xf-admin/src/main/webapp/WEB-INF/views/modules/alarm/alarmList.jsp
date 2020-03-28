<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
 	<%@ include file="/WEB-INF/views/include/head.jsp" %>
	<title>报警记录管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			
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
		<li class="active"><a href="${ctx}/alarm/alarm/">报警记录列表</a></li>
		<shiro:hasPermission name="alarm:alarm:edit"><li><a href="${ctx}/alarm/alarm/form">报警记录添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="alarm" action="${ctx}/alarm/alarm/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>设备号</th>
				<th>主机号</th>
				<th>回路号</th>
				<th>报警类型</th>				
				<th>发生建筑</th>
				<th>发生楼层</th>
				<th>发生时间</th>
				<th>位置描述</th>
				<shiro:hasPermission name="alarm:alarm:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="alarm">
			<tr>
				<td>
					${alarm.ieme}
				</td>
				<td>
					${alarm.hostNumber}
				</td>
				<td>
					${alarm.loopNumber}
				</td>
				<td>
					${alarm.typeName}
				</td>
				<td>
					${alarm.build.name}
				</td>
				<td>
					${alarm.floor.floorNo}
				</td>
				<td><a href="${ctx}/alarm/alarm/form?id=${alarm.id}">
					<fmt:formatDate value="${alarm.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</a></td>
				<td>
					${alarm.remarks}
				</td>
				<shiro:hasPermission name="alarm:alarm:edit"><td>
    				<a href="${ctx}/alarm/alarm/form?id=${alarm.id}">修改</a>
					<a href="${ctx}/alarm/alarm/delete?id=${alarm.id}" onclick="return confirmx('确认要删除该报警记录吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>