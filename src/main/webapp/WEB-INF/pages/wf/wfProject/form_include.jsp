<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!-- 实体表单-->
<table cellpadding="0" cellspacing="0" border="0" class="uiTable">
<tr class="jg" >
	<td width="14%" height="36" align="right" class="leftbor">名称：</td>
	<td width="86%">
		<input type="text" value="${model.name}" id="name" name="name" datatype='string' max='100' tip='长度不能超过100'/>
	</td>
</tr>
<tr>
	<td width="14%" height="36" align="right" class="leftbor" >流程类型：</td>
	<td>
		<select id="groupFlag" name="groupFlag" datatype="*" tip="请选择" nullmag="请选择类型">
			<option value="">--请选择--</option>
			<c:forEach items="${szz }" var = "s">
				<option value="${s.key }" <c:if test="${model.groupFlag == s.key }">selected="selected"</c:if> >${s.value }</option>
			</c:forEach>
		</select>
	</td>
</tr>
<tr class="jg">
	<td width="14%" height="36" align="right" class="leftbor" >描述：</td>
	<td>
		<textarea id="description" name="description"  cols="60" datatype='*' max='500' ignore='ignore'  tip='长度不能超过500'>${model.description}</textarea>
	</td>
</tr>
</table>         
