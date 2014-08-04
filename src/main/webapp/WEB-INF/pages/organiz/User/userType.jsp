<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<%@ page import="com.opendata.organiz.model.*" %>
<script type="text/javascript">
function updateType(action, radioName, form){
	if (!hasOneChecked(radioName)) {
				alert('请选择类别!');
				return;
			}else{
				form.action = action;
				form.submit();
				window.parent.closeDialog();
			}
	
}
</script>
<rapid:override name="head">
	<title>类别设置</title>
</rapid:override>

<rapid:override name="content">
<body class="mainbody">
<form id="listForm" name="listForm" action="<c:url value="/organiz/User!updatetype.do?ids=${uid}"/>" method="post" >
<input type="hidden" name="id" value='<s:property value="id"/>'>
<input type="hidden" name="partitionId" value="${partitionId}">
<!-- 无外边框内容区开始 -->
<div class="wbkbox">
<!-- TAB标签结束 -->
  <div class="main-wbkcon" style="height: 235px;">
    <div class="wbk-con" style="height:160px;">
    <table>
    	<tr><td><input type="radio" value="0" name="source"  />在编教师</td></tr>
    	<tr><td><input type="radio" value="1" name="source"  />非在编教师</td></tr>
    	<tr><td><input type="radio" value="2" name="source"  />外请教师</td></tr>
    	<tr><td><input type="radio" value="3" name="source"  />外请专家</td></tr>
    	<tr><td><input type="radio" value="4" name="source"  />外籍教师</td></tr>
    	<tr><td><input type="radio" value="5" name="source"  />外籍专家</td></tr>
    	 
    </table>
   
    <%--
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
	--%></div>
	<div class="formControls" style="padding-top: 5px;">
			<input id="submitButton" name="submitButton"  type="button" value="提交" onclick="updateType('${ctx}/organiz/User!updatetype.do?ids=${uid}','source',document.forms.listForm)"/>
			<input type="button" value="关闭" onclick="window.parent.closeDialog();"/>
		</div>
	  </div>
	</div>
	</form>
</body>
</rapid:override>

<%-- jsp模板继承,具体使用请查看: http://code.google.com/p/rapid-framework/wiki/rapid_jsp_extends --%>
<%@ include file="base.jsp" %>