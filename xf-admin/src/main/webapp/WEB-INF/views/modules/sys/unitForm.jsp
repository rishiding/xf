<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <%@ include file="/WEB-INF/views/include/head.jsp" %>
    <title>机构管理</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#name").focus();
            $("#inputForm").validate({
                submitHandler: function (form) {
                    loading('正在提交，请稍等...');
                    form.submit();
                },
                errorContainer: "#messageBox",
                errorPlacement: function (error, element) {
                    $("#messageBox").text("输入有误，请先更正。");
                    if (element.is(":checkbox") || element.is(":radio") || element.parent().is(".input-append")) {
                        error.appendTo(element.parent().parent());
                    } else {
                        error.insertAfter(element);
                    }
                }
            });
        });
    </script>
</head>
<body>
<ul class="nav nav-tabs">
    <li><a href="${ctx}/sys/unit/list1">单位列表</a></li>
    <li class="active"><a
            href="${ctx}/sys/unit/form?id=${unit.id}&area.id=${unit.area.id}">单位<shiro:hasPermission
            name="sys:unit:edit">${not empty unit.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission
            name="sys:unit:edit">查看</shiro:lacksPermission></a></li>
</ul>
<br/>
<form:form id="inputForm" modelAttribute="unit" action="${ctx}/sys/unit/save" method="post" class="form-horizontal">
    <form:hidden path="id"/>
    <sys:message content="${message}"/>
    <div class="control-group">
        <label class="control-label">上级单位:</label>
        <div class="controls">
            <sys:treeselect id="unit" name="parent.id" value="${unit.parent.id}" labelName="parent.name"
                            labelValue="${unit.parent.name}"
                            title="单位" url="/sys/unit/treeData" extId="${unit.id}" cssClass=""
                            allowClear="true"/>
        </div>
    </div>
     <div class="control-group">
        <label class="control-label">消防机构:</label>
        <div class="controls">
            <sys:treeselect id="office" name="office.id" value="${unit.office.id}" labelName="office.name"
                            labelValue="${unit.office.name}"
                            title="消防机构" url="/sys/office/treeData?type=1" cssClass="required"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">街道办:</label>
        <div class="controls">
            <sys:treeselect id="streetOffice" name="streetOffice.id" value="${unit.streetOffice.id}" labelName="streetOffice.name"
                            labelValue="${unit.streetOffice.name}"
                            title="街道办" url="/sys/office/treeData?type=2" />
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">归属区域:</label>
        <div class="controls">
            <sys:treeselect id="area" name="area.id" value="${unit.area.id}" labelName="area.name"
                            labelValue="${unit.area.name}"
                            title="区域" url="/sys/area/treeData" cssClass="required"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">单位名称:</label>
        <div class="controls">
            <form:input path="name" htmlEscape="false" maxlength="50" class="required"/>
            <span class="help-inline"><font color="red">*</font> </span>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">单位编码:</label>
        <div class="controls">
            <form:input path="code" htmlEscape="false" maxlength="50"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">所属行业:</label>
        <div class="controls">
            <form:select path="industry" class="input-large">
                <form:options items="${fns:getDictList('sys_industry')}" itemLabel="label" itemValue="value"
                              htmlEscape="false"/>
            </form:select>
        </div>
    </div>
     <div class="control-group">
        <label class="control-label">安防类型:</label>
        <div class="controls">
            <form:select path="securityType" class="input-large">
                <form:options items="${fns:getDictList('sys_security_type')}" itemLabel="label" itemValue="value"
                              htmlEscape="false"/>
            </form:select>
        </div>
    </div>
    
    <div class="control-group">
        <label class="control-label">是否可用:</label>
        <div class="controls">
            <form:select path="usable">
                <form:options items="${fns:getDictList('yes_no')}" itemLabel="label" itemValue="value"
                              htmlEscape="false"/>
            </form:select>
        </div>
    </div>
   
    <div class="control-group">
        <label class="control-label">联系地址:</label>
        <div class="controls">
            <form:input path="address" htmlEscape="false" maxlength="50"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">邮政编码:</label>
        <div class="controls">
            <form:input path="zipCode" htmlEscape="false" maxlength="50"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">单位负责人:</label>
        <div class="controls">
            <form:input path="master" htmlEscape="false" maxlength="50"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">单位电话:</label>
        <div class="controls">
            <form:input path="phone" htmlEscape="false" maxlength="50"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">安保负责人:</label>
        <div class="controls">
            <form:input path="securityUser" htmlEscape="false" maxlength="50"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">安保电话:</label>
        <div class="controls">
            <form:input path="securityPhone" htmlEscape="false" maxlength="50"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">传真:</label>
        <div class="controls">
            <form:input path="fax" htmlEscape="false" maxlength="50"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">邮箱:</label>
        <div class="controls">
            <form:input path="email" htmlEscape="false" maxlength="50"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">备注:</label>
        <div class="controls">
            <form:textarea path="remarks" htmlEscape="false" rows="3" maxlength="200" class="input-xlarge"/>
        </div>
    </div>
    
    <div class="form-actions">
        <shiro:hasPermission name="sys:unit:edit"><input id="btnSubmit" class="btn btn-primary" type="submit"
                                                           value="保 存"/>&nbsp;</shiro:hasPermission>
        <input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
    </div>
</form:form>
</body>
</html>