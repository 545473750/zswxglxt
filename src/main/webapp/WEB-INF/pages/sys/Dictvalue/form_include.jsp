<%@page import="com.opendata.sys.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<table cellpadding="0" cellspacing="0" border="0" class="uiTable">

	<tr class="jg">
		<td width="15%" height="36" class="leftbor">
			字典值编号*:
		</td>
		<td>
			<input type="text" value="${model.code}" id="code" name="code" datatype='*' max='400' tip='长度不能超过400' />
		</td>
	</tr>
	<tr>
		<td width="10%" height="36" class="leftbor">
			字典值*: 
		</td>
		<td>
			<input type="text" value="${model.value}" id="value"
				name="value" datatype='*' max='400' tip='长度不能超过400'
				 />
		</td>
	</tr>
	
	<tr class="jg">
		<td width="10%" height="36" class="leftbor">
			描述:
		</td>
		<td>
			<textarea rows="" cols="" name="discription" id="discription" style="width:330px;height:70px;" value="${model.discription}" >${model.discription}</textarea>
		</td>
	</tr>

</table>
	<s:hidden id="id" name="id" />
	<s:hidden id="dictitemId" name="dictitemId" />
	<s:hidden id="nodetype" name="nodetype" />
	<input type="hidden" name="editable" value="${editable }"/>
	
