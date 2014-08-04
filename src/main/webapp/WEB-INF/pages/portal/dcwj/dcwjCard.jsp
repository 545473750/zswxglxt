<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<link href="${ctx}/${portal}/css/style.css" rel="stylesheet" type="text/css" />
	<script src="${ctx}/scripts/jquery-1.6.2.min.js" type="text/javascript"></script>
	<script src="${ctx}/scripts/app.js" type="text/javascript"></script>
	<script src="${ctx}/scripts/stmartFloat/smartFloat.js" type="text/javascript"></script>
	<script src="${ctx}/scripts/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
</head>

<body>
      <div class="mainleft">
          <table style="width: 100%">
          <ul>
     <c:forEach begin="0" end="3"  var="dcwj" items="${dcwjList}">
     	 <li><label title="${dcwj.spTitle}">
               <c:set var="spTitle" value="${fn:trim(dcwj.spTitle)}" />
                <c:choose> 
	                <c:when test="${fn:length(dcwj.spTitle)>14}"> 
	                	<a href="${ctx}/portal/Dcwj!view.do?spId=${dcwj.spId}" target="_blank">·<c:out value="${fn:substring(dcwj.spTitle,0,14)}..." /> </a>
	                </c:when> 
	                <c:otherwise> 
	                	<a href="${ctx}/portal/Dcwj!view.do?spId=${dcwj.spId}" target="_blank">·<c:out value="${dcwj.spTitle}" /></a>
	                </c:otherwise> 
                </c:choose> 
            </label></li>
         	</c:forEach></ul>
         </table>
      </div>
  
  
</body>
</html>
