<%@page import="com.opendata.calendar.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

	<s:hidden id="id" name="id" />

<!-- ONGL access static field: @package.class@field or @vs@field -->
	
	<tr>	
		<td class="tdLabel">
			<%=SysCalendar.ALIAS_SYS_DATE%>：
		</td>	
		<td>
			${model.sysDate }
		</td>
	</tr>
	
	<tr>	
		<td class="tdLabel">
			<%=SysCalendar.ALIAS_STATE%>：
		</td>	
		<td>
			<select id="state" name="state"  style="width:158px;">
				<c:forEach items="${wrokStates }" var="item">
					<option value="${item.key }" <c:if test="${item.key ==model.state}" > selected="selected" </c:if> >${item.value }</option>
				</c:forEach>
			</select>
		</td>
	</tr>
	
	
	<tr>	
		<td class="tdLabel">
			<%=SysCalendar.ALIAS_REMARK%>：
		</td>	
		<td>
			<textarea rows="3" cols="17" id="remark" name="remark" class=" max-length-100 " >${model.remark}</textarea>
		</td>
	</tr>
	
	
	
