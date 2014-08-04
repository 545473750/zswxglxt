<%@page import="com.opendata.application.model.*"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>应用</title>
		<link href="${ctx}/${pattern}/css/main.css" rel="stylesheet"
			type="text/css" />
	</head>
	<body>
		<form action="/application/Application!list.do" method="get">
				
				<div class="main">
				
				<div class="maintit">
				<h2>
					<img src="${ctx}/${pattern}/images/tabicon.gif" width="16"
						height="16" align="absmiddle" />
					应用
				</h2>
				<h3>
					<a href="#" onclick="history.back(-1)">返回 &gt;&gt;</a>
				</h3>
			</div>
				
				
				<div class="centent" style="padding-top: 10px;">
						<s:hidden name="id" id="id" value="%{model.id}" />

						<table cellpadding="0" cellspacing="0" border="0" class="uiTable">
							<tr class="jg">
								<td><%=Application.ALIAS_CODE%>：
								</td>
								<td >
									<s:property value="%{model.code}" />
								</td>
							</tr>
							<tr class="jg">
								<td ><%=Application.ALIAS_NAME%>：
								</td>
								<td>
									<s:property value="%{model.name}" />
								</td>
							</tr>
							<tr>
								<td ><%=Application.ALIAS_PROPERTY%>：
								</td>
								<td >
									<s:property value="%{appPropertyMap[model.property] }" />
								</td>
							</tr>
							<tr class="jg">
								<td><%=Application.ALIAS_TYPE%>：
								</td>
								<td>
									<s:property value="%{appTypeMap[model.type] }" />
								</td>
							</tr>
							<tr>
								<td><%=Application.ALIAS_ICON%>：
								</td>
								<td >
									<c:if test="${model.icon!=null && model.icon!=''}">
										<img src="${ctx}/${model.icon}" />
									</c:if>
								</td>
							</tr>
							<tr class="jg">
								<td><%=Application.ALIAS_BIG_ICON%>：
								</td>
								<td>
									<c:if test="${model.bigIcon!=null && model.bigIcon!=''}">
										<img src="${ctx}/${model.bigIcon}" />
									</c:if>
								</td>
							</tr>
							<tr>
								<td><%=Application.ALIAS_INITIALIZE_PAGE%>：
								</td>
								<td >
									<s:property value="%{model.initializePage}" />
								</td>
							</tr>
							<tr class="jg">
								<td ><%=Application.ALIAS_CONFIGURATION_PAGE%>：
								</td>
								<td >
									<s:property value="%{model.configurationPage}" />
								</td>
							</tr>
							<tr>
								<td ><%=Application.ALIAS_STATE%>：
								</td>
								<td >
									<s:property value="%{appStateMap[model.state]}" />
								</td>
							</tr>


							<tr class="jg">
								<td ><%=Application.ALIAS_CREATETIME%>：
								</td>
								<td >
									<s:property value="%{model.ts}" />
								</td>
							</tr>
							<tr>
								<td ><%=Application.ALIAS_DESCRIPTION%>：
								</td>
								<td>
									<s:property value="%{model.description}" />
								</td>
							</tr>
						</table>
						<div class="page">
					<input type="button" value="返回" class="but_shop"
						onclick="history.back(-1)" />
				</div>
				</div>
		</form>
	</body>
</html>