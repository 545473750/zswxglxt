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
	</tr>
<c:forEach var="obj" items="${page.result}" varStatus="vs">
	<tr class="${vs.count % 2 == 0 ? 'jg' : ''}" onMouseOver=this.className="highlight" onMouseOut=this.className="${vs.count % 2 == 0 ? 'jg' : ''}">
		<td align="center">
		
					<c:if test="${obj.checked==1 }">
						<input type="checkbox" name="items" value="${obj.id}"  checked="checked" disabled="disabled">
					</c:if>
					
					<c:if test="${obj.checked!=1 }">
						<input type="checkbox" name="items" value="${obj.id}"  >
					</c:if>
					
					
		</td>
		<td align="center">
					${page.thisPageFirstElementNumber + vs.index}
		</td>
		<td align="center">
					${obj.userNum}
		</td>
		<td align="center">
					${obj.username}
		</td>
	</tr>
</c:forEach>
</table>