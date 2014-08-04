<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!-- 实体表单-->
<table cellpadding="0" cellspacing="0" border="0" width="100%">
<tr class="jg" >
	<td width="10%" height="36" class="leftbor" >名称：</td>
	<td>
		<input type="text" value="${model.name}" id="name" name="name"    datatype='string' max='100' ignore='ignore'  tip='长度不能超过100'/>
	</td>
</tr>
<tr  >
	<td width="10%" height="36" class="leftbor" >分类：</td>
	<td>
		<select id="userFlag" name="userFlag" datatype='*'  ignore='ignore' tip='请选择类型'>
        		<option value="" >---请选择---</option>
			<option value="1" <c:if test="${1 == model.userFlag }">selected="selected" </c:if>>申报课程专家</option>
			<option value="2" <c:if test="${2 == model.userFlag }">selected="selected" </c:if>>选单课程专家</option>
			<option value="3" <c:if test="${3 == model.userFlag }">selected="selected" </c:if>>组班专家</option>
		</select>
	</td>
</tr>
</table>         
