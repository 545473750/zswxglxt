<%@ page import="com.opendata.organiz.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>岗位</title>
		<link href="${ctx}/${pattern}/css/main.css" rel="stylesheet"
			type="text/css" />
	</head>

<body>
	<form action="/organiz/Station!list.do" method="get">
	<div class="main">
	<div class="maintit">
				<h2>
					<img src="${ctx}/${pattern}/images/tabicon.gif" width="16"
						height="16" align="absmiddle" />
					岗位
				</h2>
				<h3>
					<a href="#" onclick="history.back(-1)">返回 &gt;&gt;</a>
				</h3>
			</div>
	
	<div class="centent" style="padding-top: 10px;">
		<s:hidden name="id" id="id" value="%{model.id}"/>
		<table cellpadding="0" cellspacing="0" border="0" class="uiTable">
			<tr class="jg">		
				<td width="10%" height="36" class="leftbor"><%=Station.ALIAS_ORGANIZATION_ID%></td>	
				<td><s:property value="%{model.orgString}" /></td>
			</tr>
			<tr>	
				<td><%=Station.ALIAS_NAME%></td>	
				<td ><s:property value="%{model.name}" /></td>
			</tr>
			<tr class="jg">		
				<td><%=Station.ALIAS_CODE%></td>	
				<td><s:property value="%{model.code}" /></td>
			</tr>
			<tr>	
				<td ><%=Station.ALIAS_LEVEL%></td>	
				<td ><s:property value="%{model.levelString}" /></td>
			</tr>
			<tr class="jg">	
				<td><%=Station.ALIAS_SEQUENCE%></td>	
				<td><s:property value="%{model.sequence}" /></td>
			</tr>
			<tr>	
				<td><%=Station.ALIAS_REMARK%></td>	
				<td><s:property value="%{model.remark}" /></td>
			</tr>
			<tr>	
				<td><%=Station.ALIAS_TS%></td>	
				<td><s:property value="%{model.ts}" /></td>
			</tr>
		</table>
		<div class="page">
					<input type="button" value="返回" class="but_shop"
						onclick="history.back(-1)" />
				</div>
	</div>
	</div>
	</form>
</body>
</html>