<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!-- 实体表单-->
<table cellpadding="0" cellspacing="0" border="0" class="uiTable">
<tr class="jg" >
	<td width="10%" height="36" class="leftbor" >审核人：</td>
	<td>
		<input type="text" value="${model.userId}" id="userId" name="userId"    datatype='string' max='32' ignore='ignore'  tip='长度不能超过32'/>
	</td>
</tr>
<tr  >
	<td width="10%" height="36" class="leftbor" >审核意见：</td>
	<td>
		<input type="text" value="${model.opinion}" id="opinion" name="opinion"    datatype='string' max='1000' ignore='ignore'  tip='长度不能超过1000'/>
	</td>
</tr>
<tr class="jg" >
	<td width="10%" height="36" class="leftbor" >设和结果：</td>
	<td>
		<input type="text" value="${model.state}" id="state" name="state"    datatype='string' max='10' ignore='ignore'  tip='长度不能超过10'/>
	</td>
</tr>
</table>         
