<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

<rapid:override name="head">
	<title>选择图标</title>
  <script type="text/javascript">
<!--
function grantIcon(icon){
   window.parent.document.getElementById("icon").value='${iconPath}'+icon;
   window.parent.document.getElementById("bigIcon").value='${bigIconPath}'+icon;
   window.parent.document.getElementById("iconDiv").innerHTML='<img src="${ctx}/${iconPath}'+icon+'"/><input type="button" value="选择" onclick="openDialog(\'${ctx}/application/Application!getIcons.do?id=${item.id}\');"/>'
   window.parent.document.getElementById("bigIconDiv").innerHTML='<img src="${ctx}/${bigIconPath}'+icon+'"/>';
   window.parent.closeDialogNoRefresh();
}
//-->
</script>
</rapid:override>

<rapid:override name="content">
<body class="mainbody">
<input type="hidden" name="id" value='<s:property value="id"/>'>
<!-- 无外边框内容区开始 -->
<div class="wbkbox">
<!-- TAB标签结束 -->
  <div class="main-wbkcon" style="height: 100%;">
    <div class="wbk-con" >
			<c:forEach items="${icons}" var="item" varStatus="status">
				<input type="radio" onclick="grantIcon('${item}')" <c:if test="${fn:indexOf(model.icon,item) != -1}">checked</c:if> name="items" value="${item}">&nbsp;<img src="${ctx}/${iconPath}${item}"/>
				${status.count % 7 == 0 ? '<br/>' : '&nbsp;&nbsp;'}
			</c:forEach>
	</div>

</div>
</body>
</rapid:override>

<%-- jsp模板继承,具体使用请查看: http://code.google.com/p/rapid-framework/wiki/rapid_jsp_extends --%>
<%@ include file="base.jsp" %>