<%@page import="com.opendata.sys.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<table cellpadding="0" cellspacing="0" border="0" class="uiTable">
	<tr class="jg">
		<td width="10%" height="36" class="leftbor">
			分区名称*: 
		</td>
		<td>
			<input type="text" value="${model.name}" id="name" name="name"
				datatype='string' max='400' tip='长度不能超过400' />
		</td>
	</tr>
	
	
	
	<tr>
		<td width="10%" height="36" class="leftbor">
			分区描述:
		</td>
		<td>
			<input type="text" value="${model.description}" id="description" name="description"
				datatype='string' max='400' tip='长度不能超过400' />
		</td>
	</tr>
</table>
