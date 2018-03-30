<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
 	<%@ include file="/WEB-INF/views/include/head.jsp" %>
	<title>消防设施巡检管理</title>
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
		<li class="active"><a href="${ctx}/device/deviceCheck/">消防设施巡检列表</a></li>
		<shiro:hasPermission name="device:deviceCheck:edit"><li><a href="${ctx}/device/deviceCheck/form">消防设施巡检添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="deviceCheck" action="${ctx}/device/deviceCheck/" method="post" class="breadcrumb form-search">
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
				<th>更新时间 : 更新时间</th>
				<th>备注信息 : 备注信息</th>
				<shiro:hasPermission name="device:deviceCheck:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="deviceCheck">
			<tr>
				<td><a href="${ctx}/device/deviceCheck/form?id=${deviceCheck.id}">
					<fmt:formatDate value="${deviceCheck.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</a></td>
				<td>
					${deviceCheck.remarks}
				</td>
				<shiro:hasPermission name="device:deviceCheck:edit"><td>
    				<a href="${ctx}/device/deviceCheck/form?id=${deviceCheck.id}">修改</a>
					<a href="${ctx}/device/deviceCheck/delete?id=${deviceCheck.id}" onclick="return confirmx('确认要删除该消防设施巡检吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>