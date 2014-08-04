<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!-- 实体表单-->
<table cellpadding="0" cellspacing="0" border="0" class="uiTable">
<tr class="jg" >
	<td width="10%" height="36" class="leftbor" >操作结果：</td>
	<td>
		<input type="text" value="${model.proResult}" id="proResult" name="proResult"    datatype='integer' ignore='ignore'  tip='请输入一个整数'/>
	</td>
</tr>
<tr  >
	<td width="10%" height="36" class="leftbor" >操作人：</td>
	<td>
		<input type="text" value="${model.addUserId}" id="addUserId" name="addUserId"    datatype='string' max='32' ignore='ignore'  tip='长度不能超过32'/>
	</td>
</tr>
<tr class="jg" >
	<td width="10%" height="36" class="leftbor" >创建人姓名：</td>
	<td>
		<input type="text" value="${model.addUserName}" id="addUserName" name="addUserName"    datatype='string' max='100' ignore='ignore'  tip='长度不能超过100'/>
	</td>
</tr>
<tr  >
	<td width="10%" height="36" class="leftbor" >操作备注：</td>
	<td>
		<input type="text" value="${model.remark}" id="remark" name="remark"    datatype='string' max='32' ignore='ignore'  tip='长度不能超过32'/>
	</td>
</tr>
</table>         
