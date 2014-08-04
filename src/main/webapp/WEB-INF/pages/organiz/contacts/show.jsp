<%@page import="com.opendata.organiz.model.*" %>
<%@page contentType="text/html;charset=UTF-8" %>
<%@include file="/commons/taglibs.jsp" %>

<rapid:override name="head">
	<title><%=User.TABLE_ALIAS%>信息</title>
</rapid:override>

<rapid:override name="content">
<body class="mainbody">
	
	<form action="/organiz/User!list.do" method="get">
	<!-- 无外边框内容区开始 -->
	<div class="wbkbox">
	<div class="main-wbktab">
	<ul>
		<li><a href="#"><img
			src="<c:url value="images/main_ico14.gif"/>" width="16" height="16"
			border="0" align="absmiddle" /><%=User.TABLE_ALIAS%></a></li>
	</ul>
	</div>
	<!-- TAB标签结束 -->
	<div class="main-wbkcon">
	<div class="wbk-tit"><span><img
		src="<c:url value="images/main_ico16.gif"/>" width="15" height="15" /></span><img
		src="<c:url value="images/main_ico15.gif"/>" width="16" height="16"
		align="absmiddle" /> <strong class="blue01"><%=User.TABLE_ALIAS%></strong></div>
	<div class="wbk-con">
		<s:hidden name="id" id="id" value="%{model.id}"/>
	
		<table class="table02">
		<!-- 	<tr>	
				<td height="44" align="right" class="trbor1"></td>	
				<td class="trbor1"><s:property value="%{model.password}" /></td>
			</tr> -->
			<tr>	
				<td height="44" align="right" class="trbor1"><%=User.ALIAS_USERNAME%></td>	
				<td class="trbor1"><s:property value="%{model.username}" /></td>
				<td rowspan="4">
					<s:if test="#request.attachment!=null">
						<img src="${requestScope.servletUrl}?id=${attachment.id}&clientId=${attachment.clientId}" width="140" height="187"/>
					</s:if>
					<s:else>
						<img src="${ctx}/images/no_photo.gif" width="140" height="187"/>
					</s:else>
				</td>
			</tr>
			<tr>	
				<td height="44" align="right" class="trbor1"><%=User.ALIAS_PHONE%></td>	
				<td class="trbor1"><s:property value="%{model.phone}" /></td>
			</tr>
			<tr>	
				<td height="44" align="right" class="trbor1"><%=User.ALIAS_QQ%></td>	
				<td class="trbor1"><s:property value="%{model.qq}" /></td>
			</tr>
			<tr>	
				<td height="44" align="right" class="trbor1"><%=User.ALIAS_MSN%></td>	
				<td class="trbor1"><s:property value="%{model.msn}" /></td>
			</tr>
			<tr>	
				<td height="44" align="right" class="trbor1"><%=User.ALIAS_WBLOG%></td>	
				<td class="trbor1"><s:property value="%{model.wblog}" /></td>
			</tr>
			<tr>	
				<td height="44" align="right" class="trbor1"><%=User.ALIAS_STATION%></td>	
				<td class="trbor1"><s:property value="%{model.stationString}" /></td>
			</tr>
			<tr>	
				<td height="44" align="right" class="trbor1"><%=User.ALIAS_DEPTS%></td>	
				<td class="trbor1">
					<s:property value="%{model.deptsString}"/>
				</td>
			</tr>
		</table>
		<div class="formControls" style="text-align: left;">
			<input type="button" value="返回" onclick="window.location='${ctx}/organiz/Contacts!list.do'"/>
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