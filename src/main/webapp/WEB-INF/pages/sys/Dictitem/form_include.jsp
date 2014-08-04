<%@ page import="com.opendata.sys.model.*"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<s:hidden id="id" name="id" />
<table cellpadding="0" cellspacing="0" border="0" class="uiTable">

	<tr class="jg">
		<td width="10%" height="36" class="leftbor">
			字典名称:
		</td>
		<td>
			<input type="text" value="${model.name}" id="name" name="name"
				datatype='string' max='400' tip='长度不能超过400' />
		</td>
	</tr>
	<tr>
		<td width="10%" height="36" class="leftbor">
			字典编号：
		</td>
		<td>
			<input type="text" value="${model.code}" id="code"
				name="code" datatype='string' max='400' tip='长度不能超过400'
				 />
		</td>
	</tr>
	<tr class="jg">
	<td width="10%" height="36" class="leftbor">
			所属应用:
		</td>
	<td>
		<select id="applicationId" name="applicationId"  >
        			<option selected="selected" value="">--请选择--</option>
        			<c:forEach items="${applicationList}" var="item" >
        			<option value="${item.id}" <c:if test="${item.id==model.applicationId}"> selected="selected"</c:if>>${item.name}</option>
        			</c:forEach>
        		</select>
        </td>
	</tr>
	<tr>
		<td width="10%" height="36" class="leftbor">
			是否可编辑：
		</td>
		<td>
			<select name="editf" id="editf">
				<option value="0"
					<c:if test="${query.editf eq '0'}">selected='selected'</c:if>>
					可编辑
				</option>
				<option value="1"
					<c:if test="${query.editf eq '1'}">selected='selected'</c:if>>
					不可编辑
				</option>
			</select>
		</td>
	</tr>
	<tr class="jg">
		<td width="10%" height="36" class="leftbor">
			描述:
		</td>
		<td>
			<textarea rows="" cols="" style="width:330px;height:70px;" id="description" name="description">${description}</textarea>
		</td>
	</tr>

</table>
