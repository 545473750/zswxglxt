<%@ page import="com.opendata.sys.model.*"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>

<s:hidden id="id" name="id" />
<s:hidden id="icon" name="icon" />
<s:hidden id="bigIcon" name="bigIcon" />
<s:hidden id="queryParentId" name="queryParentId" />

<table cellpadding="0" cellspacing="0" border="0" class="uiTable">
	<c:if test="${empty  model.id}">
		<tr class="jg">
			<td>父菜单: </td>
			<td>${model.resources==null?'根节点':model.resources.name}</td>
		</tr>
	</c:if>
	<c:if test="${!empty  model.permission}">
		<tr class="jg">
			<td class="tdLabel">编码*:</td>
			<td>${model.permission.application.name}-${model.permission.name}</td>
		</tr>
	</c:if>
	<tr>
		<td width="15%" height="36" class="leftbor">编码*:</td>
		<td>
			<input type="text" value="${model.code}" id="code" name="code" datatype='string' max='400' tip='长度不能超过400' />
		</td>
	</tr>
	<tr class="jg">
		<td width="15%" height="36" class="leftbor">名称*:</td>
		<td>
			<input type="text" value="${model.name}" id="name" name="name" datatype='string' max='400' tip='长度不能超过400' />
		</td>
	</tr>
	<tr>
		<td width="15%" height="36" class="leftbor">排序号*:</td>
		<td>
			<input type="text" value="${model.sequence}" id="sequence" name="sequence" datatype='string' max='400' tip='长度不能超过400' />
		</td>
	</tr>
	<c:if test="${! empty model.type && model.type=='1'}">
		<tr>
			<td class="tdLabel">小图标: 	</td>
			<td>
				<input name="kind" type="radio" value="0" ${model.kind== '0'?'checked':''}/>否
				<input name="kind" type="radio" value="1" ${model.kind== '1'?'checked':''}/>是
			</td>
		</tr>
	</c:if>
	<tr class="jg">
		<td class="tdLabel">大图标: 
		</td>
		<td>
			<s:div label="%{@com.opendata.sys.model.Resources@ALIAS_ICON}" id="iconDiv">
				<c:if test="${model.icon!=null && model.icon!=''}">
				<img src="${ctx}/${model.icon}" />
				</c:if>
				<input type="button" value="选择" onclick="openDialog('${ctx}/application/Application!getIcons.do?id=${model.id}');" />
			</s:div>
		</td>
	</tr>
	<tr>
		<td class="tdLabel"><%=com.opendata.sys.model.Resources.ALIAS_BIG_ICON%>:
		</td>
		<td>
			<s:div label="%{@com.opendata.sys.model.Resources@ALIAS_BIG_ICON}" id="bigIconDiv">
			<c:if test="${model.bigIcon!=null && model.bigIcon!=''}">
			<img src="${ctx}/${model.bigIcon}" />
			</c:if>
			</s:div>
		</td>
	</tr>
</table>