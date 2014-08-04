<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!-- 实体表单-->
<table cellpadding="0" cellspacing="0" border="0" class="uiTable">
<tr class="jg" >
	<td width="10%" height="36" class="leftbor" >创建时间：</td>
	<td>
		<input type="text" value="<fmt:formatDate value="${model.ts}" pattern="yyyy-MM-dd"/>" onclick='WdatePicker({isShowClear:true,readOnly:true})' id="ts" name="ts"    datatype='date'   tip='请选择日期'/>
	</td>
</tr>
</table>         
