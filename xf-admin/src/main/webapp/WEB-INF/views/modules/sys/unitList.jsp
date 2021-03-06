<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
 	<%@ include file="/WEB-INF/views/include/head.jsp" %>
	<title>单位管理</title>
	<meta name="decorator" content="default"/>
	
	  <%@include file="/WEB-INF/views/include/treetable.jsp" %>
	  <script type="text/javascript">
        $(document).ready(function () {
            var tpl = $("#treeTableTpl").html().replace(/(\/\/\<!\-\-)|(\/\/\-\->)/g, "");
            var data = ${fns:toJson(list)}, rootId = "${not empty unit.id ? unit.id : '0'}";
            addRow("#treeTableList", tpl, data, rootId, true);
            $("#treeTable").treeTable({expandLevel: 5});
        });
        function addRow(list, tpl, data, pid, root) {
            for (var i = 0; i < data.length; i++) {
                var row = data[i];
                if ((${fns:jsGetVal('row.parentId')}) == pid) {
                    $(list).append(Mustache.render(tpl, {
                        dict: {
                            industry: getDictLabel(${fns:toJson(fns:getDictList('sys_industry'))}, row.industry)
                        }, pid: (root ? 0 : pid), row: row
                    }));
                    addRow(list, tpl, data, row.id);
                }
            }
        }
    </script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/sys/unit/list1">单位列表</a></li>
		<shiro:hasPermission name="sys:unit:edit"><li><a href="${ctx}/sys/unit/form?area.id=${unit.area.id}">单位添加</a></li></shiro:hasPermission>
	</ul>

	<sys:message content="${message}"/>
	<table id="treeTable" class="table table-striped table-bordered table-condensed">
    <thead>
    <tr>
        <th>单位/企业名称</th>
        <th>归属区域</th>       
        <th>消防单位</th>
        <th>街道办</th>
        <th>单位负责人</th>
        <th>负责人电话</th>
        <th>归属行业</th>
        <th>安防类型</th>
        <th>安保负责人</th>
        <th>安保电话</th>
        <shiro:hasPermission name="sys:unit:edit">
            <th>操作</th>
        </shiro:hasPermission></tr>
    </thead>
    <tbody id="treeTableList"></tbody>
</table>
<script type="text/template" id="treeTableTpl">
    <tr id="{{row.id}}" pId="{{pid}}">
        <td><a href="${ctx}/sys/unit/form?id={{row.id}}">{{row.name}}</a></td>
        <td>{{row.area.name}}</td>       
        <td>{{row.office.name}}</td>
 		<td>{{row.streetOffice.name}}</td>
 		<td>{{row.master}}</td>
		<td>{{row.phone}}</td>
		<td>{{dict.industry}}</td>
		<td>{{row.securityTypeName}}</td>
        <td>{{row.securityUser}}</td>
		<td>{{row.securityPhone}}</td>
        <shiro:hasPermission name="sys:unit:edit">
            <td>
                <a href="${ctx}/sys/unit/form?id={{row.id}}">修改</a>
                <a href="${ctx}/sys/unit/delete?id={{row.id}}"
                   onclick="return confirmx('要删除该单位及所有子单位项吗？', this.href)">删除</a>
                <a href="${ctx}/sys/unit/form?parent.id={{row.id}}">添加下级单位</a>
            </td>
        </shiro:hasPermission>
    </tr>
</script>
</body>
</html>