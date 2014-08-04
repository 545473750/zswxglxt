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
               <table width="258" border="0" cellspacing="0" cellpadding="0">
        <c:forEach begin="0" end="0"  var="course" items="${courses}">
         	<tr>
         	<td width="112"><a href="#"><img src="${ctx}/${portal}/images/pic02.jpg" width="100" height="100" /></a></td>
         	
            <td width="146"><label title="${course.name}"> 
                <c:set var="name" value="${fn:trim(course.name)}" />
                <c:choose> 
	                <c:when test="${fn:length(course.name)>13}"> 
	                	<a href="${ctx}/portal/Yxcg!view.do?id=${course.id}" target="_blank"><c:out value="${fn:substring(course.name,0,13)}..." /> </a>
	                </c:when> 
	                <c:otherwise> 
	                	<a href="${ctx}/portal/Yxcg!view.do?id=${course.id}" target="_blank"><c:out value="${course.name}" /></a>
	                </c:otherwise> 
                </c:choose> 
            </label><br />         
            <label title="${course.description}"> 
                <c:set var="description" value="${fn:trim(course.description)}" />
                <c:choose> 
	                <c:when test="${fn:length(course.description)>40}"> 
	                	<c:out value="${fn:substring(course.description,0,40)}..." />
	                </c:when> 
	                <c:otherwise> 
	                	<c:out value="${course.description}" />
	                </c:otherwise> 
                </c:choose> 
            </label></td>
         		
         	</tr>
         	</c:forEach>
        </table>
         <table style="width: 100%">
         <ul>
     <c:forEach begin="1" end="4"  var="course" items="${courses}">
     	 <li><label title="${course.name}"> 
               <c:set var="name" value="${fn:trim(course.name)}" />
                <c:choose> 
	                <c:when test="${fn:length(course.name)>13}"> 
	                	<a href="${ctx}/portal/Yxcg!view.do?id=${course.id}" target="_blank">·<c:out value="${fn:substring(course.name,0,13)}..." /> </a>
	                </c:when> 
	                <c:otherwise> 
	                	<a href="${ctx}/portal/Yxcg!view.do?id=${course.id}" target="_blank">·<c:out value="${course.name}" /></a>
	                </c:otherwise> 
                </c:choose> 
            </label></li>
         	</c:forEach></ul>
         </table>
      </div>
  
</body>
</html>
