<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<%@ page import="com.opendata.organiz.model.*" %>

<rapid:override name="head">
	<title>角色授予</title>
</rapid:override>

<rapid:override name="content">
<body class="mainbody">
<form action="<c:url value="/organiz/User!grantRole.do"/>" method="post" >
<input type="hidden" name="id" value='<s:property value="id"/>'>
<input type="hidden" name="partitionId" value="${partitionId}">
<!-- 无外边框内容区开始 -->
<div class="wbkbox">
<!-- TAB标签结束 -->
  <div class="main-wbkcon" style="height: 235px;">
    <div class="wbk-con" style="height:160px;">
			<c:forEach items="${roles}" var="item" varStatus="status">
			<c:if test="${roleIdsByPartition!=null && roleIdsByPartition!=''}">
				<c:if test="${fn:indexOf(roleEd,item.id) != -1 && fn:indexOf(roleIdsByPartition,item.id) == -1}"><img src="<c:url value="images/apply.png"/>" width="14" height="15" border="0" align="absmiddle" /> <c:out value='${item.name}'/> <input type="hidden" name="items" value="${item.id}"></c:if>
				<c:if test="${fn:indexOf(roleEd,item.id) == -1 && fn:indexOf(roleIdsByPartition,item.id) == -1}"><c:out value='${item.name}'/> </c:if>
			</c:if>
			<c:if test="${roleIdsByPartition==null || fn:indexOf(roleIdsByPartition,item.id) != -1}">
				<input type="checkbox"  name="items" value="${item.id}" <c:if test="${fn:indexOf(roleEd,item.id) != -1}"> checked </c:if> >&nbsp;<c:out value='${item.name}'/>
			</c:if>
				${status.count % 4 == 0 ? '<br/>' : '&nbsp;&nbsp;'}
			</c:forEach>
	</div>
	<div class="formControls" style="padding-top: 5px;">
			<input id="submitButton" name="submitButton"  type="submit" value="提交" />
			<input type="button" value="关闭" onclick="window.parent.closeDialog();"/>
		</div>
	  </div>
	</div>
	</form>
</body>
</rapid:override>

<%-- jsp模板继承,具体使用请查看: http://code.google.com/p/rapid-framework/wiki/rapid_jsp_extends --%>
<%@ include file="base.jsp" %>