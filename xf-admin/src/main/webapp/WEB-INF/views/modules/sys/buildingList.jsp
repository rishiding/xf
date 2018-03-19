<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
 <%@ include file="/WEB-INF/views/include/head.jsp" %>
	<title>消防建筑管理</title>
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
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>建筑名</th>
				<th>更新时间</th>
				<th>备注信息</th>
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
					<fmt:formatDate value="${building.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${building.remarks}
				</td>
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