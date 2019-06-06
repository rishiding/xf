<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
 	<%@ include file="/WEB-INF/views/include/head.jsp" %>
	<title>消防终端管理</title>
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
		<li class="active"><a href="${ctx}/terminal/">消防终端列表</a></li>
		<shiro:hasPermission name="terminal:terminal:edit"><li><a href="${ctx}/terminal/form">消防终端添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="terminal" action="${ctx}/terminal/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>设备类型：</label>
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
				<th>设备标识</th>
				<th>CCID</th>
				<th>经度</th>
				<th>纬度</th>
				<!-- <th>是否在线</th> -->
				<th>最后在线时间</th>
				<shiro:hasPermission name="terminal:terminal:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="terminal">
			<tr>
				<td><a href="${ctx}/terminal/form?id=${terminal.id}">
					${terminal.ieme}
				</a></td>
				<td>${terminal.ccid}</td>
				<td>${terminal.longitude}</td>
				<td>${terminal.latitude}</td>
				<%-- <td>${terminal.onlineName}</td> --%>
				<td>
					<fmt:formatDate value="${terminal.lastOnlineTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				
				<shiro:hasPermission name="terminal:terminal:edit"><td>
    				<a href="${ctx}/terminal/form?id=${terminal.id}">修改</a>
					<a href="${ctx}/terminal/delete?id=${terminal.id}" onclick="return confirmx('确认要删除该消防终端吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>