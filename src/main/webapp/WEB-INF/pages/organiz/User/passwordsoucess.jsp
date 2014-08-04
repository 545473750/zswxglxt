<%@ page contentType="text/html;charset=UTF-8" isErrorPage="true" %>
<%@ page import="org.apache.commons.logging.LogFactory" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
	<title>Error Page</title>
	<script language="javascript">
		function showDetail()
		{
			var elm = document.getElementById('detail_system_error_msg');
			if(elm.style.display == '') {
				elm.style.display = 'none';
			}else {
				elm.style.display = '';
			}
		}
	</script>
</head>
<body><br/><br/>
<div id="content" style="text-align: center;">
		<c:if test="${type==1}">
			<img alt="" src="../images/check48.png" align="absmiddle" /><font color="greed" size="8">${msg}</font><br/>
			请牢记你新修改的密码
		</c:if>
		<c:if test="${type==2}">
			<img alt="" src="<c:url value="images/check48.png"/>" /><font color="red" size="8">${msg}</font>
		</c:if>
		<c:if test="${type==3}">
			${msg}
		</c:if>
	<br>
</div>
</body>
</html>