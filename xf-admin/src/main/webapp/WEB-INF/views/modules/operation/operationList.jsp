<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
 	<%@ include file="/WEB-INF/views/include/head.jsp" %>
	<title>消防年月检管理</title>
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
		<li class="active"><a href="${ctx}/operation/operation/">消防年月检列表</a></li>
		<shiro:hasPermission name="operation:operation:edit"><li><a href="${ctx}/operation/operation/form">消防年月检添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="operation" action="${ctx}/operation/operation/" method="post" class="breadcrumb form-search">
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
				<th>更新日期</th>
				<th>备注</th>
				<shiro:hasPermission name="operation:operation:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="operation">
			<tr>
				<td><a href="${ctx}/operation/operation/form?id=${operation.id}">
					<fmt:formatDate value="${operation.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</a></td>
				<td>
					${operation.remarks}
				</td>
				<shiro:hasPermission name="operation:operation:edit"><td>
    				<a href="${ctx}/operation/operation/form?id=${operation.id}">修改</a>
					<a href="${ctx}/operation/operation/delete?id=${operation.id}" onclick="return confirmx('确认要删除该消防年月检吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>