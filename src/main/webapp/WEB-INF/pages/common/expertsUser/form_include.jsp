<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!-- 实体表单-->

<table width="100%" cellpadding="0" cellspacing="0" border="0">
	<tr>
	    <th width="30">
	  		<input type="checkbox" onclick="setAllCheckboxState('items',this.checked)" >
	    </th>
	  	<th width="50">序号</th>
	  	<th >继教号</th>
	  	<th >姓名</th>
	  	<th >单位</th>
	</tr>
<c:forEach var="obj" items="${page.result}" varStatus="vs">
	<tr class="${vs.count % 2 == 0 ? 'jg' : ''}" >
		<td align="center">
			<c:if test="${obj.user.checked==1 }">
				<input type="checkbox" value="${obj.userId}"  checked="checked" disabled="disabled">
			</c:if>
			
			<c:if test="${obj.user.checked!=1 }">
				<input type="checkbox" name="items" value="${obj.userId}"  >
			</c:if>
		</td>
		<td align="center">
					${page.thisPageFirstElementNumber + vs.index}
		</td>
		<td align="center">
					${obj.user.userNum}
		</td>
		<td align="center">
					${obj.user.username}
		</td>
		<td align="center">
					${obj.organization.name }
		</td>
	</tr>
</c:forEach>
</table>