<%@ page import="com.opendata.organiz.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

<s:hidden id="id" name="id" />
<table cellpadding="0" cellspacing="0" border="0" class="uiTable">
	<td width="15%" height="36" align="center" >所属部门：</td>
	<td>
		${organization.name }
		<input type="hidden" name="orgId"  value="${organization.id }">
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
	
	<!-- 
	<tr class="jg">
		<td width="10%" height="36" class="leftbor">
			所属组织机构*:
		</td>
		<td>
		
			 <select id="organizationId" name="organizationId" datatype="*" nullmsg="请选择组织机构！" errormsg="请选择组织机构！">
				<option selected="selected" value="">--请选择--</option>
				<c:forEach items="${organizations}" var="item">
					<option value="${item.id}"
						<c:if test="${item.id==organizationId}"> selected="selected"</c:if> >
						${item.name}
					</option>
				</c:forEach>
			</select> 
		</td>
	</tr>
	
	<tr class="jg">
		<td width="10%" height="36" class="leftbor">
			 级别*:
		</td>
		<td>
		<select id="level" name="level" datatype="*" nullmsg="请选择级别！" errormsg="请选择级别！">
				<option selected="selected" value="">--请选择--</option>
				<c:forEach items="${stationLevelMap}" var="item">
					<option value="${item.key}"
						<c:if test="${item.key==level}"> selected="selected"</c:if>>
						${item.value}
					</option>
				</c:forEach>
			</select>
		</td>
	</tr>
	 -->
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
