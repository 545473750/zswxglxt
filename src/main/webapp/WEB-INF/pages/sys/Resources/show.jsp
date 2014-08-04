<%@page import="com.opendata.sys.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>组织机构</title>
		<link href="${ctx}/${pattern}/css/main.css" rel="stylesheet"
			type="text/css" />
	</head>

<body>
<form action="/sys/Resources!list.do" method="get">
	<div class="main">
	<div class="maintit">
				<h2>
					<img src="${ctx}/${pattern}/images/tabicon.gif" width="16"
						height="16" align="absmiddle" />
					组织机构
				</h2>
				<h3>
					<a href="#" onclick="history.back(-1)">返回 &gt;&gt;</a>
				</h3>
			</div>
	
	<div class="centent" style="padding-top: 10px;">
		
		<s:hidden name="id" id="id" value="%{model.id}"/>
	
		<table cellpadding="0" cellspacing="0" border="0" class="uiTable">
			<tr>	
				<td height="44" align="right" class="trbor1"><%=Resources.ALIAS_NAME%></td>	
				<td class="trbor1"><s:property value="%{model.name}" /></td>
				<td height="44" align="right" class="trbor1"><%=Resources.ALIAS_CODE%></td>	
				<td class="trbor1"><s:property value="%{model.code}" /></td>
			</tr>
			<tr>	
				<td height="44" align="right" class="trbor1"><%=Resources.ALIAS_PARENT_ID%></td>	
				<td class="trbor1"><s:property value="%{model.resources.name}" /></td>
				<td height="44" align="right" class="trbor1"><%=Resources.ALIAS_PERMISSION_ID%></td>	
				<td class="trbor1"><s:property value="%{model.permission.name}" /></td>
			</tr>
			<tr>	
				<td height="44" align="right" class="trbor1"><%=Resources.ALIAS_ICON%></td>	
				<td class="trbor1"><c:if test="${model.icon!=null && model.icon!=''}"><img src="${ctx}/${model.icon}"/></c:if></td>
				<td height="44" align="right" class="trbor1"><%=Resources.ALIAS_BIG_ICON%></td>	
				<td class="trbor1"><c:if test="${model.bigIcon!=null && model.bigIcon!=''}"><img src="${ctx}/${model.bigIcon}"/></c:if></td>
			</tr>
			<tr>	
				<td height="44" align="right" class="trbor1"><%=Resources.ALIAS_TYPE%></td>	
				<td class="trbor1">${item.type=='1'?'菜单入口':(item.type=='2'?'功能入口':'目录')}</td>
				<td height="44" align="right" class="trbor1"><%=Resources.ALIAS_SEQUENCE%></td>	
				<td class="trbor1"><s:property value="%{model.sequence}" /></td>
			</tr>
			<tr>	
				<td height="44" align="right" class="trbor1"><%=Resources.ALIAS_TS%></td>	
				<td class="trbor1"><s:property value="%{model.ts}" /></td>
			</tr>

		</table>
		<div>
		<input type="button" value="后退" onclick="history.back();"/>
		</div>
	</div>
	</div>
	</form>
	</body>
</html>