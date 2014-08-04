<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!-- 实体表单-->
<table cellpadding="0" cellspacing="0" border="0" class="uiTable">
<tr class="jg" >
	<td width="10%" height="36" class="leftbor" >用户id：</td>
	<td>
		<input type="text" value="${model.userId}" id="userId" name="userId"    datatype='string' max='32' ignore='ignore'  tip='长度不能超过32'/>
	</td>
</tr>
<tr  >
	<td width="10%" height="36" class="leftbor" >录取状态：</td>
	<td>
		<input type="text" value="${model.admitState}" id="admitState" name="admitState"    datatype='string' max='1' ignore='ignore'  tip='长度不能超过1'/>
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
