<%@ page import="com.opendata.sys.model.*"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<s:hidden id="id" name="id" />
<table cellpadding="0" cellspacing="0" border="0" class="uiTable">
	<tr class="jg">
		<td width="10%" height="36" class="leftbor">
			编号*:
		</td>
		<td>
			<input type="text" value="${model.code}" id="code" name="code"
				datatype='string' max='400' tip='长度不能超过400' />
		</td>
	</tr>
	<tr>
		<td width="10%" height="36" class="leftbor">
			名称*:
		</td>
		<td>
			<input type="text" value="${model.name}" id="name" name="name"
				datatype='string' max='400' tip='长度不能超过400' />
		</td>
	</tr>
	<tr>
		<td width="10%" height="36" class="leftbor">
			用户名*:
		</td>
		<td>
			<input type="text" value="${model.username}" id="username" name="username"
				datatype='string' max='400' tip='长度不能超过400' />
		</td>
	</tr>
	<tr>
		<td width="10%" height="36" class="leftbor">
			 密码*:
		</td>
		<td>
			<input type="text" value="${model.password}" id="password" name="password"
				datatype='string' max='400' tip='长度不能超过400' />
		</td>
	</tr>
	<tr>
		<td width="10%" height="36" class="leftbor">
			 系统负责人: 
		</td>
		<td>
			<input type="text" value="${model.manager}" id="manager" name="manager"
				datatype='string' max='400' tip='长度不能超过400' />
		</td>
	</tr>
	<tr>
		<td width="10%" height="36" class="leftbor">
			联系方式:
		</td>
		<td>
			<input type="text" value="${model.phone}" id="phone" name="phone"
				datatype='string' max='400' tip='长度不能超过400' />
		</td>
	</tr>
	<tr class="jg">
		<td width="10%" height="36" class="leftbor">
			描述:
		</td>
		<td>
			<textarea rows="" cols="" style="width: 330px; height: 70px;" id="remark" name="remark">${model.remark}</textarea>
		</td>
	</tr>
</table>
