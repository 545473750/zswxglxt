<%@ page import="com.opendata.organiz.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

<s:hidden id="id" name="id" />
<table cellpadding="0" cellspacing="0" border="0" class="uiTable">
	<td width="15%" height="36" align="center" >所属部门：</td>
	<td>
		${organization.name }
		<input type="hidden" name="organizationId"  value="${organization.id }">
		<input type="hidden" name="deptId"  value="${query.deptId }">
	</td>
	
	<tr class="jg">
		<td width="10%" height="36" class="leftbor">
			岗位编号*:
		</td>
		<td>
			<input type="text" value="${model.code}" id="code" name="code" datatype='string' max='400' tip='长度不能超过400' />
		</td>
	</tr>
	<tr class="jg">
		<td width="10%" height="36" class="leftbor">
			 岗位名称*:
		</td>
		<td>
			<input type="text" value="${model.name}" id="name" name="name" datatype='string' max='400' tip='长度不能超过400' />
		</td>
	</tr>
	
	
	<tr class="jg">
		<td width="10%" height="36" class="leftbor">
			排序号:
		</td>
		<td>
			<input type="text" value="${model.sequence}" id="sequence" name="sequence" datatype='integer' max='400' tip='长度不能超过400' ignore="ignore" />
		</td>
	</tr>
	<tr class="jg">
		<td width="10%" height="36" class="leftbor">
			备注:
		</td>
		<td>
			<input type="text" value="${model.remark}" id="remark" name="remark" datatype='string' max='400' tip='长度不能超过400' ignore="ignore" />
		</td>
	</tr>
</table>
