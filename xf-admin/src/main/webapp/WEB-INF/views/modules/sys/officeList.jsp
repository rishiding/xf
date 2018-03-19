<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <%@ include file="/WEB-INF/views/include/head.jsp" %>
    <title>机构管理</title>
    <meta name="decorator" content="default"/>
    <%@include file="/WEB-INF/views/include/treetable.jsp" %>
    <script type="text/javascript">
        $(document).ready(function () {
            var tpl = $("#treeTableTpl").html().replace(/(\/\/\<!\-\-)|(\/\/\-\->)/g, "");
            var data = ${fns:toJson(list)}, rootId = "${not empty office.id ? office.id : '0'}";
            addRow("#treeTableList", tpl, data, rootId, true);
            $("#treeTable").treeTable({expandLevel: 5});
        });
        function addRow(list, tpl, data, pid, root) {
            for (var i = 0; i < data.length; i++) {
                var row = data[i];
                if ((${fns:jsGetVal('row.parentId')}) == pid) {
                    $(list).append(Mustache.render(tpl, {
                        dict: {
                            type: getDictLabel(${fns:toJson(fns:getDictList('sys_office_type'))}, row.type)
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
    <li class="active"><a href="${ctx}/sys/office/list1?id=${office.id}&area.id=${office.area.id}">机构列表</a></li>
    <shiro:hasPermission name="sys:office:edit">
        <li><a href="${ctx}/sys/office/form?area.id=${office.area.id}">机构添加</a></li>
    </shiro:hasPermission>
</ul>
<sys:message content="${message}"/>
<table id="treeTable" class="table table-striped table-bordered table-condensed">
    <thead>
    <tr>
    	<th>区域名称</th>             
        <th>机构类型</th>
        <th>机构名称</th>
        <th>机构编码</th>
        <th>联系人</th>
        <th>电话</th>
        <th>备注</th>
        <shiro:hasPermission name="sys:office:edit">
            <th>操作</th>
        </shiro:hasPermission></tr>
    </thead>
    <tbody id="treeTableList"></tbody>
</table>
<script type="text/template" id="treeTableTpl">
    <tr id="{{row.id}}" pId="{{pid}}">
		<td>{{row.area.name}}</td>      
        <td>{{dict.type}}</td>
 		<td><a href="${ctx}/sys/office/form?id={{row.id}}">{{row.name}}</a></td>  
		<td>{{row.code}}</td>
        <td>{{row.master}}</td>
 		<td>{{row.phone}}</td>
		 <td>{{row.remarks}}</td>
        <shiro:hasPermission name="sys:office:edit">
            <td>
                <a href="${ctx}/sys/office/form?id={{row.id}}">修改</a>
                <a href="${ctx}/sys/office/delete?id={{row.id}}"
                   onclick="return confirmx('要删除该机构吗？', this.href)">删除</a>
                
            </td>
        </shiro:hasPermission>
    </tr>
</script>
</body>
</html>