<%@page import="com.opendata.sys.model.*" %>
  <%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags/simpletable" prefix="simpletable"%>
<%@ include file="/commons/taglibs.jsp"%>
<html>
<head></head>
<body>

<s:iterator value="menuActionList" id="mal">
    <span><s:property value="mal" /></span><br/>
</s:iterator>
</body>
</html>

