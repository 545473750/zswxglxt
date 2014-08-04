<%@page import="com.opendata.application.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

<rapid:override name="head">
	<title><%=Permission.TABLE_ALIAS%>信息</title>
	
</rapid:override>

<rapid:override name="content">
<body class="mainbody">
<form action="/application/Permission!list.do" method="get">

	<!-- 无外边框内容区开始 -->
	<div class="wbkbox">
	<div class="main-wbktab">
	<ul>
		<li><span><img
			src="<c:url value="images/main_ico14.gif"/>" width="16" height="16"
			border="0" align="absmiddle" /><%=Permission.TABLE_ALIAS%></span></li>
	</ul>
	</div>
	<!-- TAB标签结束 -->
	<div class="main-wbkcon">
	<div class="wbk-tit"><span><img
		src="<c:url value="images/main_ico16.gif"/>" width="15" height="15" /></span><img
		src="<c:url value="images/main_ico15.gif"/>" width="16" height="16"
		align="absmiddle" /> <strong class="blue01"><%=Permission.TABLE_ALIAS%></strong></div>
	<div class="wbk-con">
	
		
		
		<s:hidden name="id" id="id" value="%{model.id}"/>
	
		<table class="table02">
			<tr>	
				<td height="44" align="right" class="trbor1"><%=Permission.ALIAS_CODE%>：</td>	
				<td class="trbor1"><s:property value="%{model.code}" /></td>
			</tr>
			<tr>	
				<td height="44" align="right" class="trbor1"><%=Permission.ALIAS_NAME%>：</td>	
				<td class="trbor1"><s:property value="%{model.name}" /></td>
			</tr>
			<tr>	
				<td height="44" align="right" class="trbor1"><%=Permission.ALIAS_URL%>：</td>	
				<td class="trbor1"><s:property value="%{model.url}" /></td>
			</tr>
		    <tr>	
				<td height="44" align="right" class="trbor1"><%=Permission.ALIAS_SEQUENCE%>：</td>	
				<td class="trbor1"><s:property value="%{model.sequence}" /></td>
			</tr>
			<tr>	
				<td height="44" align="right" class="trbor1"><%=Permission.ALIAS_ICON%>：</td>	
				<td class="trbor1"><c:if test="${model.icon!=null && model.icon!=''}"><img src="${ctx}/${model.icon}"/></c:if></td>
			</tr>
			<tr>	
				<td height="44" align="right" class="trbor1"><%=Permission.ALIAS_BIGICON%>：</td>	
				<td class="trbor1"><c:if test="${model.bigIcon!=null && model.bigIcon!=''}"><img src="${ctx}/${model.bigIcon}"/></c:if></td>
			</tr>
			<tr>	
				<td height="44" align="right" class="trbor1"><%=Permission.ALIAS_DESCRIPTION%>：</td>	
				<td class="trbor1"><s:property value="%{model.description}" /></td>
			</tr>
		</table>
		<div clsss="formControls">
		<input type="button" value="后退" onclick="history.back();"/>
		</div>
	</div>
	</div>
	</div>
	</form>
	</body>
</rapid:override>

<%-- jsp模板继承,具体使用请查看: http://code.google.com/p/rapid-framework/wiki/rapid_jsp_extends --%>
<%@ include file="base.jsp" %>