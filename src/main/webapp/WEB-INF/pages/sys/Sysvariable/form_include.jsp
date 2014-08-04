<%@ page import="com.opendata.sys.model.*"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>

<table cellpadding="0" cellspacing="0" border="0" class="uiTable">

	<tr class="jg">
		<td width="10%" height="36" class="leftbor">
			变量名称*:
		</td>
		<td>
			<input type="text" value="${model.name}" id="name" name="name"
				datatype='string' max='400' tip='长度不能超过400' />
		</td>
	</tr>
	<tr>
		<td width="10%" height="36" class="leftbor">
			变量值*:
		</td>
		<td>
			<input type="text" value="${model.code}" id="code" name="code"
				datatype='string' max='400' tip='长度不能超过400' />
		</td>
	</tr>
	<tr class="jg">
		<td width="10%" height="36" class="leftbor">
			所属应用:
		</td>
		<td>
			<select id="applicationId" name="applicationId" datatype="*" nullmsg="请选择所属应用！" errormsg="请选择所属应用！">
				<option selected="selected" value="">
					--请选择--
				</option>
				<c:forEach items="${applications}" var="item">
					<option value="${item.id}"
						<c:if test="${item.id==model.applicationId}"> selected="selected"</c:if>>
						${item.name}
					</option>
				</c:forEach>
			</select>
		</td>
	</tr>
	<tr class="jg">
		<td width="10%" height="36" class="leftbor">
			描述:
		</td>
		<td>
			<textarea rows="" cols="" style="width: 330px; height: 70px;" name="discription" id="discription" >${model.discription}</textarea>
		</td>
	</tr>

</table>
<s:hidden id="id" name="id" />
