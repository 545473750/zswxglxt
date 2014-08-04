<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!-- 实体表单-->
<table cellpadding="0" cellspacing="0" border="0" class="uiTable">
<tr class="jg" >
	<td width="10%" height="36" class="leftbor" >继教号：</td>
	<td>
		<input type="text" value="${model.userNum}" id="userNum" name="userNum"    datatype='string' max='20' ignore='ignore'  tip='长度不能超过20'/>
	</td>
</tr>
<tr  >
	<td width="10%" height="36" class="leftbor" >教师类型：</td>
	<td>
		<input type="text" value="${model.type}" id="type" name="type"    datatype='string' max='1' ignore='ignore'  tip='长度不能超过1'/>
	</td>
</tr>
<tr class="jg" >
	<td width="10%" height="36" class="leftbor" >创建人：</td>
	<td>
		<input type="text" value="${model.addUserId}" id="addUserId" name="addUserId"    datatype='string' max='32' ignore='ignore'  tip='长度不能超过32'/>
	</td>
</tr>
<tr  >
	<td width="10%" height="36" class="leftbor" >创建人姓名：</td>
	<td>
		<input type="text" value="${model.addUserName}" id="addUserName" name="addUserName"    datatype='string' max='100' ignore='ignore'  tip='长度不能超过100'/>
	</td>
</tr>
</table>         
