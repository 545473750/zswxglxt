<%@ page import="com.opendata.organiz.model.*"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>

<s:hidden id="id" name="id" />
<s:hidden id="partitionId" name="partitionId" />

<table cellpadding="0" cellspacing="0" border="0" class="uiTable">
	<c:if test="${ empty  model.id}">
		<tr>
		<td width="15%" height="36" class="leftbor">编号*:</td>
		<td><input type="text" value="${model.code}" id="code" name="code" datatype='string' max='400' tip='长度不能超过400' /></td>
		</tr>
	</c:if>
	<c:if test="${!empty  model.id}">
		<tr>
		<td class="tdLabel">编号*:</td>
		<td>${model.code }</td>
		</tr>
	</c:if>
	<tr>
		<td width="15%" height="36" class="leftbor">角色名称*:</td>
		<td><input type="text" value="${model.name}" id="name" name="name" datatype='string' max='400' tip='长度不能超过400' /></td>
	</tr>
	<tr>
		<td width="15%" height="36" class="leftbor">描述:</td>
		<td>
			<textarea name="description" cols="" rows="" id="description" class="" style="width:355px;height:60px;">${model.description }</textarea>
		</td>
	</tr>
</table>