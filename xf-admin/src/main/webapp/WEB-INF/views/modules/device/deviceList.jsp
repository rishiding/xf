<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
 	<%@ include file="/WEB-INF/views/include/head.jsp" %>
	<title>消防设施管理</title>
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

	<form:form id="searchForm" modelAttribute="device" action="${ctx}/device/device/" method="post" class="breadcrumb form-search">
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
				<th>日期</th>
				<th>单位/街道</th>
				<th>消防建筑ID</th>
				<th>消防设施ID</th>
				<th>消防设施名称</th>
				<th>设施类型</th>
				<th>事件描述</th>
				<th>状态</th>
				<th>数据源</th>
				<shiro:hasPermission name="device:device:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="device">
			<tr>
				<td>
					<fmt:formatDate value="${device.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${device.office.name}
				</td>
				<td>
					${device.buildId}
				</td>
				<td>
					${device.deviceId}
				</td>
				<td>
					${device.deviceName}
				</td>
				<td>
					${device.deviceType}
				</td>
				<td>
					${device.note}
				</td>
				<td>
					${device.statusName}
				</td>
				<td>
					${device.source}
				</td>
				<shiro:hasPermission name="device:device:edit"><td>
    				
					<a href="${ctx}/device/device/baoxiu?id=${device.id}" onclick="return confirmx('确认要保修该消防设施吗？', this.href)">保修</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>